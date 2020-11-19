clc; clear all;


z = randi([0,0],5)
z(1,1)=z(1,1)+1

% Menghitung titik berat x
pembilang = 0
for i = 1:5
    pembilangBaru = sum(z(:,i))*i
    pembilang = pembilang + pembilangBaru
end
x = pembilang/sum(z(:))

% Menghitung titik berat y
pembilang = 0
for i = 1:5
    pembilangBaru = sum(z(i,:))*i
    pembilang = pembilang + pembilangBaru
end
y = pembilang/sum(z(:))

% Plot
figure(1);
contour(z,'Fill','on')
hold on
plot(x,y,'rx')
colorbar
function [x,y] = TitikBerat(z)
% Menghitung titik berat x
pembilang = 0;
sizeZ = size(z);
for i = 1:sizeZ(2)
    pembilangBaru = sum(z(:,i))*i;
    pembilang = pembilang + pembilangBaru;
end
x = pembilang/sum(z(:));

% Menghitung titik berat y
pembilang = 0;
for i = 1:sizeZ(1)
    pembilangBaru = sum(z(i,:))*i;
    pembilang = pembilang + pembilangBaru;
end
y = pembilang/sum(z(:));
end
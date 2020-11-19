function [LuasArea,lat,lon] = Prediksi3()

% Eruption Date/Time: 26-07-2019/08.18UTC=08.20UTC
% Obs time: +13 Hours + 45 Minutes

% figure(1);
% worldmap([-7.5,-6.5],[107 108]);    % Koordinat di sekitar 
%                                       % Gunung Tangkuban Perahu
%                                 
% land = shaperead('landareas', 'UseGeoCoords', true); % Menampilkan daratan
% geoshow(land, 'FaceColor', [0.5 0.7 0.5]);
% 
% plot3m(-6.77,107.6,0,'r^'); % Letak Gunung Tangkuban Perahu
% hold on;

a = [-06-(46/60),107+(38/60)];
b = [-07-(04/60),107+(15/60)];
c = [-06-(49/60),107+(09/60)];
d = [-06-(44/60),107+(37/60)];

% plotm(a(1),a(2),'rs'); % Kotak Merah
% hold on;
% plotm(b(1),b(2),'gs'); % Kotak Hijau
% hold on;
% plotm(c(1),c(2),'bs'); % Kotak Biru
% hold on;
% plotm(d(1),d(2),'ks'); % Kotak Hitam
% hold on;

abcd1 = [a(1) b(1) c(1) d(1) a(1)];
abcd2 = [a(2) b(2) c(2) d(2) a(2)];
linem(abcd1,abcd2,'b-');

LuasArea = 0;
lon = [];
lat = [];
for x = min(abcd2):0.02:max(abcd2)
    for y = min(abcd1):0.02:max(abcd1)
        
        % persamaan garis hijau-merah
        x1 = b(2);
        x2 = a(2);
        y1 = b(1);
        y2 = a(1);
        Y1 = PersamaanGaris(x,x1,x2,y1,y2);
        
        % persamaan garis biru-hitam
        x1 = c(2);
        x2 = d(2);
        y1 = c(1);
        y2 = d(1);
        Y2 = PersamaanGaris(x,x1,x2,y1,y2);
        
        % persamaan garis biru-hijau
        y1 = c(1);
        y2 = b(1);
        x1 = c(2);
        x2 = b(2);
        X1 = PersamaanGaris(y,y1,y2,x1,x2);
        
        % persamaan garis hitam merah
        y1 = d(1);
        y2 = a(1);
        x1 = d(2);
        x2 = a(2);
        X2 = PersamaanGaris(y,y1,y2,x1,x2);
        
        if and(y>=Y1,y<=Y2) & and(x>=X1,x<=X2) 
%             plotm(y,x,'k.');
%             hold on;
            LuasArea = LuasArea + 1;
            lon(LuasArea) = x;
            lat(LuasArea) = y;
        end
    end
end

UkuranMatriks = 51;
A = randi([0,0],UkuranMatriks);
for partikel=1:LuasArea
    % Menentukan kolom matriks
    x = lon(partikel);
    x1 = 107;
    x2 = 108;
    y1 = 1;
    y2 = UkuranMatriks;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    j = uint8(y);
    
    % Menentukan baris matriks
    x = lat(partikel);
    x1 = -6.5;
    x2 = -7.5;
    y1 = 1;
    y2 = UkuranMatriks;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    i = uint8(y); 

    A(i,j) = A(i,j) + 1;
end

% figure(2)
% contour(A);

%% Menghitung Titik Berat
[i,j] = TitikBerat(A);

% Menentukan kolom matriks
x = i;
y1 = 107;
y2 = 108;
x1 = 1;
x2 = UkuranMatriks;
y = PersamaanGaris(x,x1,x2,y1,y2);
lon = y;

% Menentukan baris matriks
x = j;
y1 = -6.5;
y2 = -7.5;
x1 = 1;
x2 = UkuranMatriks;
y = PersamaanGaris(x,x1,x2,y1,y2);
lat = y; 

end
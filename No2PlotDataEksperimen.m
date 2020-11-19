clc; clear all;

%% Membaca hasil eksperimen
filename = 'hasil simulasi.xlsx';
sheet = 3;
xlRange = 'A2:A5001';
lon = xlsread(filename,sheet,xlRange);
lon = round(lon,2);
xlRange = 'B2:B5001';
lat = xlsread(filename,sheet,xlRange);
lat = round(lat,2);
xlRange = 'C2:C5001';
alt = xlsread(filename,sheet,xlRange);
alt = round(alt,2);

UkuranMatriks = 101;
A = randi([0,0],UkuranMatriks);
B = randi([0,0],UkuranMatriks);
for partikel=1:5000
    % Menentukan kolom matriks
    x = lon(partikel);
    x1 = 106.75;
    x2 = 108.25;
    y1 = 1;
    y2 = UkuranMatriks;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    j = uint8(y);
    
    % Menentukan baris matriks
    x = lat(partikel);
    x1 = -7.75;
    x2 = -6.25;
    y1 = 1;
    y2 = UkuranMatriks;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    i = uint8(y); 

    A(i,j) = A(i,j) + 1;
    B(i,j) = 1;
end


%% Luas Area Simulasi
LuasAreaSimulasi = sum(B(:));
        
%% Membuat peta
figure(2);
worldmap([-7.5,-6.5],[107,108]);
land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(land, 'FaceColor', [0 0.75 0]);
hold on;
plotm(-6.77,107.6,'^',....
    'Color',[0.5,0,0],...
    'MarkerFaceColor',[0.5,0,0]);
hold on;

%% Plot Partikel pada peta

for partikel = 10:10:5000
    
    x = lon(partikel);
    x1 = 106.75;
    x2 = 108.25;
    y1 = 1;
    y2 = UkuranMatriks;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    j = uint8(y);
    
    % Menentukan baris matriks
    x = lat(partikel);
    x1 = -7.75;
    x2 = -6.25;
    y1 = 1;
    y2 = UkuranMatriks;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    i = uint8(y); 
    
    cr = 1-(A(i,j)/max(A(:)));
    plotm(lat(partikel),lon(partikel),'.','Color',[cr,cr,cr]); 
    hold on;
end

%% Menghitung Titik Berat
[i,j] = TitikBerat(A);

% Menentukan kolom matriks
x = i;
y1 = 106.75;
y2 = 108.25;
x1 = 1;
x2 = UkuranMatriks;
y = PersamaanGaris(x,x1,x2,y1,y2);
lon = y;

% Menentukan baris matriks
x = j;
y1 = -7.75;
y2 = -6.25;
x1 = 1;
x2 = UkuranMatriks;
y = PersamaanGaris(x,x1,x2,y1,y2);
lat = y; 

plotm(lat,lon,'rs'); 
LatSimulasi = lat;
LonSimulasi = lon;

%% Laporan BMKG
a = [-06-(46/60),107+(38/60)];
b = [-07-(04/60),107+(15/60)];
c = [-06-(49/60),107+(09/60)];
d = [-06-(44/60),107+(37/60)];

% Plot Laporan BMKG
linem([a(1) b(1) c(1) d(1) a(1)], [a(2) b(2) c(2) d(2) a(2)],'b-');
hold on;

[LuasAreaPrediksi,LatPrediksi,LonPrediksi] = Prediksi3()
LuasAreaSimulasi,LatSimulasi,LonSimulasi 

plotm(LatPrediksi,LonPrediksi,'bs');

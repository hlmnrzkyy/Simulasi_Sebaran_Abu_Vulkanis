clc; clear all;

%% Membaca hasil eksperimen
filename = 'hasil simulasi.xlsx';
sheet = 1;
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

lon2 = [];
lat2 = [];
alt2 = [];
areaKeN = 1;
for partikel=1:5000
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
    
    if A(i,j) == 1
        lon2(areaKeN) = lon(partikel);
        lat2(areaKeN) = lat(partikel);
        alt2(areaKeN) = alt(partikel);
        areaKeN = areaKeN + 1;
        B(i,j) = 1;
    end    
end


%% Luas Area Simulasi
LuasAreaSimulasi = sum(B(:));
        
%% Membuat peta
figure(2);
worldmap([-8,-6],[104.5,108]);
land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(land, 'FaceColor', [0.6 0.6 0.6],'EdgeColor',[0.6 0.6 0.6]);
hold on;
plotm(-6.77,107.6,'^',....
    'Color',[0,0,0]);
hold on;

%% Plot Partikel pada peta
for partikel = 1:length(lon2)
    partikel
    
    x = lon2(partikel);
    x1 = 107;
    x2 = 108;
    y1 = 1;
    y2 = UkuranMatriks;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    j = uint8(y);
    
    % Menentukan baris matriks
    x = lat2(partikel);
    x1 = -6.5;
    x2 = -7.5;
    y1 = 1;
    y2 = UkuranMatriks;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    i = uint8(y);
    
    if and(alt2(partikel) < (max(alt2)/2),alt2(partikel) > 0)
        k = 1-(alt2(partikel)/(max(alt2)/2));
        r = 1-k;
        g = 1;
        b = 0;
    elseif alt2(partikel) >= (max(alt2)/2) 
        pembilang = alt2(partikel) - (max(alt2)/2);
        penyebut = alt2(partikel) - (max(alt2)/2);
        k = 1-(pembilang/penyebut);
        r = 1;
        g = k;
        b = 0;
    else
        r = 0;
        g = 1;
        b = 0;
    end
    
    plotm(lat2(partikel),lon2(partikel),'.','Color',[r,g,b]); 
    hold on;
end

%% Menghitung Titik Berat
[i,j] = TitikBerat(B);

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

plotm(lat,lon,'kx'); 
LatSimulasi = lat;
LonSimulasi = lon;

%% Laporan BMKG
a = [-06-(47/60),107+(37/60)];
b = [-06-(52/60),107+(14/60)];
c = [-06-(47/60),107+(13/60)];
d = [-06-(45/60),107+(37/60)];

% Plot Laporan BMKG
linem([a(1) b(1) c(1) d(1) a(1)], [a(2) b(2) c(2) d(2) a(2)],...
    'LineStyle',':','MarkerFaceColor','B');
hold on;

[LuasAreaPrediksi,LatPrediksi,LonPrediksi] = Prediksi1()
LuasAreaSimulasi,LatSimulasi,LonSimulasi 
KonsentrasiMaksimal = max(A(:))

plotm(LatPrediksi,LonPrediksi,'bx');
hold on;

%% Legenda

textm(-7.75,104.55,'the altitude of particle (meter):',...
    'HorizontalAlignment','left')
textm(-7.85,104.55,num2str(0),...
    'HorizontalAlignment','center')
textm(-7.85,105,num2str(round(max(alt2)/2,0)),...
    'HorizontalAlignment','left')
textm(-7.85,105.45,num2str(round(max(alt2),0)),...
    'HorizontalAlignment','left')

for lon = 104.55:0.01:105
    x = lon;
    y1 = 1;
    y2 = 0;
    x1 = 104.55;
    x2 = 105;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    k = y;
    r = 1-k;
    g = 1;
    b = 0;
    plotm(-7.95,lon,'ks','Marker','Square',...
        'MarkerFaceColor',[r,g,b],...
        'Color',[r,g,b])
    hold on;
end

for lon = 105:0.01:105.45
    x = lon;
    y1 = 1;
    y2 = 0;
    x1 = 105;
    x2 = 105.45;
    y = PersamaanGaris(x,x1,x2,y1,y2);
    k = y;
    r = 1;
    g = k;
    b = 0;
    plotm(-7.95,lon,'ks','Marker','Square',...
        'MarkerFaceColor',[r,g,b],...
        'Color',[r,g,b])
    hold on;
end

%% Menghitung Simpangan Sudut:

% LonAwal = 107.6
% LatAwal = -6.77
% 
% SelisihLonPrediksi = LonPrediksi-LonAwal
% SelisihLatnPrediksi = LatPrediksi-LatAwal
% 
% if and(SelisihLonPrediksi<0,SelisihLatnPrediksi<0)
%     ArahPrediksi =...
%         rad2deg(atan(abs(SelisihLonPrediksi)/abs(SelisihLatnPrediksi)))
% elseif and(SelisihLonPrediksi<0,SelisihLatnPrediksi>0)
%      ArahPrediksi =...
%         rad2deg(atan(abs(SelisihLonPrediksi)/abs(SelisihLatnPrediksi)))
%     ArahPrediksi = 180 - ArahPrediksi
% end
% 
% SelisihLonSimulasi = LonSimulasi-LonAwal
% SelisihLatSimulasi = LatSimulasi-LatAwal
% 
% if and(SelisihLonSimulasi<0,SelisihLatSimulasi<0)
%     ArahSimulasi =...
%         rad2deg(atan(abs(SelisihLonSimulasi)/abs(SelisihLatSimulasi)))
% elseif and(SelisihLonSimulasi<0,SelisihLatSimulasi>0)
%     ArahSimulasi =...
%         rad2deg(atan(abs(SelisihLonSimulasi)/abs(SelisihLatSimulasi)))
%     ArahSimulasi = 180 - ArahSimulasi
% end
% 
% SimpanganSudut = ArahSimulasi-ArahPrediksi
% 
% textm(-6.05,104.55,'Simpangan Sudut (derajat):',...
%     'HorizontalAlignment','left')
% textm(-6.15,104.55,num2str(SimpanganSudut),...
%     'HorizontalAlignment','left')
% 
%% Menghitung Perbandingan Luas

% PerbandnganLuas = LuasAreaSimulasi/LuasAreaPrediksi
% 
% textm(-6.05,107.95,'Perbandingan Luas:',...
%     'HorizontalAlignment','right')
% textm(-6.15,107.95,num2str(PerbandnganLuas),...
%     'HorizontalAlignment','right')
%
%% Legenda

% plotm(-7.95,106.5,'kx')
% textm(-7.95,106.55,': Titik Berat Simulasi',...
%     'HorizontalAlignment','left')
% 
% plotm(-7.85,106.5,'gs')
% textm(-7.85,106.55,': Luas Area Simulasi',...
%     'HorizontalAlignment','left')
% 
% plotm(-7.75,106.5,'bx')
% textm(-7.75,106.55,': Titik Berat Laporan BMKG',...
%     'HorizontalAlignment','left')
% 
% plotm(-7.65,106.5,'bs')
% textm(-7.65,106.55,': Luas Area Laporan BMKG',...
%     'HorizontalAlignment','left')
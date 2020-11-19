%% Bersihkan Memory
clc; clear all;

%% Info singkat mengenai erupsi gunung tangkuban Perahu
%
% Tinggi puncak gunung:
%   2084 mdpl
%
% Tinggi Kolom Abu
%   2284 mdpl
% 
% Waktu Erupsi
%   26 Juli 2019
%   08.18 UTC = 15.48 WIB
%   Sekitar 08.20 UTC = 15.50
% 
% Laporan BMKG:
%   10.05 UTC = 17.05 WIB -> + 1 jam 45 menit
%   16.05 UTC = 23.05 WIB -> + 7 jam 45 menit
%   22.05 UTC = 05.05 WIB -> + 13 jam 45 menit

%% Data prediksi medan angin GFS 26-07-2019, 6 UTC
sheet = 1;

% 0 m:
% Arah Angin:
aa00 = xlsread("GFS Forecast.xlsx",5,"A1:E3",'basic');
% kecepatan angin:
ka00 = xlsread("GFS Forecast.xlsx",5,"A1:E3",'basic');

% 760 m:
% Arah Angin:
aa01 = xlsread("GFS Forecast.xlsx",sheet,"B4:F6",'basic');
% kecepatan angin:
ka01 = xlsread("GFS Forecast.xlsx",sheet,"I4:M6",'basic');

% 1460 m:
% Arah Angin:
aa02 = xlsread("GFS Forecast.xlsx",sheet,"B11:F13",'basic');
% kecepatan angin:
ka02 = xlsread("GFS Forecast.xlsx",sheet,"I11:M13",'basic');

% 3000 m:
% Arah Angin:
aa03 = xlsread("GFS Forecast.xlsx",sheet,"B18:F20",'basic');
% kecepatan angin:
ka03 = xlsread("GFS Forecast.xlsx",sheet,"I18:M20",'basic');

%% Data prediksi medan angin GFS 26-07-2019, 12 UTC

sheet = 2;

% 0 m:
% Arah Angin:
aa00 = xlsread("GFS Forecast.xlsx",5,"A1:E3",'basic');
% kecepatan angin:
ka00 = xlsread("GFS Forecast.xlsx",5,"A1:E3",'basic');

% 760 m:
% Arah Angin:
aa04 = xlsread("GFS Forecast.xlsx",sheet,"B4:F6",'basic');
% kecepatan angin:
ka04 = xlsread("GFS Forecast.xlsx",sheet,"I4:M6",'basic');

% 1460 m:
% Arah Angin:
aa05 = xlsread("GFS Forecast.xlsx",sheet,"B11:F13",'basic');
% kecepatan angin:
ka05 = xlsread("GFS Forecast.xlsx",sheet,"I11:M13",'basic');

% 3000 m:
% Arah Angin:
aa06 = xlsread("GFS Forecast.xlsx",sheet,"B18:F20",'basic');
% kecepatan angin:
ka06 = xlsread("GFS Forecast.xlsx",sheet,"I18:M20",'basic');

%% Data prediksi medan angin GFS 26-07-2019, 18 UTC

sheet = 3;

% 0 m:
% Arah Angin:
aa00 = xlsread("GFS Forecast.xlsx",5,"A1:E3",'basic');
% kecepatan angin:
ka00 = xlsread("GFS Forecast.xlsx",5,"A1:E3",'basic');

% 760 m:
% Arah Angin:
aa07 = xlsread("GFS Forecast.xlsx",sheet,"B4:F6",'basic');
% kecepatan angin:
ka07 = xlsread("GFS Forecast.xlsx",sheet,"I4:M6",'basic');

% 1460 m:
% Arah Angin:
aa08 = xlsread("GFS Forecast.xlsx",sheet,"B11:F13",'basic');
% kecepatan angin:
ka08 = xlsread("GFS Forecast.xlsx",sheet,"I11:M13",'basic');

% 3000 m:
% Arah Angin:
aa09 = xlsread("GFS Forecast.xlsx",sheet,"B18:F20",'basic');
% kecepatan angin:
ka09 = xlsread("GFS Forecast.xlsx",sheet,"I18:M20",'basic');


%% Data prediksi medan angin GFS 27-07-2019, 0 UTC

sheet = 4;

% 0 m:
% Arah Angin:
aa00 = xlsread("GFS Forecast.xlsx",5,"A1:E3",'basic');
% kecepatan angin:
ka00 = xlsread("GFS Forecast.xlsx",5,"A1:E3",'basic');

% 760 m:
% Arah Angin:
aa10 = xlsread("GFS Forecast.xlsx",sheet,"B4:F6",'basic');
% kecepatan angin:
ka10 = xlsread("GFS Forecast.xlsx",sheet,"I4:M6",'basic');

% 1460 m:
% Arah Angin:
aa11 = xlsread("GFS Forecast.xlsx",sheet,"B11:F13",'basic');
% kecepatan angin:
ka11 = xlsread("GFS Forecast.xlsx",sheet,"I11:M13",'basic');

% 3000 m:
% Arah Angin:
aa12 = xlsread("GFS Forecast.xlsx",sheet,"B18:F20",'basic');
% kecepatan angin:
ka12 = xlsread("GFS Forecast.xlsx",sheet,"I18:M20",'basic');

%% Program Utama
x = double([]);
y = double([]);
h = double([]);
Vst = double([]);
banyakPartikel = 5000;

%% Inisiasi partikel-partiklenya
for partikel = 1:banyakPartikel % bisa diubah
    t = double(8 + 5/6); % Pukul 08.50 UTC
    dt = 300; % Selang waktu 300 detik/5 menit
    x(partikel) = double(107.6); % Longitude
    y(partikel) = double(-6.77); % Latitude
    h(partikel) = double((randi([2084,2284],1)));% Altitude
    Kh = 3500; % Koefisien difusi Horizontal
    Kv = 10; % Koefisien difusi Vertikal
    d = double(random('Normal',125,500)); % Diameter Abu Vulkanis
    d = double(abs(d)); % Diameter Abu Vulkanis
    d = double(d/1000000); % Diameter abu vulkanis
    Cst = double(120000000); % Koefisien Stokes
    r = double(d/2);  % Jari-jari abu bulkanis
    Vst(partikel) = double(Cst*r*r); % Kecepatan Terminal jatuh
end

%% Loop waktu
for waktu = 1:165 % bisa diubah
    
    % Loop sebaran partikel 
    for partikel = 1:banyakPartikel
        
        % Memilih kecepatan dan arah angin:
        [ArahAngin,KecepatanAngin] = ...
            InterpolasiAngin2(...
            aa00,ka00,...
            aa01,ka01,...
            aa02,ka02,...
            aa03,ka03,...
            aa04,ka04,...
            aa05,ka05,...
            aa06,ka06,...
            aa07,ka07,...
            aa08,ka08,...
            aa09,ka09,...
            aa10,ka10,...
            aa11,ka11,...
            aa12,ka12,...
            x,y,h,t,partikel);
        
        %% Faktor Koreksi
        FaktorKoreksi = -14.75;
        ArahAngin = ArahAngin + FaktorKoreksi;
        
        % Konversi kecepatan partikel dari 'knot' ke 'm/s'
        KecepatanAngin = double(KecepatanAngin*0.514444);
        
        % Koreksi parameter-parameter partikel pada h = 0 m 
        if h(partikel) < 0
            h(partikel) = double(0);
            KecepatanAngin = double(0);
            ArahAngin = 0;
            Kh = 0;
        end
        
        %% Perubahan Posisi pada sumbu z 
        % Perbarui posisi partikel
        dh = double(-(Vst(partikel)*dt));
        
        % Perubahan posisi karena difusi turbulensi
        
        % Perpindahan posisi
        h(partikel) = double(h(partikel) + dh);
        
        %% Perubahan Posisi pada sumbu x
        % Perubahan posisi partikel karena angin pada
        xSpdCoef = double((-1)*sin(deg2rad(ArahAngin))); % Koefisien
        xSpd = double(KecepatanAngin*xSpdCoef); % Kecepatan Angin
        dx = double(xSpd*dt); % Perpindahan
        
        % Perubahan posisi karena difusi turbulensi
        SigmaX = sqrt(2*Kh*dt); % Sigma x
        RNG = double(randi([-5,5],1)/10); % Angka acak antara -0.5 sampai 0.5
        Zx = double(2*sqrt(3)*SigmaX*RNG); % Perpindahan Acak
        dx = double(dx + Zx);

%         % Difusi Turbulen
%         Zx = sqrt(2*Kh);
%         mu = 0;
%         sigma = sqrt(dt);
%         dWx = random('Normal',mu,sigma);
%         dx = dx + double(Zx*dWx);
        
        % Perpindahan posisi pada permukaan bumi dalam derajat
        dx = double(dx/1000);
        dx = double(km2deg(dx));
        dx = double(dx/cos(deg2rad(y(partikel))));
        x(partikel) = double(x(partikel)+dx);
        
        %% Perubahan Posisi pada sumbu y
        % Perubahan posisi partikel karena angin
        ySpdCoef = double((-1)*cos(deg2rad(ArahAngin))); % Koefisien
        ySpd = double(KecepatanAngin*ySpdCoef); % Kecepatan Angin
        dy = double(ySpd*dt); % Perpindahan
        
        % Perubahan posisi karena difusi turbulensi
        SigmaY = sqrt(2*Kh*dt); % Sigma y
        RNG = double(randi([-5,5],1)/10); % Angka acak antara -0.5 sampai 0.5
        Zy = double(2*sqrt(3)*SigmaY*RNG); % Perpindahan Acak
        dy = double(dy + Zy);
        
%         % Difusi Turbulen
%         Zy = sqrt(2*Kh);
%         mu = 0;
%         sigma = sqrt(dt);
%         dWy = random('Normal',mu,sigma);
%         dy = dy + double(Zy*dWy);

        % Perpindahan posisi pada permukaan bumi dalam derajat 
        dy = double(dy/1000);
        dy = double(km2deg(dy));
        y(partikel) = double(y(partikel)+dy);
        
    end
    
    if waktu == 21
        %% Plot +1 jam 45 menit
        subplot(2,2,2)
        title('Plot +1 jam 45 menit');
        maxLat = max(y);
        minLat = min(y);
        maxLon = max(x);
        minLon = min(x);
        worldmap([min(y)-0.5,max(y)+0.5],[min(x)-0.5,max(x)+0.5]);                                                    
        land = shaperead('landareas', 'UseGeoCoords', true);                                                             % daratan
        geoshow(land, 'FaceColor', [0.5 0.7 0.5]);
        plotm(-6.77,107.6,'r^','MarkerFaceColor','r');                                                     % Perahu
        hold on;

        plotm(y,x,'k.'); 
        hold on;

        plotm(-6.77,107.6,'r^') % Letak Gunung Tangkuban Perahu
        hold on;
        
        a = [-06-(47/60),107+(37/60)];
        b = [-06-(52/60),107+(14/60)];
        c = [-06-(47/60),107+(13/60)];
        d = [-06-(45/60),107+(37/60)];

        linem([a(1) b(1) c(1) d(1) a(1)], [a(2) b(2) c(2) d(2) a(2)],'b-');
        
        % Simpan di Excel
        filename = 'hasil simulasi.xlsx';
        sheet = 1;
        xlRange = 'A2:A5001';
        xlswrite(filename,x',sheet,xlRange);
        xlRange = 'B2:B5001';
        xlswrite(filename,y',sheet,xlRange);
        xlRange = 'C2:C5001';
        xlswrite(filename,h',sheet,xlRange);
    elseif waktu == 93
        %% Plot +7 jam 45 menit
        subplot(2,2,3)
        title('Plot +7 jam 45 menit');
        maxLat = max(y);
        minLat = min(y);
        maxLon = max(x);
        minLon = min(x);
        worldmap([min(y)-0.5,max(y)+0.5],[min(x)-0.5,max(x)+0.5]);                                                    
        land = shaperead('landareas', 'UseGeoCoords', true);                                                             % daratan
        geoshow(land, 'FaceColor', [0.5 0.7 0.5]);
        plotm(-6.77,107.6,'r^','MarkerFaceColor','r');                                                     % Perahu
        hold on;

        plotm(y,x,'k.'); 
        hold on;
        
        plotm(-6.77,107.6,'r^') % Letak Gunung Tangkuban Perahu
        hold on;
        
        a = [-06-(46/60),107+(38/60)];
        b = [-06-(44/60),107+(37/60)];
        c = [-06-(49/60),107+(09/60)];
        d = [-07-(04/60),107+(15/60)];

        linem([a(1) b(1) c(1) d(1) a(1)], [a(2) b(2) c(2) d(2) a(2)],'b-');
        
        % Simpan di Excel
        filename = 'hasil simulasi.xlsx';
        sheet = 2;
        xlRange = 'A2:A5001';
        xlswrite(filename,x',sheet,xlRange);
        xlRange = 'B2:B5001';
        xlswrite(filename,y',sheet,xlRange);
        xlRange = 'C2:C5001';
        xlswrite(filename,h',sheet,xlRange);
    elseif waktu == 165
        %% Plot +13 jam 45 menit
        subplot(2,2,4)
        title('Plot +13 jam 45 menit');
        maxLat = max(y);
        minLat = min(y);
        maxLon = max(x);
        minLon = min(x);
        worldmap([min(y)-0.5,max(y)+0.5],[min(x)-0.5,max(x)+0.5]);                                                    
        land = shaperead('landareas', 'UseGeoCoords', true);                                                             % daratan
        geoshow(land, 'FaceColor', [0.5 0.7 0.5]);
        plotm(-6.77,107.6,'r^','MarkerFaceColor','r');                                                     % Perahu
        hold on;
        
        plotm(y,x,'k.'); 
        hold on;

        plotm(-6.77,107.6,'r^') % Letak Gunung Tangkuban Perahu
        hold on;
        
        a = [-06-(46/60),107+(38/60)];
        b = [-07-(04/60),107+(15/60)];
        c = [-06-(49/60),107+(09/60)];
        d = [-06-(44/60),107+(37/60)];

        linem([a(1) b(1) c(1) d(1) a(1)], [a(2) b(2) c(2) d(2) a(2)],'b-');
        
        % Simpan di Excel
        filename = 'hasil simulasi.xlsx';
        sheet = 3;
        xlRange = 'A2:A5001';
        xlswrite(filename,x',sheet,xlRange);
        xlRange = 'B2:B5001';
        xlswrite(filename,y',sheet,xlRange);
        xlRange = 'C2:C5001';
        xlswrite(filename,h',sheet,xlRange);
    else
        %% Plot peta partikel bergerak
        figure(1);
        subplot(2,2,1)
        maxLat = max(y);
        minLat = min(y);
        maxLon = max(x);
        minLon = min(x);
        worldmap([min(y)-0.5,max(y)+0.5],[min(x)-0.5,max(x)+0.5]);                                                    
        land = shaperead('landareas', 'UseGeoCoords', true);                                                             % daratan
        geoshow(land, 'FaceColor', [0.5 0.7 0.5]);
        plotm(-6.77,107.6,'r^','MarkerFaceColor','r');                                                     % Perahu
        hold on;

        plotm(y,x,'k.'); 
        hold on;

        plotm(-6.77,107.6,'r^') % Letak Gunung Tangkuban Perahu
        hold off;
    end    
    
    % Tampilkan Proses
    ProsesDalamJam = waktu*5/60
    
    % Waktu bertambah
    t = t + (dt/3600);
end
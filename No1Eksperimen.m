%% Bersihkan Memory
clc; clear all;

%% Info singkat mengenai erupsi gunung tangkuban Perahu
%
% Tinggi punck gunung:
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

%% Data prediksi medan angin GFS 26-07-2019, 9 UTC

% Data prediksi medan angin GFS 26-07-2019, 9 UTC, 760 m:
% Arah Angin:
aa01 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",1,"C6:E8",'basic');
% kecepatan angin:
ka01 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",1,"I6:K8",'basic');

% Data prediksi medan angin GFS 26-07-2019, 9 UTC, 1460 m:
% Arah Angin:
aa02 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",1,"C16:E18",'basic');
% kecepatan angin:
ka02 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",1,"I16:K18",'basic');

% Data prediksi medan angin GFS 26-07-2019, 9 UTC, 3000 m:
% Arah Angin:
aa03 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",1,"C26:E28",'basic');
% kecepatan angin:
ka03 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",1,"I26:K28",'basic');

%% Data prediksi medan angin GFS 26-07-2019, 12 UTC

% Data prediksi medan angin GFS 26-07-2019, 12 UTC, 760 m:
% Arah Angin:
aa04 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",2,"C6:E8",'basic');
% kecepatan angin:
ka04 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",2,"I6:K8",'basic');

% Data prediksi medan angin GFS 26-07-2019, 12 UTC, 1460 m:
% Arah Angin:
aa05 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",2,"C16:E18",'basic');
% kecepatan angin:
ka05 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",2,"I16:K18",'basic');

% Data prediksi medan angin GFS 26-07-2019, 12 UTC, 3000 m:
% Arah Angin:
aa06 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",2,"C26:E28",'basic');
% kecepatan angin:
ka06 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",2,"I26:K28",'basic');

%% Data prediksi medan angin GFS 26-07-2019, 15 UTC

% Data prediksi medan angin GFS 26-07-2019, 15 UTC, 760 m:
% Arah Angin:
aa07 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",3,"C6:E8",'basic');
% kecepatan angin
ka07 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",3,"I6:K8",'basic');

% Data prediksi medan angin GFS 26-07-2019, 15 UTC, 1460 m:
% Arah Angin:
aa08 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",3,"C16:E18",'basic');
% kecepatan angin:
ka08 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",3,"I16:K18",'basic');

% Data prediksi medan angin GFS 26-07-2019, 15 UTC, 3000 m:
% Arah Angin:
aa09 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",3,"C26:E28",'basic');
% kecepatan angin:
ka09 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",3,"I26:K28",'basic');

%% Data prediksi medan angin GFS 26-07-2019, 18 UTC

% Data prediksi medan angin GFS 26-07-2019, 18 UTC, 760 m:
% Arah Angin:
aa10 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",4,"C6:E8",'basic');
% kecepatan angin
ka10 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",4,"I6:K8",'basic');

% Data prediksi medan angin GFS 26-07-2019, 18 UTC, 1460 m:
% Arah Angin:
aa11 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",4,"C16:E18",'basic');
% kecepatan angin:
ka11 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",4,"I16:K18",'basic');

% Data prediksi medan angin GFS 26-07-2019, 18 UTC, 3000 m:
% Arah Angin:
aa12 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",4,"C26:E28",'basic');
% kecepatan angin:
ka12 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",4,"I26:K28",'basic');

%% Data prediksi medan angin GFS 26-07-2019, 21 UTC

% Data prediksi medan angin GFS 26-07-2019, 21 UTC, 760 m:
% Arah Angin:
aa13 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",5,"C6:E8",'basic');
% kecepatan angin
ka13 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",5,"I6:K8",'basic');

% Data prediksi medan angin GFS 26-07-2019, 21 UTC, 1460 m:
% Arah Angin:
aa14 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",5,"C16:E18",'basic');
% kecepatan angin:
ka14 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",5,"I16:K18",'basic');

% Data prediksi medan angin GFS 26-07-2019, 21 UTC, 3000 m:
% Arah Angin:
aa15 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",5,"C26:E28",'basic');
% kecepatan angin:
ka15 = xlsread("Data Medan Angin 26 Juli 2019.xlsx",5,"I26:K28",'basic');

%% Program Utama
x = double([]);
y = double([]);
h = double([]);
Vst = double([]);
banyakPartikel = 5000;

%% Inisiasi partikel-partiklenya
for partikel = 1:banyakPartikel % bisa diubah
    t = double(8.8); % Pukul 08.48 UTC
    dt = 300; % Selang waktu 60 detik/1 menit
    x(partikel) = double(107.6);
    y(partikel) = double(-6.77);
    h(partikel) = double((randi([2084,2284],1)));
    Kh = 20000; % bisa diubah
    Kv = 10;
    d = double(random('Normal',1.25,5));
    d = double(abs(d))
    d = double(d*1e-4);
    Cst = double(1.2e6);
    r = double(d/2)
    Vst(partikel) = double(Cst*r*r);
end

%% Loop sebaran partikel
for waktu = 0:165 % bisa diubah
    for partikel = 1:banyakPartikel
        t = t + (dt/3600);
        if t < 10.5
            if h < 1110
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa01(i,j);
                KecepatanAngin = ka01(i,j);
            elseif h >= 1110 & h < 2230
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa02(i,j);
                KecepatanAngin = ka02(i,j);
            else
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa03(i,j);
                KecepatanAngin = ka03(i,j);
            end
        elseif t >= 10.5 & t < 13.5
            if h < 1110
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa04(i,j);
                KecepatanAngin = ka04(i,j);
            elseif h >= 1110 & h < 2230
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa05(i,j);
                KecepatanAngin = ka05(i,j);
            else
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa06(i,j);
                KecepatanAngin = ka06(i,j);
            end
        elseif t >= 13.5 & t < 16.5
            if h < 1110
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa07(i,j);
                KecepatanAngin = ka07(i,j);
            elseif h >= 1110 & h < 2230
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa08(i,j);
                KecepatanAngin = ka08(i,j);
            else
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa09(i,j);
                KecepatanAngin = ka09(i,j);
            end
        elseif t >= 16.5 & t < 19.5
            if h < 1110
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa10(i,j);
                KecepatanAngin = ka10(i,j);
            elseif h >= 1110 & h < 2230
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa11(i,j);
                KecepatanAngin = ka11(i,j);
            else
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa12(i,j);
                KecepatanAngin = ka12(i,j);
            end
        else
            if h < 1110
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa13(i,j);
                KecepatanAngin = ka13(i,j);
            elseif h >= 1110 & h < 2230
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa14(i,j);
                KecepatanAngin = ka14(i,j);
            else
                if x(partikel) < 107.25
                    i = 1;
                elseif x(partikel) >= 107.25 &  x(partikel) < 107.75
                    i = 2;
                else
                    i = 3;
                end
                if y(partikel) < -7.25
                    j = 3;
                elseif y(partikel) >= -7.25 &  y(partikel) < -6.5
                    j = 2;
                else
                    j = 1;
                end
                ArahAngin = aa15(i,j);
                KecepatanAngin = ka15(i,j);
            end
        end
        
        % Koreksi kecepatan partikel 
        KecepatanAngin = double(KecepatanAngin*0.514444);
        
        % Koreksi parameter-parameter partikel pada h = 0m 
        if h(partikel) < 0
            h(partikel) = double(0);
            KecepatanAngin = double(0);
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
        SigmaX = (2*Kh*dt)^0.5; % Sigma x
        RNG = double(random('Normal',0,0.15)); % Angka acak antara -0.5 sampai 0.5
        Zx = double(2*sqrt(3)*SigmaX*RNG); % Perpindahan Acak
        dx = double(dx + Zx);
        
        % Perpindahan posisi pada permukaan bumi dalam derajat 
        JariJariBumi = double(6371000);
        KelilingBumi = double(2*pi*JariJariBumi);
        dx = double(rad2deg(dx/KelilingBumi));
        x(partikel) = double(x(partikel)+dx);
        
        %% Perubahan Posisi pada sumbu y
        % Perubahan posisi partikel karena angin
        ySpdCoef = double((-1)*cos(deg2rad(ArahAngin))); % Koefisien
        ySpd = double(KecepatanAngin*ySpdCoef); % Kecepatan Angin
        dy = double(ySpd*dt); % Perpindahan
        
        % Perubahan posisi karena difusi turbulensi
        SigmaY = (2*Kh*dt)^0.5; % Sigma y
        RNG = double(random('Normal',0,0.15)); % Angka acak antara -0.5 sampai 0.5
        Zy = double(2*sqrt(3)*SigmaY*RNG); % Perpindahan Acak
        dy = double(dy + Zy);
        
        % Perpindahan posisi pada permukaan bumi dalam derajat 
        JariJariBumi = double(6371000);
        KelilingBumi = double(2*pi*JariJariBumi);
        dy = double(rad2deg(dy/KelilingBumi));
        y(partikel) = double(y(partikel)+dy);
        
    end
    
    if waktu == 21
        %% Plot +1 jam 45 menit
        subplot(2,2,2)
        title('Plot +1 jam 45 menit');
        worldmap([-7.75,-6.25],[106.75 108.25]);    % Koordinat di sekitar 
                                                    % Gunung Tangkuban Perahu
        land = shaperead('landareas', 'UseGeoCoords', true); % Menampilkan 
                                                             % daratan
        geoshow(land, 'FaceColor', [0.5 0.7 0.5]) % Warna daratan
        plotm(-6.77,107.6,'r^','MarkerFaceColor','r') % Letak Gunung Tangkuban
                                                      % Perahu
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
        worldmap([-7.75,-6.25],[106.75 108.25]);    % Koordinat di sekitar 
                                                    % Gunung Tangkuban Perahu
        land = shaperead('landareas', 'UseGeoCoords', true); % Menampilkan 
                                                             % daratan
        geoshow(land, 'FaceColor', [0.5 0.7 0.5]) % Warna daratan
        plotm(-6.77,107.6,'r^','MarkerFaceColor','r') % Letak Gunung Tangkuban
                                                      % Perahu
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
        worldmap([-7.75,-6.25],[106.75 108.25]);    % Koordinat di sekitar 
                                                    % Gunung Tangkuban Perahu
        land = shaperead('landareas', 'UseGeoCoords', true); % Menampilkan 
                                                             % daratan
        geoshow(land, 'FaceColor', [0.5 0.7 0.5]) % Warna daratan
        plotm(-6.77,107.6,'r^','MarkerFaceColor','r') % Letak Gunung Tangkuban
                                                      % Perahu
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
        worldmap([-7.75,-6.25],[106.75 108.25]);    % Koordinat di sekitar 
                                                    % Gunung Tangkuban Perahu
        land = shaperead('landareas', 'UseGeoCoords', true); % Menampilkan 
                                                             % daratan
        geoshow(land, 'FaceColor', [0.5 0.7 0.5]) % Warna daratan
        plotm(-6.77,106.6,'r^','MarkerFaceColor','r') % Letak Gunung Tangkuban
                                                      % Perahu
        hold on;

        plotm(y,x,'k.'); 
        hold on;

        plotm(-6.77,107.6,'r^') % Letak Gunung Tangkuban Perahu
        hold off;
    end    
    
    % Tampilkan Proses
    ProsesDalamJam = waktu*5/60
    
end
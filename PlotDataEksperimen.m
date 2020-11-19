%% Membaca hasil eksperimen
filename = 'hasil simulasi.xlsx';
sheet = 3;
xlRange = 'A2:A5001';
x = xlsread(filename,sheet,xlRange);
xlRange = 'B2:B5001';
y = xlsread(filename,sheet,xlRange);
xlRange = 'C2:C5001';
h = xlsread(filename,sheet,xlRange);

%% Plot pada peta
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
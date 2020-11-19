function [ArahAngin, KecepatanAngin] = ...
    InterpolasiAngin(aa0,ka0,aa,ka,x,y,h)
%% Angin bawah
%% Kecepatan dan arah angin I

% Memilih kolom matrix
x0 = x;
x0 = floor(x0);
x1 = 104;
x2 = 108;
y1 = 1;
y2 = 5;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
j = uint8(y0);

% Memilih baris matrix
x0 = y;
x0 = ceil(x0);
x1 = -6;
x2 = -8;
y1 = 1;
y2 = 3;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
i = uint8(y0);

% Memilih kecepatan angin dan arah angin
KecepatanAngin1 = ka0(i,j);
ArahAngin1 = aa0(i,j);

%% Kecepatan dan arah angin II

% Memilih kolom matrix
x0 = x;
x0 = ceil(x0);
x1 = 104;
x2 = 108;
y1 = 1;
y2 = 5;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
j = uint8(y0);

% Memilih baris matrix
x0 = y;
x0 = ceil(x0);
x1 = -6;
x2 = -8;
y1 = 1;
y2 = 3;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
i = uint8(y0);

% Memilih kecepatan angin dan arah angin
KecepatanAngin2 = ka0(i,j);
ArahAngin2 = aa0(i,j);

%% Kecepatan dan arah angin III

% Memilih kolom matrix
x0 = x;
x0 = floor(x0);
x1 = 104;
x2 = 108;
y1 = 1;
y2 = 5;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
j = uint8(y0);

% Memilih baris matrix
x0 = y;
x0 = floor(x0);
x1 = -6;
x2 = -8;
y1 = 1;
y2 = 3;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
i = uint8(y0);

% Memilih kecepatan angin dan arah angin
KecepatanAngin3 = ka0(i,j);
ArahAngin3 = aa0(i,j);

%% Kecepatan dan arah angin IV

% Memilih kolom matrix
x0 = x;
x0 = ceil(x0);
x1 = 104;
x2 = 108;
y1 = 1;
y2 = 5;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
j = uint8(y0);

% Memilih baris matrix
x0 = y;
x0 = floor(x0);
x1 = -6;
x2 = -8;
y1 = 1;
y2 = 3;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
i = uint8(y0);

% Memilih kecepatan angin dan arah angin
KecepatanAngin4 = ka0(i,j);
ArahAngin4 = aa0(i,j);

% Menentukan koefisien px

xv1 = floor(2*x);
yv1 = ceil(2*y);
px = 2*x - xv1;
py = yv1 - 2*y;
qx = 1 - px;
qy = 1 - py;

ArahAngin0 = (ArahAngin1*qx*qy)...
    +(ArahAngin2*px*qy)...
    +(ArahAngin3*qx*py)...
    +(ArahAngin4*px*py);
KecepatanAngin0 = (KecepatanAngin1*qx*qy)...
    +(KecepatanAngin2*px*qy)...
    +(KecepatanAngin3*qx*py)...
    +(KecepatanAngin4*px*py);
%% Angin atas
%% Kecepatan dan arah angin I

% Memilih kolom matrix
x0 = x;
x0 = floor(x0);
x1 = 104;
x2 = 108;
y1 = 1;
y2 = 5;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
j = uint8(y0);

% Memilih baris matrix
x0 = y;
x0 = ceil(x0);
x1 = -6;
x2 = -8;
y1 = 1;
y2 = 3;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
i = uint8(y0);

% Memilih kecepatan angin dan arah angin
KecepatanAngin1 = ka(i,j);
ArahAngin1 = aa(i,j);

%% Kecepatan dan arah angin II

% Memilih kolom matrix
x0 = x;
x0 = ceil(x0);
x1 = 104;
x2 = 108;
y1 = 1;
y2 = 5;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
j = uint8(y0);

% Memilih baris matrix
x0 = y;
x0 = ceil(x0);
x1 = -6;
x2 = -8;
y1 = 1;
y2 = 3;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
i = uint8(y0);

% Memilih kecepatan angin dan arah angin
KecepatanAngin2 = ka(i,j);
ArahAngin2 = aa(i,j);

%% Kecepatan dan arah angin III

% Memilih kolom matrix
x0 = x;
x0 = floor(x0);
x1 = 104;
x2 = 108;
y1 = 1;
y2 = 5;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
j = uint8(y0);

% Memilih baris matrix
x0 = y;
x0 = floor(x0);
x1 = -6;
x2 = -8;
y1 = 1;
y2 = 3;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
i = uint8(y0);

% Memilih kecepatan angin dan arah angin
KecepatanAngin3 = ka(i,j);
ArahAngin3 = aa(i,j);

%% Kecepatan dan arah angin IV

% Memilih kolom matrix
x0 = x;
x0 = ceil(x0);
x1 = 104;
x2 = 108;
y1 = 1;
y2 = 5;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
j = uint8(y0);

% Memilih baris matrix
x0 = y;
x0 = floor(x0);
x1 = -6;
x2 = -8;
y1 = 1;
y2 = 3;
y0 = PersamaanGaris(x0,x1,x2,y1,y2);
i = uint8(y0);

% Memilih kecepatan angin dan arah angin
KecepatanAngin4 = ka(i,j);
ArahAngin4 = aa(i,j);

% Menentukan koefisien px

xv1 = floor(2*x);
yv1 = ceil(2*y);
px = 2*x - xv1;
py = yv1 - 2*y;
qx = 1 - px;
qy = 1 - py;

ArahAngin = (ArahAngin1*qx*qy)...
    +(ArahAngin2*px*qy)...
    +(ArahAngin3*qx*py)...
    +(ArahAngin4*px*py);
KecepatanAngin = (KecepatanAngin1*qx*qy)...
    +(KecepatanAngin2*px*qy)...
    +(KecepatanAngin3*qx*py)...
    +(KecepatanAngin4*px*py);

%% Angin Tengah
if and(h>=0,h<760)
    h0 = 0;
    hu = 760;
elseif and(h>=760,h<1460)
    h0 = 760;
    hu = 1460;
elseif and(h>=1460,h<3000)
    h0 = 1460;
    hu = 3000;
else
    h0 = 0;
    hu = 3000;
end

ph = (h-h0)/(hu-h0);
qh = 1-ph;

ArahAngin = (ArahAngin0*qh)...
    +(ArahAngin*ph);
KecepatanAngin = (KecepatanAngin0*qh)...
    +(KecepatanAngin*ph); 

end
function [ArahAngin,KecepatanAngin] = ...
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
    x,y,h,t,partikel)

%% waktu pertama
if and(t>=6,t<12)
    if h(partikel)<760
        aa0=aa00;
        ka0=ka00;
        aa=aa01;
        ka=ka01;
    elseif and(h(partikel)>=760,h(partikel)<1460)
        aa0=aa01;
        ka0=ka01;
        aa=aa02;
        ka=ka02;
    elseif and(h(partikel)>=1460,h(partikel)<3000)
        aa0=aa02;
        ka0=ka02;
        aa=aa03;
        ka=ka03;
    end
elseif and(t>=12,t<18)
    if h(partikel)<760
        aa0=aa00;
        ka0=ka00;
        aa=aa04;
        ka=ka04;
    elseif and(h(partikel)>=760,h(partikel)<1460)
        aa0=aa04;
        ka0=ka04;
        aa=aa05;
        ka=ka05;
    elseif and(h(partikel)>=1460,h(partikel)<3000)
        aa0=aa05;
        ka0=ka05;
        aa=aa06;
        ka=ka06;
    end
elseif and(t>=18,t<24)
    if h(partikel)<760
        aa0=aa00;
        ka0=ka00;
        aa=aa07;
        ka=ka07;
    elseif and(h(partikel)>=760,h(partikel)<1460)
        aa0=aa07;
        ka0=ka07;
        aa=aa08;
        ka=ka08;
    elseif and(h(partikel)>=1460,h(partikel)<3000)  
        aa0=aa08;
        ka0=ka08;
        aa=aa09;
        ka=ka09;
    end
end

[ArahAnginTAwal, KecepatanAnginTAwal] = ...
    InterpolasiAngin(aa0,ka0,aa,ka,x(partikel),y(partikel),h(partikel));

%% waktu kedua
if and(t>=6,t<12)
    if h(partikel)<760
        aa0=aa00;
        ka0=ka00;
        aa=aa04;
        ka=ka04;
    elseif and(h(partikel)>=760,h(partikel)<1460)
        aa0=aa04;
        ka0=ka04;
        aa=aa05;
        ka=ka05;
    elseif and(h(partikel)>=1460,h(partikel)<3000)
        aa0=aa05;
        ka0=ka05;
        aa=aa06;
        ka=ka06;
    end
elseif and(t>=12,t<18)
    if h(partikel)<760
        aa0=aa00;
        ka0=ka00;
        aa=aa07;
        ka=ka07;
    elseif and(h(partikel)>=760,h(partikel)<1460)
        aa0=aa07;
        ka0=ka07;
        aa=aa08;
        ka=ka08;
    elseif and(h(partikel)>=1460,h(partikel)<3000)  
        aa0=aa08;
        ka0=ka08;
        aa=aa09;
        ka=ka09;
    end
elseif and(t>=18,t<24)
    if h(partikel)<760
        aa0=aa00;
        ka0=ka00;
        aa=aa10;
        ka=ka10;
    elseif and(h(partikel)>=760,h(partikel)<1460)
        aa0=aa10;
        ka0=ka10;
        aa=aa11;
        ka=ka11;
    elseif and(h(partikel)>=1460,h(partikel)<3000)
        aa0=aa11;
        ka0=ka11;
        aa=aa12;
        ka=ka12;
    end
end

[ArahAnginTAkhir, KecepatanAnginTAkhir] = ...
    InterpolasiAngin(aa0,ka0,aa,ka,x(partikel),y(partikel),h(partikel));

%% Menentukan angin dan arah angin 
if and(t>=6,t<12)
    t1 = 6;
    t2 = 12;
elseif and(t>=12,t<18)
    t1 = 12;
    t2 = 18;
elseif and(t>=18,t<24)
    t1 = 18;
    t2 = 24;
end

pt = (t-t1)/(t2-t1);
qt = 1 - pt;

ArahAngin = (ArahAnginTAwal*qt)...
    +(ArahAnginTAkhir*pt);
KecepatanAngin = (KecepatanAnginTAwal*qt)...
    +(KecepatanAnginTAkhir*pt);

end
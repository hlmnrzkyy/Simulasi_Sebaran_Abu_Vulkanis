function y = PersamaanGaris(x,x1,x2,y1,y2)
A = x-x1;
B = y2-y1;
C = x2-x1;
D = y1;
y = (A*B/C)+D;
end

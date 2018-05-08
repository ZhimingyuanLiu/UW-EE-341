%first we divide the whole impulse function to 4 different-length impulse
%functoins of 4th order, and then we mutiply each impulse funciton with
%different value to change its amplitude. Finally, we add them together.

function y = equalizer(x,G1,G2,G3,G4)

h1 = butter(4, 1/5);
h2 = butter(4, [1/5 2/5]);
h3 = butter(4, [2/5 2/3]);
h4 = butter(4, 2/3);

y1 = G1*filter(h1,1,x);
y2 = G2*filter(h2,1,x);
y3 = G3*filter(h3,1,x);
y4 = G4*filter(h4,1,x);

y = y1+y2+y3+y4;

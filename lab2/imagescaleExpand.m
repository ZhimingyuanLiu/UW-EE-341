 function [yd, yI] = imagescaleExpand(X)
yd = imresize(X, 3);

oldSize = size(X);
newSize = max(floor(3.*oldSize(1:2)),1);
newX = ((1:newSize(2)) -0.5)./3+0.5;
newY = ((1:newSize(1)) -0.5)./3+0.5;

y2 = double(X);
y = interp2(y2, newX, newY(:));

yI = uint8(y);

end

function thumbnail = averageScale(X, S)

k = ones(S, S);

hs = (1/(S*S)).*k;

xd = double(X);
Xs = conv2(xd,hs,'same');
Xsp = uint8(Xs);
thumbnail = scaleimage(Xsp,S);
end

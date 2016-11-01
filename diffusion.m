nres = 5;
% This loop picks out every fifth set of coordinates
for n = 1:nres:nsteps
ptA((n-1)/5+1) = -r(n)/2;
ptB((n-1)/5+1) = r(n)/2;
end
nanimate = round(nsteps/nres);
for t = 1:nanimate
plot(ptA(t),0,'ob',ptB(t),0,'ok','MarkerSize',69)
axis([-3 3 -3 3])
axis off
M(t) = getframe;
end
movie(M,5)
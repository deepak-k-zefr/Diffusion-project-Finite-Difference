function y = LJPotential(r)
epsilon = 1;
sigma = 1;
y = 4*epsilon*((sigma./r).^12 - (sigma./r).^6);
end
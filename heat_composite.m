 %set constants
  nx=320;
  ny=160;
  width = 0.8;
  length = 0.4;
  dx=width/nx;
  dy=length/ny;
phinew=zeros([ny nx]);
phiold=zeros([ny nx]);
%set up while loop
err=1;
tol=1e-6;
while err>tol
    %enforce boundary temperature
    phiold(2:40,160)=100;
    phiold(1,80:160)=100;
    phiold(280:320,1)=0;
    phiold(320,2:80)=0;
%calculate updated temp
for i=2:nx-1
    for j=2:ny-1
        phinew(i,j)=0.25*(phiold(i+1,j)+phiold(i-1,j)+phiold(i,j+1)+phiold(i,j-1));
    end
end
%top side
for i=41:319
    for j = 160
    phinew(i,j)=(1/3)*(phiold(i+1,j)+phiold(i-1,j)+phiold(i,j-1));
    end
end
%bottom side
for i=2:279
    for j=1
        phinew(i,j)=(1/3)*(phiold(i+1,j)+phiold(i-1,j)+phiold(i,j+1));
    end
end
%left side
for i=1
    for j=2:79
        phinew(i,j)=(1/3)*(phiold(i+1,j)+phiold(i,j+1)+phiold(i,j-1));
    end
end
%right side
for i=320
    for j=81:159
        phinew(i,j)= (1/3)*(phiold(i,j+1)+phiold(i-1,j)+phiold(i,j-1));
    end
end
%bottom left corner
for i=1
    for j=1
        phinew(i,j)=0.5*(phiold(i+1,j)+phiold(i,j+1));
    end
end
%top right corner
for i=320
    for j=160
        phinew(i,j)=0.5*(phiold(i-1,j)+phiold(i,j-1));
    end
end
err=99;
for i=1:nx
    for j=1:ny
        err=err+abs(phinew(i,j)-phiold(i,j));
    end
end
%swap old and new for next iteration after calculating error
for i=1:nx
    for j=1:ny
        phiold(i,j)=phinew(i,j);
end
end
end
surf(0:dx:(width-dx),0:dy:(length-dy),phinew);
% "Finite Difference Method (FDM) solution to Laplacian"
% 
% Objective of the program is to solve for the steady state voltage
% distribution in a region 0<x<99, 0<y<99, given that one corner of the 
% square is excited with a voltage of 45 Volts and all other
% sides are maintained at 0 Volts. 
% At any iteration, the value of voltage is updated as average of voltages
% of 4 nearest naighbors, until between consecutive iterations, the error
% is less than 0.01 V.
%
% The tolerance in error between iterations is kept at 0.01 V. This may be
% tweaked to a higher or lower value for lower or higher accuracy 
% respectively. Imagesc command by default uses image axis settings, which
% are different from normal plot command and hence x and y axis may look 
% flipped. Read Matlab documentation on imagesc for more details.
%
% Program stops when iteration number in plot does not change or can be
% closed anytime by just closing the plot window. On normal completion, the
% program plots the electric field in a quiver plot.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Clearing variables in memory and Matlab command screen
clear all;
clc;
%Dimensions of the simulation grid in x (xdim) and y (ydim) directions
xpoints=99;
ypoints=99;
zpoints=99;
xdim=xpoints;
ydim=ypoints;
%zdim=zpoints;
m=csvread('100.csv');
%Initializing previous (V_prev) and present (V_now) voltage matrices
V_now=zeros(xdim+1,ydim+1);
V_prev=zeros(xdim+1,ydim+1);
E=zeros(xdim+1,ydim+1);
sigma=zeros(xdim+1,ydim+1);

%j= sigma*E;

%Initializing boundary conditions only for V_now
%i=1:1:xdim+1;%x-co-ordinates for boundary at y=ydim*grid_size 
%A voltage of 45*x*(1-x) is applied on one boundary, the remaining
%boundaries are going to remain at zero volts
%V_now(i,ydim+1)=45*((i-1)/xdim).*(1-((i-1)/xdim));
%V_now(i,ydim+1)=45;

V_now(:,:)=0.7;
V_now(:,xpoints)=100;
%disp(V_now)
%Iteration counter
iter=0;
c1=1.4;
c2=1.41;
%Calculation of maximum error between V_now and V_prev at all points
%By setting the applied voltage for only V_now, we have made V_no and
%V_prev different, hence error will be greater than zero and the program
%will enter the while loop following this command.
error=max(max(abs(V_now-V_prev)));

%Iteration loop
while(error>.5)%Run this until convergence
    
    iter=iter+1; % Iteration counter increment
    
    % Updating present iteration using 4 point Central diffrence form
    % of Laplace equation obtained using Finite Difference method
    for i=2:1:xdim
        for j=2:1:ydim
           
           
                             
          
             
            % if(m((i-2)*100+(j-2)+1)==1)
             if (i==1 && j==99 )
            V_now(i,j)=0;
             else if (i>0 && j>0)
             V_now(i,j)=c1*(V_now(i-1,j)+V_now(i+1,j)+V_now(i,j-1)+V_now(i,j+1));                 end
             end
             %else
           % V_now(i,j,k)=c2*(V_now(i-1,j,k)+V_now(i+1,j,k)+V_now(i,j-1,k)+V_now(i,j+1,k)+V_now(i,j,k+1)+V_now(i,j,k-1))/8;
            %  end

                      v(94,94)=0;
                       v(94,93)=0;
                       v(93,94)=0;
                       v(95,94)=0;
        end
        end
        end
        %end
    %end
            
    %[ex,ey,ez]=gradient(V_now);
   %  E= sqrt(ex.^2+ey.^2+ez.^2);
     error=max(max(abs(V_now-V_prev))); % Calculate the maximum error between previous and current iteration at all points
    V_prev=V_now; % Updating previous iteration matrix to the last iteration performed
    %V_now1=V_now(:,:,1);
    %Movie type colour scaled image plot to see how solution progresses
    %imagesc(V_now1());colorbar;
    title(['Voltage distribution on a ',int2str(xdim),' x ',int2str(ydim),'GRID']); 
    %getframe;
end

%%
%Plot the electric field distribution
%figure;
 [max_val, position] = max(V_now(:));
[i,j] = ind2sub(size(V_now),position);
[ex,ey]=gradient(V_now);

%quiver(-ex,-ey); %Quiver command creates a plot, E=-grad(V), hence the negative sign
%E
%disp(-ex)
commandwindow
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF PROGRAM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
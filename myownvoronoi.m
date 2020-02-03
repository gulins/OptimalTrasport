
% number of sites
N = 4;

% weights
W = randi([1 10],1,N);

% x and y coordinate of the sites
sx = randi([5 195],1,N);
sy = randi([5 195],1,N);

% site: vertical coordinate (on the plot), horizontal coordinate, weight
sites = {sx, sy, W};



X=200;
Y=200;
Xres=1500;
Yres=1500;

scaleX = (Xres/X);
scaleY = (Yres/Y);

x=linspace(1,X,Xres);
y=linspace(1,Y,Yres);


V=zeros(length(y),length(x)); % voronoi diagram
D=zeros(length(y),length(x)); % distances for each point

% facility: vertical coordinate (on the plot), horizontal coordinate, weight
%facilities = { {[3 3 1]}, {[78 39 0.6]}, {[50 80 1]}, {[120 20 3]}, {[120 50 1]} };
facilities = [sites{1}' sites{2}' sites{3}'];
%[ [3 3 1]; [78 39 0.6]; [50 80 1]; [120 20 3]; [120 50 1] ];


for i=1:length(y)
    for j=1:length(x)
        mindist = Inf;
        minf = 0;
        for f=1:length(facilities)
            fx=facilities(f,1);
            fy=facilities(f,2);
            w=facilities(f,3);
           
            % DISTANCE
            p=2;
            dist=(((abs(y(i)-fy))^2+(abs(x(j)-fx))^2)^(p/2))-w;
            %dist=(((abs(y(i)-fy))^p+(abs(x(j)-fx))^p)^(1/p))-w;
            
            if (dist<mindist)
                mindist=dist;
                minf=f;
            end
        end
        V(i,j)=minf;
        D(i,j)=mindist;
    end
end

%V(D<1)=length(sites)+6;
imagesc(V)
set(gca,'Ydir','Normal')
pbaspect([1 1 1])
hold on

viscircles([scaleX.*(facilities(:,1)) scaleY.*(facilities(:,2))], (scaleX+scaleY)*sqrt(facilities(:,3)),'Color','k', 'EnhanceVisibility',false);
% scatter(scaleX.*(facilities(:,1)), scaleY.*(facilities(:,2)), 50*(scaleX+scaleY)*sqrt(facilities(:,3)),'ko');

hold on
scatter(scaleX.*(facilities(:,1)), scaleY.*(facilities(:,2)),'ko','filled')
 % returns a colormap containing 50 rows.
colormap(summer);
axis off;


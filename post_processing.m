function n=showbeads(list,beadsize)

% This function draws the particles, the coordinates of which are given in "list",
% one row of x,y,z coordinates for each particle.
% Use "beadsize" to set the particle size for the plot.

[n] = size(list,1);
[a,b,c] = sphere(12);
a=beadsize/2*a; b=beadsize/2*b; c=beadsize/2*c;

for i=1:n
	axis([-500 500 -500 500 -500 500])

surf(a+list(i,1),b+list(i,2),c+list(i,3),'FaceColor','b','EdgeColor','None')
	hold one
end
hold off

camlight left
lighting phong
xlabel('x')
ylabel('y')
zlabel('z')

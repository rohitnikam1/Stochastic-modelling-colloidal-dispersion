% Main execution file

clear all ; close all ; clc

global dt tmax beta N L a Nn

bd_parameters ;

g = init_config( L, N, a ) ;

Nn = size(g,1) ;	% Number of particles in a system

r = zeros( 3*Nn ,1 ) ;
n = zeros( 3*Nn ,1 ) ; % vector of random numbers having mean 0 and variance 1

for i = 1:Nn
	r(3*i-2:3*i) = g(i,:)' ;
end

r0 = r ; 		% Initial positions
root2t = sqrt( 2*dt ) ;
f = zeros( 3*Nn ,1 ) ; 	% force on each particle

rsqr = zeros(1,tmax) ;
stress_elec = 0 ;


% Starting the run %

time = dt*(1:tmax) ;

for count = 1:tmax
	rx = g(:,1) ;
	ry = g(:,2) ;
	rz = g(:,3) ;
	D = RPY_diffusivity_tensor( rx, ry, rz ) ;

	rootD = chol( D ) ;		% Cholesky decomposition of RPY tensor to get its square root matrix

	for i = 1:Nn
		f = -Force( i, rx, ry, rz ) ; 	% 3N*1 electrostatic force on the nanoparticle due to screened Coulomb interaction
		drift_velocity = beta*D*f' ;
		for j = 1:3*Nn
			n(j) = randn ;
		end

		r = r + drift_velocity * dt + root2t * rootD * n ;
	end

	for i = 1:Nn
		g(i,:) = r( 3*i-2 : 3*i )' ;
	end

	% Calculating the mean square displacement
	DR = (r-r0).^2 ;
	m = sum(DR) / Nn ;
	rsqr(count) = m / 6 ;
	%showbeads(g,25) ;
	%drawnow
end


% Post Processing
% Calculating the stress contribution due to electrostatic forces

for p = 1:Nn
	fp = Force_total( p, g(:,1), g(:,2), g(:,3) ) ;
	stress_elec = stress_elec + fp*g(p,:)' ;
end

stress_elec = abs( stress_elec ) / (L^3)
Df = rsqr(tmax) / (dt*tmax) * (10^-9)
plot(time,rsqr)

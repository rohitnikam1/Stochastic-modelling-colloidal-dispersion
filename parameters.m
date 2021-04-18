% Parameter file


function bd_parameters()

global N dt tmax a L T beta eta D0 lambda A

N = 20 ;				% Number of nanoparticles %
dt = 1e-2 ;				% Time step of system evolution (ns)
tmax = 20000 ;				% Number of Time marches ( time = t*time step) (ns)
a = 10 ;				% Nanoparticle diameter (nm)
L = 1000 ;				% Cell dimension (nm)
lambda = 0 ;				% Debye length ( thickness of double layer )
T = 300 ;				% Temperature ( K )
beta = 1.0 / ( 8.314472 * 0.001 * T ) ; % beta = 1 / kB T
eta = 1e-4 ; % 602.3*(1e-4) ;		% Viscosity of surrounding medium
D0 = 1 / beta / 6 / pi / eta / a ;	% Characteristic diffusion coefficient ( Stokes Einstein equation )
A = 1e5 ; % 2.3e-19;%			% Constant in the Yukawa potential : E = A*exp(-lambda*r) / r

end

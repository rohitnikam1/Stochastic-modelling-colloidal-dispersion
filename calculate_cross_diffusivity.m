% Calculates the cross diffusion tensor

function D = cross_diffusivity( rvij )

global a D0

rij = norm( rvij ) ;
aij = a / rij ;

Ac = 1.5 *aij - aij^3 + 18.75 *aij^7 ;
Bc = 0.75 *aij + 0.5 *aij^3 ;

rvij = rvij / rij ; 	% unit vector of interparticle distance
rr = rvij'*rvij ;	% rr tensor (3 by 3)

D = D0* ( Ac*rr + Bc*( eye(3) - rr ) ) ; % eye(3)= 3*3 identity matrix

end

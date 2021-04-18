% Calculates the self diffusion tensor

function D = self_diffusivity( p, rx, ry, rz )

global a L Nn D0

rxi = rx(p) ;
ryi = ry(p) ;
rzi = rz(p) ;

D = 0 ;

for j = 1 : p-1
	rxij = rxi - rx( j ) ;
	ryij = ryi - ry( j ) ;
	rzij = rzi - rz( j ) ;

	rxij = rxij - round( rxij / L ) * L ;
	ryij = ryij - round( ryij / L ) * L ;
	rzij = rzij - round( rzij / L ) * L ;

	rvij = [ rxij ryij rzij ] ;

	rij = norm( rvij ) ;

	aij = a / rij ;

	As = -3.75 *aij^4 + 5.5 *aij^6 ;
	Bs = -1.0625 *aij^6 ;

	rvij = rvij / rij ;
	rr = rvij'*rvij ;

	temp1 = As*rr + Bs*( eye(3) - rr ) ;
	D = D + temp1 ;
end


for j = p+1 : Nn
	rxij = rxi - rx( j ) ;
	ryij = ryi - ry( j ) ;
	rzij = rzi - rz( j ) ;

	rxij = rxij - round( rxij / L ) * L ;
	ryij = ryij - round( ryij / L ) * L ;
	rzij = rzij - round( rzij / L ) * L ;

	rvij = [ rxij ryij rzij ] ;

	rij = = norm( rvij ) ;
	aij = a / rij ;

	As = -3.75 *aij^4 + 5.5 *aij^6 ;
	Bs = -1.0625 *aij^6 ;

	rvij = rvij / rij ;
	rr = rvij'*rvij ;

	temp2 = As*rr + Bs*( eye(3) - rr ) ;
	D = D + temp2 ;
end

D = D0*( eye(3) + D ) ; % eye(3) is 3*3 identity matrix

end

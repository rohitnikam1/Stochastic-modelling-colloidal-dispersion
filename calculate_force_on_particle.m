% Calculates total electrostatic force on the nanoparticle due to screened Coulomb interaction and records it in 3N*1 vector
% Debye interaction has been modeled by Yukawa potential

function f = Force( p, rx, ry, rz )

global lambda A Nn L

rxi = rx( p ) ;
ryi = ry( p ) ;
rzi = rz( p ) ;

f( 3*p-2 : 3*p ) = [ 0 0 0 ] ;

for j = 1 : p-1
	rxij = rxi - rx( j ) ;
	ryij = ryi - ry( j ) ;
	rzij = rzi - rz( j ) ;

	rxij = rxij - round( rxij / L ) * L ;
	ryij = ryij - round( ryij / L ) * L ;
	rzij = rzij - round( rzij / L ) * L ;

	rvij = [ rxij ryij rzij ] ;
	rij = norm( rvij ) ;
	unit_vector = rvij' / rij ;
	
	f( 3*j-2 : 3*j ) = exp( -lambda * rij ) / rij * ( lambda + 1/rij ) * unit_vector ;
end


for j = p+1 : Nn
	rxij = rxi - rx( j ) ;
	ryij = ryi - ry( j ) ;
	rzij = rzi - rz( j ) ;

	rxij = rxij - round( rxij / L ) * L ;
	ryij = ryij - round( ryij / L ) * L ;
	rzij = rzij - round( rzij / L ) * L ;

	rvij = [ rxij ryij rzij ] ;
	rij = norm( rvij ) ;
	unit_vector = rvij / rij ;

	f( 3*j-2 : 3*j ) = exp( -lambda * rij ) / rij * ( lambda + 1/rij ) * unit_vector ;
end

f = A * f ;

end

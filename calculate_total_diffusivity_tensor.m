% Construction of 3N by 3N far field Rotne-Prager-Yamakawa diffusivity tensor
% Near field diffusivity tensor neglected (not pairwise additive)


function D = RPY_diffusivity_tensor( rx, ry, rz )

global Nn L

for i = 2 : 3 : 3*Nn-1 		% row index
	for j = 2 : 3 : 3*Nn-1	% column index
		if i==j
			p = ( j + 1 ) / 3 ;
			D( i-1 : i+1 , j-1 : j+1 ) = self_diffusivity( p, rx, ry, rz ) ;
		else
			b = ( i + 1 ) / 3 ;
			c = ( j + 1 ) / 3 ;

			rxij = rx( b ) - rx( c ) ;
			ryij = ry( b ) - ry( c ) ;
			rzij = rz( b ) - rz( c ) ;

			rxij = rxij - round( rxij / L ) * L ;
			ryij = ryij - round( ryij / L ) * L ;
			rzij = rzij - round( rzij / L ) * L ;

			rvij = [ rxij ryij rzij ] ;

			D( i-1 : i+1 , j-1 : j+1 ) = cross_diffusivity( rvij ) ;
		end
	end
end

end

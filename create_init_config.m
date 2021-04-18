% Code creates positions for non-overlapping particles for a given box size, number of particles and uniform radius of particles

function r = init_config( L, N, radius )

min_dist_sqr = ( 2*radius + 20 )^2 ;

h = zeros( N,3 );

for j = 1 : N
	x = 0.5*L*(2*rand -1 ) ;
	y = 0.5*L*(2*rand -1 ) ;
	z = 0.5*L*(2*rand -1 ) ;
end


for i = 1 : N-1
	for k = i+1 : N
		rxij = h(i,1) - h(k,1) ;
		ryij = h(i,2) - h(k,2) ;
		rzij = h(i,3) - h(k,3) ;

		rxij = rxij - round( rxij / L ) * L ;
		ryij = ryij - round( ryij / L ) * L ;
		rzij = rzij - round( rzij / L ) * L ;

		rij2 = rxij^2 + ryij^2 + rzij^2

		if rij2 <= min_dist_sqr ;
			h(k,:) = [0 0 0] ;
		end
	end
end


k = 1 ;
for i = 1 : N
	if h(i,2) ~= 0
		r(k,:) = h(i,:) ;
		k = k + 1 ;
	end
end

end

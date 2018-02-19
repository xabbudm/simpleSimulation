function indices_foragers = compute_indices_foragers_2()

global L N foragers_2;

indices_foragers = zeros(N,2);

indices_foragers(:,1) = (L+1) - foragers_2(:,2);
indices_foragers(:,2) = foragers_2(:,1); 

end
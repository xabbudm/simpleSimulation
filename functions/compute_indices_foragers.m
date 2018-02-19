function indices_foragers = compute_indices_foragers()

global L N foragers;

indices_foragers = zeros(N,2);

indices_foragers(:,1) = (L+1) - foragers(:,2);
indices_foragers(:,2) = foragers(:,1); 

end
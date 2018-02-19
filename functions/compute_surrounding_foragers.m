function surrounding_foragers = compute_surrounding_foragers(n,forager_indices)

global L;

index = forager_indices(n,:);
surrounding = [-1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1];
indices_surrounding = index + surrounding;
indices_surrounding(indices_surrounding > L) = indices_surrounding(indices_surrounding > L) - L;
indices_surrounding(indices_surrounding < 1) = indices_surrounding(indices_surrounding < 1) + L;

surrounding_foragers = zeros(8,1);
for m = 1:8
    positions_same_index = find(forager_indices(:,1) == indices_surrounding(m,1) & forager_indices(:,2) == indices_surrounding(m,2));
    surrounding_foragers(m) = length(positions_same_index);
end
end

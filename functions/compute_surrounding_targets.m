%including the targets at the position of respective worm
function surroundingTargets = compute_surrounding_targets(n,indicesBeforeUpdate,targets)

global L;

%compute indices of matrix fields in the direct neighbourhood of worm and
%on its current positions to find out how many food units there are
surrounding = [-1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1; 0 0];
indicesSurrounding = indicesBeforeUpdate(n,:) + surrounding;

%employ periodic boundary conditions to the indices
indicesSurrounding(indicesSurrounding > L) = indicesSurrounding(indicesSurrounding > L) - L;
indicesSurrounding(indicesSurrounding < 1) = indicesSurrounding(indicesSurrounding < 1) + L;

%compute targets at position
surroundingTargets = diag(targets(indicesSurrounding(:,1),indicesSurrounding(:,2))) > 0;

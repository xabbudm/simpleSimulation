%including the targets at the position of respective worm
function surroundingTargets = compute_surrounding_targets(n,foragerIndices)

global targets L;

index = foragerIndices(n,:);
surrounding = [-1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1; 0 0];
indicesSurrounding = index + surrounding;

%use PBC for indices
indicesSurrounding(indicesSurrounding > L) = indicesSurrounding(indicesSurrounding > L) - L;
indicesSurrounding(indicesSurrounding < 1) = indicesSurrounding(indicesSurrounding < 1) + L;

%compute targets at position
surroundingTargets = diag(targets(indicesSurrounding(:,1),indicesSurrounding(:,2))) > 0;

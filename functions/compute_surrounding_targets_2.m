%includes targets at position of respective worm
function surroundingTargets = compute_surrounding_targets_2(n,foragerIndices)

global targets_2 L;

index = foragerIndices(n,:);
surrounding = [-1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1; 0 0];
indicesSurrounding = index + surrounding;

%use PBC for indices
indicesSurrounding(indicesSurrounding > L) = indicesSurrounding(indicesSurrounding > L) - L;
indicesSurrounding(indicesSurrounding < 1) = indicesSurrounding(indicesSurrounding < 1) + L;

%compute targets at all positions
surroundingTargets = diag(targets_2(indicesSurrounding(:,1),indicesSurrounding(:,2))) > 0;
end
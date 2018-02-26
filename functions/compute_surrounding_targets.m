%including the targets at the position of respective worm
function surroundingTargets = compute_surrounding_targets(n,indicesBeforeUpdate,targets)

global L;



%compute indices of matrix fields in the direct neighbourhood of worm and
%on its current positions to find out how many food units there are
  row = indicesBeforeUpdate(n, 1);
  column = indicesBeforeUpdate(n,2);
  
  subTargets = targets(row:row+2, column:column+2);
%compute targets at position
%surroundingTargets = sum(targets(sub2ind([L, L], indicesSurrounding(:,1),indicesSurrounding(:,2))));
surroundingTargets = sum(sum(subTargets));
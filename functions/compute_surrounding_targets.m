function surroundingTargets = compute_surrounding_targets(n,indicesBeforeUpdate,targets)

  global L;
  %compute indices of matrix fields in the direct neighbourhood of worm and
  %on its current positions to find out how many food units there are
  %including the targets at the position of respective worm



  row = indicesBeforeUpdate(n, 1);
  column = indicesBeforeUpdate(n,2);
  
  % compute targets at position by cutting the 3x3 neighbour around 
  % targets(row, col) and summarizing all entries in neighbourhoud
  
  % neighbourhoud starts at row/col (NOT the usual row-1/col-1) because data was 
  % shifted by one row/column when precomputing the larger targets matrix 
  % satisfying the periodic boundary condition
  subTargets = targets(row:row+2, column:column+2);
  surroundingTargets = sum(sum(subTargets));
end  
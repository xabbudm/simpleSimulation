  function neighbourCount = compute_neighbourhood_count(n,indices,neighbourhood, countCenter)
  %compute indices of matrix fields in the direct neighbourhood of worm and
  %on its current positions to find out how many food units there are
  %including the targets at the position of respective worm

  row = indices(n, 1);
  column = indices(n,2);
  
  % compute targets at position by cutting the 3x3 neighbour around 
  % targets(row, col) and summarizing all entries in neighbourhoud
  
  % neighbourhoud starts at row/col (NOT the usual row-1/col-1) because data was 
  % shifted by one row/column when precomputing the larger targets matrix 
  % satisfying the periodic boundary condition
  subset = neighbourhood(row:row+2, column:column+2);
  neighbourCount = sum(sum(subset));
  
  if (~counterCenter)
      neighbourCount = neighbourCount - neighbourhood(row+1, col+1);
end  
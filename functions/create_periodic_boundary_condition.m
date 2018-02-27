function pbcTarget = create_periodic_boundary_condition(targets)
  % create_periodic_boundary_condition(targets) - 
  %   apply periodic boundary condition by creating a matrix from input
  %   that has one additional column/row to the left/right and top/bottom
  %   Additional rows are filled with values from opposite side to satisfy 
  %   periodic boundary condition  
  % 
  rows = size(targets, 1);
  cols = size(targets, 2);
  
  pbcTargets = zeros(rows+2, cols+2);

  pbcTargets(2:rows+1, 2:cols+1) = targets;

  % copy borders to fullfill periodic boundary condition
  pbcTargets(1, 2:cols+1) = targets(rows, :); % top row gets bottom row from input
  pbcTargets(rows+2, 2:cols+1) = targets(1, :); % bottom row get top row from input
  
  pbcTargets(2:rows+1, 1) = targets(:, cols);   % ...
  pbcTargets(2:rows+1, cols+2) = targets(:, 1);
  % fill corners
  pbcTargets(1, 1) = targets(rows,cols);
  pbcTargets(1, cols+2) = targets(rows, 1);
  pbcTargets(rows+2, 1) = targets(1, cols);
  pbcTargets(rows+2, cols+2) = targets(1, 1);
end
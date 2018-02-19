function neighbours = compute_neighbours(motion_update_input,step)

basic_updates = [-1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0];
neighbours = motion_update_input + basic_updates;
logical_indices = abs(neighbours(:,1)) <= step & abs(neighbours(:,2)) <= step;
neighbours = neighbours(logical_indices,:);
logical_indices_2 = neighbours(:,1) ~= 0 | neighbours(:,2) ~= 0;
neighbours = neighbours(logical_indices_2,:);

end

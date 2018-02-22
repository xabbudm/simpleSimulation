
function [target_update,targetsEatenPerWorm] = compute_target_update(targets,foragers)

% create matrix to mark position of cells with one or more targets with a 1
target_occupation = zeros(size(targets));
target_occupation(targets > 0) = 1;

% create matrix to track position of forager with a 1
forager_occupation = zeros(size(targets));
idx = sub2ind(size(targets), foragers(:, 1), foragers(:, 2));
forager_occupation(idx) = 1;

% elementwise multiplication gives a 1 where target and forager correspond
% and a 0 otherwise
target_update = zeros(size(targets));
target_update((target_occupation.*forager_occupation) > 0) = 1;

% use matrix position of foragers to track who has found a target
targetsEatenPerWorm = zeros(size(foragers, 1), 1);
targetsEatenPerWorm(:) = target_update(idx);

% negate so that follow up add reduces the number of targets
target_update = target_update* (-1);

end

<<<<<<< HEAD
function [target_update, targets_eaten] = compute_target_update()

global targets indices_foragers;

% create matrix to mark position of cells with one or more targets with a 1
target_occupation = zeros(size(targets));
target_occupation(targets > 0) = 1;

% create matrix to track position of forager with a 1
forager_occupation = zeros(size(targets));
idx = sub2ind(size(targets), indices_foragers(:, 1), indices_foragers(:, 2));
forager_occupation(idx) = 1;
=======
function [target_update,targetsEatenPerWorm] = compute_target_update(targets,foragers)

%compute matrix that gives information at which positions one food unit is
%eaten
target_occupation = zeros(size(targets));
target_occupation(targets > 0) = 1;

worm_occupation = zeros(size(targets));
worm_occupation(sub2ind(size(targets), foragers(:, 1), foragers(:, 2))) = 1;
>>>>>>> origin/master

% elementwise multiplication gives a 1 where target and forager correspond
% and a 0 otherwise
target_update = zeros(size(targets));
target_update((target_occupation.*forager_occupation) > 0) = 1;

% use matrix position of foragers to track who has found a target
targets_eaten = zeros(size(indices_foragers, 1), 1);
targets_eaten(:) = target_update(idx);

target_update = target_update* (-1);


%compute number of food units each worm eats
targetsEatenPerWorm = diag(targets(foragers(:,1),foragers(:,2))) > 0;

end

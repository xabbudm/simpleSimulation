function [target_update,targetsEatenPerWorm] = compute_target_update(targets,foragers)

%compute matrix that gives information at which positions one food unit is
%eaten
target_occupation = zeros(size(targets));
target_occupation(targets > 0) = 1;

worm_occupation = zeros(size(targets));
worm_occupation(sub2ind(size(targets), foragers(:, 1), foragers(:, 2))) = 1;

target_update = zeros(size(targets));

target_update((target_occupation.*worm_occupation) > 0) = -1;

%compute number of food units each worm eats
targetsEatenPerWorm = diag(targets(foragers(:,1),foragers(:,2))) > 0;

end

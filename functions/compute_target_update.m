function [target_update, targets_eaten] = compute_target_update()

global targets indices_foragers;

target_occupation = zeros(size(targets));
target_occupation(targets > 0) = 1;

worm_occupation = zeros(size(targets));
idx = sub2ind(size(targets), indices_foragers(:, 1), indices_foragers(:, 2));
worm_occupation(idx) = 1;

target_update = zeros(size(targets));

target_update((target_occupation.*worm_occupation) > 0) = 1;

targets_eaten = zeros(size(indices_foragers, 1), 1);
targets_eaten(:) = target_update(idx);

target_update = target_update* (-1);


end

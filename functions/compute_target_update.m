function [target_update] = compute_target_update()

global targets indices_foragers;

target_occupation = zeros(size(targets));
target_occupation(targets > 0) = 1;

worm_occupation = zeros(size(targets));
worm_occupation(sub2ind(size(targets), indices_foragers(:, 1), indices_foragers(:, 2))) = 1;

target_update = zeros(size(targets));

target_update((target_occupation.*worm_occupation) > 0) = -1;

end

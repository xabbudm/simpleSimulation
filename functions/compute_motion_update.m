function [motionUpdate,stepTaken] = compute_motion_update(speedOnFood,speedOffFood,foragers,targets)

global N L;

%create matrix containing motion updates of all worms
motionUpdate = zeros(N,2);

%mix update indices for random order of updating to avoid bias
mixingVector = randperm(size(foragers,1));
indicesInput = foragers(mixingVector(:),:);
indicesBeforeUpdate = indicesInput;

%create a vector containing length of the steps worms have taken
stepTaken = zeros(N,1);

pbcTargets = zeros(L +2);

pbcTargets(2:L+1, 2:L+1) = targets;

% copy borders to fullfill periodic boundary condition
pbcTargets(1, 2:L+1) = targets(L, :);
pbcTargets(L+2, 2:L+1) = targets(1, :);
pbcTargets(2:L+1, 1) = targets(:, L);
pbcTargets(2:L+1, L+2) = targets(:, 1);
pbcTargets(1, 1) = targets(L,L);
pbcTargets(1, L+2) = targets(L, 1);
pbcTargets(L+2, 1) = targets(1, L);
pbcTargets(L+2, L+2) = targets(1, 1);


for n = 1:N
    
    %compute number of targets in direct neighbourhood of worm and its
    %current position and determine if it has direct neighbours
    targetsEnvironment = compute_surrounding_targets(n,indicesBeforeUpdate,pbcTargets);
    foragersSurrounding = compute_surrounding_foragers(n,indicesBeforeUpdate);
    
    if sum(targetsEnvironment) == 0 
        [motionUpdate(n,:),indicesInput] = random_step(indicesInput,n,speedOffFood);
        stepTaken(n) = max(abs(motionUpdate(n,:)));
    
    elseif sum(foragersSurrounding) == 0
        [motionUpdate(n,:),indicesInput] = random_step(indicesInput,n,speedOnFood);
        stepTaken(n) = max(abs(motionUpdate(n,:)));
    else
        [motionUpdate(n,:),indicesInput] = targeted_step(n,foragersSurrounding,indicesInput);
        stepTaken(n) = max(abs(motionUpdate(n,:)));
    end
end

%recreate original order for motion update 
matrix_reorder = [mixingVector' motionUpdate stepTaken];
ordered_matrix = sortrows(matrix_reorder);
motionUpdate = ordered_matrix(:,2:3);
stepTaken = ordered_matrix(:,4);

end



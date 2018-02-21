function [motionUpdate,stepTaken] = compute_motion_update(speedOnFood,speedOffFood,foragers,targets)

global N;

%create matrix containing motion updates of all worms
motionUpdate = zeros(N,2);

%mix update indices for random order of updating to avoid bias
mixingVector = randperm(size(foragers,1));
indicesInput = foragers(mixingVector(:),:);
indicesBeforeUpdate = indicesInput;

%create a vector containing length of the steps worms have taken
stepTaken = zeros(N,1);

for n = 1:N
    
    %compute number of targets in direct neighbourhood of worm and its
    %current position and determine if it has direct neighbours
    targetsEnvironment = compute_surrounding_targets(n,indicesBeforeUpdate,targets);
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



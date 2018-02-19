function [motionUpdate,stepTaken] = compute_motion_update(speedOnFood,speedOffFood)

global N indices_foragers;

motionUpdate = zeros(N,2);
updateIndices = indices_foragers;

%mix update indices for randomness
mixingVector = randperm(size(updateIndices,1));
updateIndices = updateIndices(mixingVector(:),:);
foragerIndices = updateIndices;
%create a vector fo step length of the step every foragers has taken
stepTaken = zeros(N,1);

for n = 1:N
    targetsEnvironment = compute_surrounding_targets(n,foragerIndices);
    foragersSurrounding = compute_surrounding_foragers(n,foragerIndices);
    
    if sum(targetsEnvironment) == 0 
        [motionUpdate(n,:),updateIndices] = random_step(updateIndices,n,speedOffFood);
        stepTaken(n) = max(abs(motionUpdate(n,:)));
    
    elseif sum(foragersSurrounding) == 0
        [motionUpdate(n,:),updateIndices] = random_step(updateIndices,n,speedOnFood);
        stepTaken(n) = max(abs(motionUpdate(n,:)));
    else
        [motionUpdate(n,:),updateIndices] = targeted_step(n,foragersSurrounding,updateIndices);
        stepTaken(n) = max(abs(motionUpdate(n,:)));
    end
end

%recreate original order for motion update 
matrix_reorder = [mixingVector' motionUpdate stepTaken];
ordered_matrix = sortrows(matrix_reorder);
motionUpdate = ordered_matrix(:,2:3);
stepTaken = ordered_matrix(:,4);

end



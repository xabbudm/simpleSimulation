function [motionUpdate,stepTaken] = compute_motion_update_2(speedOnFood,speedOffFood)

global N indices_foragers_2;

motionUpdate = zeros(N,2);
updateIndices = indices_foragers_2;

%mix update indices for randomness
mixingVector = randperm(size(updateIndices,1));
updateIndices = updateIndices(mixingVector(:),:);
foragerIndices = updateIndices;
%create a vector fo step length of the step every foragers has taken
stepTaken = zeros(N,1);

for n = 1:N
    %check if there is food available to respective forager
    targetsEnvironment = compute_surrounding_targets_2(n,foragerIndices);
    if sum(targetsEnvironment) == 0
        speed = speedOffFood;
    else
        speed = speedOnFood;
    end    
    [motionUpdate(n,:),updateIndices] = random_step(updateIndices,n,speed);    
    %compute step length of the taken step
    stepTaken(n) = max(abs(motionUpdate(n,:)));
        
end

%recreate original order for motion update 
matrixReorder = [mixingVector' motionUpdate stepTaken];
orderedMatrix = sortrows(matrixReorder);
motionUpdate = orderedMatrix(:,2:3);
stepTaken = orderedMatrix(:,4);

end
function [motionUpdate,stepTaken] = compute_motion_update_2(speedOnFood,speedOffFood,foragers_2,targets_2)

global N;

%create matrix containing motion updates of all worms
motionUpdate = zeros(N,2);

%mix update indices for random order of updating to avoid bias
mixingVector = randperm(size(foragers_2,1));
indicesInput = foragers_2(mixingVector(:),:);
indicesBeforeUpdate = indicesInput;

%create a vector fo step length of the step every foragers has taken
stepTaken = zeros(N,1);

for n = 1:N
    %check if there is food available to respective forager
    targetsEnvironment = compute_surrounding_targets(n,indicesBeforeUpdate,targets_2);
    
    if sum(targetsEnvironment) == 0
        speed = speedOffFood;
    else
        speed = speedOnFood;
    end    
    [motionUpdate(n,:),indicesInput] = random_step(indicesInput,n,speed);    
    
    %compute step length of the taken step
    stepTaken(n) = max(abs(motionUpdate(n,:)));
        
end

%recreate original order for motion update 
matrixReorder = [mixingVector' motionUpdate stepTaken];
orderedMatrix = sortrows(matrixReorder);
motionUpdate = orderedMatrix(:,2:3);
stepTaken = orderedMatrix(:,4);

end
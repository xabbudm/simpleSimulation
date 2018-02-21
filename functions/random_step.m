function [motionUpdate,indicesInput] = random_step(indicesInput,n,speed)

%calculate all possible step updates depending on the step length
if speed == 1
    possibleSteps = [-1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0];
else
   possibleSteps = [-2 -2; -2 -1; -2 0; -2 1; -2 2; -1 2; 0 2; 1 2; 2 2;...
       2 1; 2 0; 2 -1; 2 -2; 1 -2; 0 -2; -1 -2];    
end

%choose one of the possible steps and check if site is available
choice = randi(size(possibleSteps,1),1);
motionUpdate = possibleSteps(choice,:);
remainingPossibilities = possibleSteps;
remainingPossibilities(choice,:) = [];
[motionUpdate,indicesInput] = check_availability(motionUpdate,n,...
        indicesInput,remainingPossibilities);
end

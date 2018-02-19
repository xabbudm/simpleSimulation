function [motionUpdate,updateIndices] = random_step(updateIndices,n,speed)

%take care that these are stated in motion updates
basicUpdate = [-1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0];

%calculate all possible step updates depending on the step length
if speed == 1
    possibleSteps = basicUpdate;
else
    possibleSteps = zeros(8*speed,2);
    possibleSteps(1:8,:) = basicUpdate .* speed;
    firstColumn = [speed*ones(1,(speed-1)*2) -speed*ones(1,(speed-1)*2)]';
    secondColumn = [1:speed-1 -1:-1:-speed+1]';
    secondColumn = repmat(secondColumn,2,1);
    possibleSteps(9:(speed-1)*4 + 8,:) = [firstColumn secondColumn];
    possibleSteps((speed-1)*4 + 9:end,:) = [secondColumn firstColumn];
    
end

%choose one of the possible steps and check if site is available
choice = randi(size(possibleSteps,1),1);
motionUpdate = possibleSteps(choice,:);
remainingPossibilities = [-possibleSteps(:,2) possibleSteps(:,1)];
remainingPossibilities(choice,:) = [];
[motionUpdate,updateIndices] = check_availability(motionUpdate,n,...
        updateIndices,remainingPossibilities);

end

function [motionUpdate,updateIndices] = targeted_step(n,foragersSurrounding,updateIndices)

totalProbabilities = foragersSurrounding./sum(foragersSurrounding);
allIndexUpdates = [-1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1];

%calculate updates to the neighbour worms
logicalToNeighbours = totalProbabilities > 0;
updatesToNeighbours = allIndexUpdates(logicalToNeighbours,:);

%calculate updates to fields next to neighbours with steplength 1 
updatesNextNeighbour = zeros(size(updatesToNeighbours,1)*8,2);
for ii = 1:size(updatesToNeighbours,1)
    updatesNextNeighbour((ii-1)*8+1:ii*8,:) = updatesToNeighbours(ii,:) + allIndexUpdates;
end

%eliminate all steps that are not 1 long and delete same
%entries
WrongDistance = abs(updatesNextNeighbour(:,1)) == 2 | ...
    abs(updatesNextNeighbour(:,2)) == 2;
updatesNextNeighbour(WrongDistance,:) = [];
WrongDistanceZero = updatesNextNeighbour(:,1) == 0 & updatesNextNeighbour(:,2) == 0;
updatesNextNeighbour(WrongDistanceZero,:) = [];
updatesNextNeighbour = unique(updatesNextNeighbour,'rows');

%choose one of the possible updates and check if site is available
choice = randi(size(updatesNextNeighbour,1),1);
motionUpdate = [updatesNextNeighbour(choice,2) -updatesNextNeighbour(choice,1)];
remainingPossibilities = updatesNextNeighbour;
remainingPossibilities(choice,:) = [];
[motionUpdate,updateIndices] = check_availability(motionUpdate,n,...
    updateIndices,remainingPossibilities);

end
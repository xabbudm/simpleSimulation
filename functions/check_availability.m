function [motionUpdate,indicesInput] = check_availability(motionUpdate,n,indicesInput,remainingPossibilities)

global L; 
%check if field chosen by motion update is available
new_index = indicesInput(n,:) + motionUpdate;
new_index(new_index > L) = new_index(new_index > L) - L;
new_index(new_index < 1) = new_index(new_index < 1) + L;

position = find(indicesInput(:,1) == new_index(1) & indicesInput(:,2) == new_index(2));

%checks if there is another forager in the square forager n wants to go 
if isempty(position)
    indicesInput(n,:) = new_index;
else
    if isempty(remainingPossibilities)
        motionUpdate = [0 0];
        indicesInput(n,:) = indicesInput(n,:);
    else
        mixed_vector = randperm(size(remainingPossibilities,1));
        for ii = 1:size(remainingPossibilities,1)
            update = remainingPossibilities(mixed_vector(ii),:);
            new_index = indicesInput(n,:) + update;
            new_index(new_index > L) = new_index(new_index > L) - L;
            new_index(new_index < 1) = new_index(new_index < 1) + L;
            position = find(indicesInput(:,1) == new_index(1) & indicesInput(:,2) == new_index(2));
            if isempty(position)
                motionUpdate = update;
                indicesInput(n,:) = new_index;
                break;
            else
                motionUpdate = [0 0];
                indicesInput(n,:) = indicesInput(n,:);
            end            
        end
    end
end
    
end

%wenn erster treffer passt, wird dann das gleiche motion update ausgegeben?
        
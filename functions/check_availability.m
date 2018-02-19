function [motion_update,update_indices] = check_availability(motion_update,n,update_indices,remainingPossibilities)

global L; 
%check if field chosen by motion update is available
new_index = update_indices(n,:) + [-motion_update(2) motion_update(1)];
new_index(new_index > L) = new_index(new_index > L) - L;
new_index(new_index < 1) = new_index(new_index < 1) + L;

position = find(update_indices(:,1) == new_index(1) & update_indices(:,2) == new_index(2));

%checks if there is another forager in the square forager n wants to go 
if isempty(position)
    update_indices(n,:) = new_index;
else
    if isempty(remainingPossibilities)
        motion_update = [0 0];
        update_indices(n,:) = update_indices(n,:);
    else
        mixed_vector = randperm(size(remainingPossibilities,1));
        for ii = 1:size(remainingPossibilities,1)
            update = remainingPossibilities(mixed_vector(ii),:);
            new_index = update_indices(n,:) + update;
            new_index(new_index > L) = new_index(new_index > L) - L;
            new_index(new_index < 1) = new_index(new_index < 1) + L;
            position = find(update_indices(:,1) == new_index(1) & update_indices(:,2) == new_index(2));
            if isempty(position)
                motion_update = [update(2) -update(1)];
                update_indices(n,:) = new_index;
                break;
            else
                motion_update = [0 0];
                update_indices(n,:) = update_indices(n,:);
            end            
        end
    end
end
    
end

        
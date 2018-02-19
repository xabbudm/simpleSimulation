function [target_update,individual_eaten] = compute_target_update()

global targets indices_foragers N L;

target_update = zeros(L);
individual_eaten = zeros(N,1);
for n = 1:N
    if targets(indices_foragers(n,1),indices_foragers(n,2)) >= 1
        target_update(indices_foragers(n,1),indices_foragers(n,2)) = -1;
        individual_eaten(n) = 1;
    else
        target_update(indices_foragers(n,1),indices_foragers(n,2)) = 0;
        individual_eaten(n) = 0;
    end
    
end
end

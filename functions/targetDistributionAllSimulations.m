function allDistributions = targetDistributionAllSimulations(initialNumberTargets,allSimulations)

global gamma L;

allDistributions = zeros(L,L,allSimulations);
for ii = 1:allSimulations
    %compute targets for one simulation and initialize targets
    target = zeros(L);

    %matrix with indices of targets
    index = zeros(initialNumberTargets * L^2,2);
    index(1,:) = randi(L,1,2);
    for n = 2:size(index,1)

        %compute distance where new target should appear
        r = rand(1);
        if gamma == 0
            index(n,:) = randi(L,1,2);
        else
            if r < (1/(L/sqrt(2)))^gamma
                d = 1 + ((L/sqrt(2))-1) * rand(1);
            else 
                d = r^(-1/gamma);
            end

            %choose existing target as basis
            basis = randi(n-1,1,1);

            %compute direction of update
            direction = 2*pi*rand(1);
            update(1,1) = round(-(d * sin(direction)));
            update(1,2) = round(d * cos(direction));
            new_position = index(basis,:) + update(1,:);
            new_position(new_position > L) = new_position(new_position > L) - L;
            new_position(new_position < 1) = new_position(new_position < 1) + L;
            index(n,:) = new_position;
        end
        %update target matrix
        target(index(n,1),index(n,2)) = target(index(n,1),index(n,2)) + 1;
    end
    target(index(1,1),index(1,2)) = target(index(1,1),index(1,2)) + 1;
    
    %save target distribution in 3D matrix
    allDistributions(:,:,ii) = target;
end
end

clear; 
clear -vars;
%% Global variables

%scalar
global L N;

%% General Parameter Initialization
gamma = 3;
L = 35;
N = 40;
time = 2200;
numberSimulations = 5;
initialNumberTargets = 10;
initialForagers = foragerDistributionAllSimulations(numberSimulations);
initialTargets = targetDistributionAllSimulations(initialNumberTargets,numberSimulations,gamma);
speedOnFood = 1;
speedOffFood = 2;
%% Initialization for social worms
saveForagers = zeros(N,2,time);
saveTargets = zeros(L,L,time);
allSteps = zeros(N,time,numberSimulations);
targetsEaten = zeros(N,time,numberSimulations);
remainingTargets = zeros(numberSimulations,time);
TimeAllEaten = zeros(numberSimulations,1);
%% Script for social foraging

for loop = 1:numberSimulations

    foragers = initialForagers(:,:,loop);
    targets = initialTargets(:,:,loop);

    for t = 1:time
        
        %Step 1: Compute the eaten targets at the current positions of the
        %worms
        [targetUpdate,targetsEaten(:,t,loop)] = compute_target_update(targets,foragers);
        targets = targets + targetUpdate;
       
        %Step 2: Determine motion update of the foragers and save the average
        %surrounding foragers
        [motionUpdate,allSteps(:,t,loop)] = compute_motion_update(speedOnFood,speedOffFood,foragers,targets);

        %Step 3: Update the position of the foragers
        foragers = foragers + motionUpdate;
        foragers(foragers > L) = foragers(foragers > L) - L;
        foragers(foragers < 1) = foragers(foragers < 1) + L;

        %Step 4: Save forager and target distribution
        saveForagers(:,:,t) = foragers;
        saveTargets(:,:,t) = targets;
    end

    %Step 1: Calculate remaining targets and time when everything has been eaten
    remainingTargets(loop,:) = reshape(sum(sum(saveTargets)),[1,time]);
    zeroTargets = find(remainingTargets(loop,:) < round(sum(sum(initialTargets)) * 0.1));
    if isempty(zeroTargets)
        TimeAllEaten(loop) = NaN;
        fprintf('Not all targets are eaten.\nRepeat simulation with increased time\n')
        return;
    else
        TimeAllEaten(loop) = zeroTargets(1);
    end
end

%% Initialization for solitary worms
saveForagers2 = zeros(N,2,time);
saveTargets2 = zeros(L,L,time);
allSteps2 = zeros(N,time,numberSimulations);
targetsEaten2 = zeros(N,time,numberSimulations);
remainingTargets2 = zeros(numberSimulations,time);
TimeAllEaten2 = zeros(numberSimulations,1);
%% Script for solitary worms
for loop2 = 1:numberSimulations

    foragers_2 = initialForagers(:,:,loop2);
    targets_2 = initialTargets(:,:,loop2);

    for l = 1:time
        
        %Step 1: Compute the eaten targets
        [targetUpdate,targetsEaten2(:,l,loop2)] = compute_target_update(targets_2,foragers_2);
        targets_2 = targets_2 + targetUpdate;

        %Step 2: Determine motion update of the foragers and save the taken
        %steps
        [motionUpdate,allSteps2(:,l,loop2)] = compute_motion_update_2(speedOnFood,speedOffFood,foragers_2,targets_2);

        %Step 3: Update the position of the foragers
        foragers_2 = foragers_2 + motionUpdate;
        foragers_2(foragers_2 > L) = foragers_2(foragers_2 > L) - L;
        foragers_2(foragers_2 < 1) = foragers_2(foragers_2 < 1) + L;

        %Step 4: Save forager and target distribution
        saveForagers2(:,:,l) = foragers_2;
        saveTargets2(:,:,l) = targets_2;
    end

    %Step 1: Calculate remaining targets and time when everything has been eaten
    remainingTargets2(loop2,:) = reshape(sum(sum(saveTargets2)),[1,time]);
    zeroTargets = find(remainingTargets2(loop2,:) < round(sum(sum(initialTargets)) * 0.1));
    if isempty(zeroTargets)
        TimeAllEaten2(loop2) = NaN;
        fprintf('Not all targets are eaten.\nRepeat simulation with increased time\n')
        return;
    else
        TimeAllEaten2(loop2) = zeroTargets(1);
    end
end


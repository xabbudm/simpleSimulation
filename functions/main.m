clear; 
clear -vars;
%% Global variables

%scalar
global L N gamma steplength;

%Nx2
global foragers foragers_2 indices_foragers indices_foragers_2;

%LxL
global targets targets_2;

%% General Parameter Initialization
gamma = 3;
L = 35;
N = 40;
steplength = 2;
time = 2200;
numberSimulations = 500;
initialNumberTargets = 10;
initialForagers = foragerDistributionAllSimulations(numberSimulations);
initialTargets = targetDistributionAllSimulations(initialNumberTargets,numberSimulations);
speedOnFood = 1;
speedOffFood = 2;
%% Initialization for targeted simulation
saveForagers = zeros(N,2,time);
saveTargets = zeros(L,L,time);
allSteps = zeros(N,time,numberSimulations);
targetsEaten = zeros(N,time,numberSimulations);
remainingTargets = zeros(numberSimulations,time);
TimeAllEaten = zeros(numberSimulations,1);
%% Script for foraging with possible targeted steps

for loop = 1:numberSimulations

    foragers = initialForagers(:,:,loop);
    targets = initialTargets(:,:,loop);

    for t = 1:time
        %Step 1: Compute indices of foragers
        indices_foragers = compute_indices_foragers();

        %Step 2: Compute the eaten targets
        [targetUpdate,targetsEaten(:,t,loop)] = compute_target_update();
        targets = targets + targetUpdate;
        targets(targets < 0) = 0;

        %Step 3: Determine motion update of the foragers and save the average
        %surrounding foragers
        [motionUpdate,allSteps(:,t,loop)] = compute_motion_update(speedOnFood,speedOffFood);

        %Step 4: Update the position of the foragers
        foragers = foragers + motionUpdate;
        foragers(foragers > L) = foragers(foragers > L) - L;
        foragers(foragers < 1) = foragers(foragers < 1) + L;

        %Step 5: Save forager and target distribution
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

%% Initialization for random foraging
saveForagers2 = zeros(N,2,time);
saveTargets2 = zeros(L,L,time);
allSteps2 = zeros(N,time,numberSimulations);
targetsEaten2 = zeros(N,time,numberSimulations);
remainingTargets2 = zeros(numberSimulations,time);
TimeAllEaten2 = zeros(numberSimulations,1);
%% Script for entirely random foraging

for loop2 = 1:numberSimulations

    foragers_2 = initialForagers(:,:,loop2);
    targets_2 = initialTargets(:,:,loop2);

    for l = 1:time
        %Step 1: Compute indices of foragers
        indices_foragers_2 = compute_indices_foragers_2();

         %Step 2: Compute the eaten targets
        [targetUpdate,targetsEaten2(:,l,loop2)] = compute_target_update_2();
        targets_2 = targets_2 + targetUpdate;
        targets_2(targets_2 < 0) = 0;
        
        savefig

        %Step 3: Determine motion update of the foragers and save the taken
        %steps
        [motionUpdate,allSteps2(:,l,loop2)] = compute_motion_update_2(speedOnFood,speedOffFood);

        %Step 4: Update the position of the foragers
        foragers_2 = foragers_2 + motionUpdate;
        foragers_2(foragers_2 > L) = foragers_2(foragers_2 > L) - L;
        foragers_2(foragers_2 < 1) = foragers_2(foragers_2 < 1) + L;

        %Step 5: Save forager and target distribution
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


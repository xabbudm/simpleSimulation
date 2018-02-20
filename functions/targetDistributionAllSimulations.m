function allDistributions = targetDistributionAllSimulations(initialNumberTargets,allSimulations)

global gamma L;

allDistributions = zeros(L,L,allSimulations);
for ii = 1:allSimulations
    %compute targets for one simulation and initialize targets
    target = zeros(L);

    %matrix with indices of targets
    index = zeros(initialNumberTargets * L^2,2);
    index(1,:) = randi(L,1,2);
    
    if gamma == 0
      index = randi(L, initialNumberTargets * L^2, 2);
    else
      r_ = rand(size(index, 1), 1);
      r_in = logical(r_ < (1/(L/sqrt(2)))^gamma);
      
      d = zeros(size(r_));
      d(r_in) = 1 + r_(r_in).*((L/sqrt(2))-1);
      d(~r_in) = r_(~r_in).^(1-gamma);
      
      direction = rand(size(r_))*2*pi;
      update = zeros(size(r_, 1), 2);
      update(:, 1) = round(-(d.*sin(direction)));
      update(:, 2) = round((d.*cos(direction)));
      for n = 2:size(index,1)

          %compute distance where new target should appear
%          r = rand(1);
%          if r < (1/(L/sqrt(2)))^gamma
%              d = 1 + ((L/sqrt(2))-1) * rand(1); % nochmals rand k�nnte d �ber Schwelle heben
%          else 
%              d = r^(-1/gamma);
%          end

          %choose existing target as basis
          basis = randi(n-1);

          %compute direction of update
          new_position = index(basis,:) + update(n,:);
          new_position(new_position > L) = new_position(new_position > L) - L;
          new_position(new_position < 1) = new_position(new_position < 1) + L;
          index(n,:) = new_position;
      end
%      index(index > L) = index(index > L) - L;
%      index(index < 1) = index(index < 1) + L;

      sp_target = sparse(index(:, 1), index(:, 2), ones(1, size(index, 1)), L, L);
      target = full(sp_target);
    
    %save target distribution in 3D matrix
    allDistributions(:,:,ii) = target;
end
end

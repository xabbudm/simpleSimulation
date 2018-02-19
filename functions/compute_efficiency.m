function efficiency = compute_efficiency(steps,targets,timeEaten,time)


%calculate matrix with efficiencies at every time step
efficiency = targets./steps;

%if steps is 0 at a position, the result of division will be Inf -->
%replace all Inf with NaN and use nanmean and nanstd for further
%calculations
efficiency(efficiency == Inf) = NaN;

%adapt efficiencies after all food is depleted
efficiency(:,timeEaten+1:end) = repmat(efficiency(:,timeEaten),1,(time-(timeEaten+1))); 


end



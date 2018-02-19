function foragerDistribution = foragerDistributionAllSimulations(numberSimulations)

global N L;

%distribute foragers for each simulation round new and ensure that they
%cannot be on the same square

foragerDistribution = zeros(N,2,numberSimulations);
for ii = 1:numberSimulations
    forager = zeros(N,2);
    forager(1,:) = randi(L,1,2);
    for n = 2:N
        %initialize position so that it is not empty
        position = 1;
        while isempty(position) == 0
            forager(n,:) = randi(L,1,2);
            position = find(forager(1:n-1,1) == forager(n,1) & forager(1:n-1,2) == forager(n,2));
        end
    end
    
    foragerDistribution(:,:,ii) = forager;
end
end

function forager = initial_forager_distribution()

global N L;

%distribute foragers so that they cannot be on same square
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
end



    
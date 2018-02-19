function target = one_patch()

global L;

target = zeros(L,L);

%compute all fields in matrix laying within the radius of circle of food
radius = 6;
x_middle = 18;
y_middle = 18;

for ii = 1:L
    for jj = 1:L
        if sqrt((jj - y_middle)^2 + (ii - x_middle)^2) <= radius
            target(ii,jj,1) = 1;
        end
    end
end

%calculate how many targets there are per square
total_targets = L^2*10;
targets_per_position = round(total_targets/sum(sum(target)));

%update target matrix with corresponding targets per square
target = target.*targets_per_position;
end


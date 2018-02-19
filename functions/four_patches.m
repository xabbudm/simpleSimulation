function target = four_patches()

global L,

target = zeros(L,L);

%compute all fields in matrix laying within the radius of circle of food
radius = 3;
%vectors containing coordinates of centres of food patches
x_middle = [9 9 27 27];
y_middle = [9 27 27 9];

for n = 1:4
    for ii = 1:L
        for jj = 1:L
            if sqrt((jj - y_middle(n))^2 + (ii - x_middle(n))^2) <= radius
                target(ii,jj) = 1;
            end
        end
    end
end

%calculate how many targets there are per square
total_targets = L^2*10;
targets_per_position = round(total_targets/sum(sum(target)));

%update target matrix with corresponding targets per square
target = target.*targets_per_position;
end

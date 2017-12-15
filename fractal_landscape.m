side = 257; %must be 2^x+1

data = zeros(side, side);
data(1, 1) = rand;
data(1, end) = rand;
data(end, 1) = rand;
data(end, end) = rand;
x1 = 1;
y1 = 1;
x2 = side;
y2 = side;
data = morph(x1, y1, x2, y2, data);
%add water effect
for i = 1:side
    for j = 1:side
        if(data(i,j) < 0.5)
            data(i,j) = 0.5;
        end
    end
end

figure(1)

surf(data, 'FaceColor', [0.9 0.9 0.9], 'EdgeColor', 'k')
pbaspect([2 2 1])
grid off
axis off

figure(2)
surf(data, 'EdgeColor', 'none')
pbaspect([2 2 1])
grid off
axis off
camlight left
lighting phong




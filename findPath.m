function findPath(N, obstacleMap, startX, startY)
    % Initialize visited matrix
    visited = zeros(N, N);
    
    % Initialize queue for BFS
    queue = [];
    
    % Define possible moves (up, down, left, right)
    moves = [0, 1; 0, -1; -1, 0; 1, 0];
    
    % Initialize parent matrix to reconstruct path
    parent = zeros(N, N, 2);
    
    % Start BFS from the bottom edge
    queue = [queue; startX, startY];
    visited(startX, startY) = 1;
    
    while ~isempty(queue)
        % Pop the front node
        node = queue(1, :);
        queue(1, :) = [];
        
        % Check if we have reached the top edge
        if node(1) == 1
            break;
        end
        
        % Explore neighboring nodes
        for i = 1:size(moves, 1)
            newX = node(1) + moves(i, 1);
            newY = node(2) + moves(i, 2);
            
            % Check if the new position is within the grid and not visited
            if newX >= 1 && newX <= N && newY >= 1 && newY <= N && visited(newX, newY) == 0 && obstacleMap(newX, newY) == 0
                visited(newX, newY) = 1;
                queue = [queue; newX, newY];
                parent(newX, newY, :) = [node(1), node(2)];
            end
        end
    end
    
    % Reconstruct and visualize the path
    path = [startX, startY];
    while path(end, 1) > 1
        node = parent(path(end, 1), path(end, 2), :);
        path = [path; squeeze(node)'];
    end
    
    % Visualize the grid, obstacles, and path
    figure;
    colormap('gray');
    imagesc(obstacleMap');
    axis equal;
    hold on;
    plot(path(:, 1), path(:, 2), 'r', 'LineWidth', 2);
    plot(startX, startY, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
    title('Path Finding in Grid with Obstacles');
    hold off;
end

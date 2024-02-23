function rotatePolygon(vertices, rotationAngle)
    % Check if the number of vertices is at least 3
    if size(vertices, 1) < 3
        error('A polygon must have at least 3 vertices.');
    end

    % Calculate the center of the polygon
    centerX = mean(vertices(:, 1));
    centerY = mean(vertices(:, 2));

    % Translate the vertices to the origin
    translatedVertices = vertices - [centerX, centerY];

    % Convert rotation angle to radians
    rotationAngle = deg2rad(rotationAngle);

    % Perform rotation
    rotatedX = translatedVertices(:, 1) * cos(rotationAngle) - translatedVertices(:, 2) * sin(rotationAngle);
    rotatedY = translatedVertices(:, 1) * sin(rotationAngle) + translatedVertices(:, 2) * cos(rotationAngle);

    % Translate the rotated vertices back to the original center
    rotatedVertices = [rotatedX, rotatedY] + [centerX, centerY];

    % Plot the original and rotated polygons
    figure;
    hold on;
    plot(vertices(:, 1), vertices(:, 2), 'b', 'LineWidth', 2); % Original polygon in blue
    plot(rotatedVertices(:, 1), rotatedVertices(:, 2), 'r', 'LineWidth', 2); % Rotated polygon in red
    axis equal;
    xlabel('X');
    ylabel('Y');
    title('Polygon Rotation');
    legend('Original', 'Rotated');
    hold off;
end

% Replace [Your ID number] with your actual ID number
rotationAngle = mod([Your ID number], 360);

% Define the vertices of the polygon
vertices = [0, 0; 2, 0; 2, 1; 1, 2; 0, 1];

% Call the function to rotate and plot the polygon
rotatePolygon(vertices, rotationAngle);


function d = euclidean_distance(u, v)
    % Ensure that u and v are column vectors.
    u = u(:);
    v = v(:);

    % Calculate the distance.
    d = sqrt(sum((u - v).^2));
end
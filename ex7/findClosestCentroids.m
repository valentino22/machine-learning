function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% calculate for each point which is the corresponding centoid and store it in a new column idx
% idx has the same amount of rows as X since each example needs to have an assigned centroid (which it's closest to)
for i = 1:size(X, 1)
  minimum = 1000000000;
  for k = 1:K
    diff = X(i, :)'-centroids(k, :)';
    centroid_distance = diff'*diff;
    if (centroid_distance < minimum) % if currently checked centroid is closer use that centroid's index
      idx(i) = k;
      minimum = centroid_distance;
    end
  end
end




% =============================================================

end


function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


hypothesis = sigmoid(X*theta);

% Error when label = 1
cost_when_label_1 = -y .* log(hypothesis);

% Error when label = 0
cost_when_label_0 = (1 - y) .* log(1 - hypothesis);

% Theta without the first parameter, we start from index 2 to leave out the first parameter
smaller_theta = theta(2:size(theta));

% Lambda part
lambda_part = lambda * sum(smaller_theta.^2) / (2 * m);

% Cost function
J=sum(cost_when_label_1 - cost_when_label_0) / m + lambda_part;

% theta is a 28 dimensional array now, 
% the first element of the grad has a slightly different equasion then the rest of the elements
grad_temp_for_first_element = sum((hypothesis - y) .* X) / m;
grad_temp_for_rest_of_elements = sum((hypothesis - y) .* X) / m+ lambda/m*theta';

% select the first element from the grad values calculated with the first equasion
first_element = grad_temp_for_first_element(1);

% select the rest of the element from the grad values calculated with the second equasion
rest_of_elements = grad_temp_for_rest_of_elements(2:size(grad_temp_for_rest_of_elements,2));

% concatenate the 2 vectors
grad = [first_element rest_of_elements]


% =============================================================

end

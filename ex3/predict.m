function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% first we compute the hidden layer, simply multiplying the given model (Theta1) for the 1st layer with the values from the 1st layer (input pixel values) and applying the activation function to it.
hidden_layer = sigmoid(X * Theta1');

% the last layer's output is the product of hidden layer model (Theta2) and the output of the hidden layer
% we also need to add the bias element similarly to the first layer
hidden_layer_size = size(hidden_layer,1);
hidden_layer_with_bias = [ones(hidden_layer_size,1) hidden_layer];

output = sigmoid(hidden_layer_with_bias * Theta2');

[x, p] = max(output');

p = p';


% =========================================================================


end

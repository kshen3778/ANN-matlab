function [neg_loglike,output_y, dE_dw1, dE_dw2] = function_e(traindata, traintargets, N_hidden, W_1, W_2)

N_data = size(traindata,1); %Number of training samples
N_outputs = size(traintargets,2);

%computes the hidden layer before and after activation
hidden_x = [ones(N_data,1) traindata]*W_1;
hidden_y = 1./(1+exp(-hidden_x));  %calculates the sigmoidal
hidden_bias = [ones(N_data,1) hidden_y]; %adds a bias to the hidden layer

%computes the output layer before and after softmax
output_x = [hidden_bias] * W_2;
output_exp = exp(output_x);
output_y = output_exp./(sum(output_exp,2)*ones(1,N_outputs)); %computes softmax on each output

%applies the -sum(targets*ln(output_y)) over all samples
neg_loglike = sum(-(sum(traintargets.*log(output_y),2)),1);

%computes the gradients for the two sets of weights: between input and
%hidden, as well the weights between hidden and outputs
dE_dw2 = ((output_y - traintargets)'*hidden_bias)' ; 
dE_dw1 = [ones(N_data,1) traindata]'*((hidden_y.*(1 - hidden_y)).*((output_y-traintargets)*W_2(2:1+N_hidden,:)'));

end

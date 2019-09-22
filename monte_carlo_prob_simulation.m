%{
sep 9
chap3 hw ex5
monty hall simulation
%}

simulation_num = 10000;
prob = [0,0]; %[times alice singing, times bob singing]
for i=1:simulation_num
    inshower = rand(1); %open a door, then
    if inshower>0.5 
        prob(1) = prob(1)+1; %if saw alice, then singing
    else
        singing = rand(1); 
        if singing < 0.25 %o.w, 1/4 chance singing
            prob(2) = prob(2)+1;
        end
    end
   
end

% disp(prob);
prob_alice_inshower = prob(1)/sum(prob);
fprintf("probability that Alice is in the shower is %.3f \n", prob_alice_inshower);
% around 0.8



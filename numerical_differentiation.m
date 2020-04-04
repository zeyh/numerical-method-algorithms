%{
Dec 9 2019

@param: 2 vectors containing the x and y coordinates of the data (may not be evenly spaced)
@return: approximation to the derivative at each point in the vector of inputs

-calculate h based on the data
-work for arbitarary number of entries in the vectors
-make sure both vectors have same number of entries and return err if not
%}

function deriv = Numerical_Differentiation(x,y)
    % initialize deriv
    last_idx = length(x); % the last index of x is the length of x since counting from 1 not 0
    deriv = zeros(1,last_idx);
    % make sure both vectors have same number of entries and return err if not
    if last_idx ~= length(y)
        error('ERROR: Input Vector Length Not Equal!')
    end
    
    if last_idx <= 1
        error('ERROR: Please Input More Than 1 Point!')
    end
    
    % forward diff
    h1 = x(2) - x(1);
    forward_deriv = (y(2)-y(1))/h1;
    deriv(1) = forward_deriv;
    % backward diff
    h2 = x(last_idx) - x(last_idx-1);
    backward_deriv = (y(last_idx) - y(last_idx-1))/h2;
    deriv(last_idx) = backward_deriv;
    
    if last_idx == 2 % if only two points are given
        return;
    end

%     % centered diff -- not used 
%     for i=2:last_idx-1
%             h = x(i+1)-x(i-1);
%             centered_deriv = (y(i+1)-y(i-1))/h;
%             deriv(i) = centered_deriv;
%     end    
    

    for i=2:last_idx-1 % for points in the middle
        % forward diff
        h1 = x(i+1) - x(i);
        forward_deriv = (y(i+1)-y(i))/h1;
        
        % backward diff
        h2 = x(i) - x(i-1);
        backward_deriv = (y(i) - y(i-1))/h2;
        deriv(last_idx) = backward_deriv;
        
        % averaging those two methods
        deriv(i) = (forward_deriv + backward_deriv)/2; 
    end   

end







%Question 1 Part 2
A = [ 2 (-3)  2    1    4 ;
      1   2 (-4) (-1)   1 ;
    (-2)  4   1    1    3 ;
      3   1   1  (-2) (-2);
      2   6   1  (-4) (-2);];
      
b = [  26 ;
      (-5);
       28 ;
     (-10);
      (-9);];
      
lowerTriangle = zeros(5);
finalB = zeros(1);




%gaussian elimination
for index = 1 : 4
  %create a diagonal matrix of 1
  diagonal = [1; 1; 1; 1; 1;];
  currentM = diag(diagonal);
  
  %Finds the column to be used for premultiplaction
  %corresponding to the index
  if index == 1
    currentCol = A(:, index);;
  else
    currentCol = MA(:, index);;
  end
  
  %backward substitution
  for i = index:4
    x = ((-1) * currentCol(i+1, 1)) / currentCol(index, 1);
    currentM(i + 1, index) = x;
  end
  
  %setting M*A and M*b
  if index == 1
    MA = currentM * A;
    MB = currentM * b;
  else
    MA = currentM * MA;
    MB = currentM * MB;
  end
  
  %last column
  if index == 4
    lowerTriangle = MA;
    finalB = MB;
  end
end

disp('Question 1 Part 2');
disp('Lower Triangle: ');
disp(lowerTriangle);
disp('Final MB: ');
disp(finalB);
disp('-------------------------------');

%Question 1 Part 3
[L, U] = lu(A);
disp('Display with MATLAB routine:');
disp(U);
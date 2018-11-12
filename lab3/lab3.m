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
    upperTriangular = MA;
    finalB = MB;
  end
end

disp('Question 1 Part 2');
disp('Upper Triangle: ');
disp(upperTriangular);
disp('Final MB: ');
disp(finalB);
disp('-------------------------------');

%----------------------------------------------
%Question 1 Part 3
r = rref(A);
disp('Display with MATLAB routine:');
disp(r);
disp(' ');

%----------------------------------------------
%Question 1 Part 4
%backward substitution to solve for x
x4 = zeros(5,1);
for j = 5:-1:1
    if (upperTriangular(j, j) == 0) 
      continue; 
    end;
    x4(j, 1) = finalB(j) / upperTriangular(j, j);
    b(1:j-1) = finalB(1:j-1) - upperTriangular(1:j-1, j) * x4(j);
end

disp('-------------------------------');
disp('Question 1 Part 4:');
disp(x4);
disp('-------------------------------');

%----------------------------------------------
%Question 1 Part 5
solX_1 = A \ b;
solX_2 = linsolve(A, b);
disp('Question 1 - Part 5');
disp('1st way:');
disp(solX_1);
disp('2nd way:');
disp(solX_2);
disp(' ');

%------------------------------------------------
%Question 2

A2 = [ 2    4   (-2);
       4    9   (-3);
     (-2) (-1)    7;]; 
     
b2 = [ 2;
       8;
      10;];
      
c2 = [ 4 ;
       8 ;
     (-6);];

[L, U] = lu(A2);
part1 = U\b2;
part2 = U\c2;

disp('Question 2 - ');
disp('Part 1:');
disp(part1);
disp('Part 2:');
disp(part2);
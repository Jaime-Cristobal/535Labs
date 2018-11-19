%Lab 4 - samplecode for nmf implementation
%      - fill in the missing code

load Fence_data                                                                             % load the whole data set

data = artificial_data;                                                                     % extract out the data

dimData = size(data);                                                                   % get the dimensions of data 

V = reshape(data, [], dimData);                                                          % convert original data to two dimensional matrix

rank = 16;                                                                                  % define the number of bases
iteration = 1000;                                                                           % define iteration criterion

W = 2 * rand();                                                           % initialize W, H
H = 2 * rand(); 

for ii = 1:iteration
    H = H .*((transpose(W) * V) ./ (transpose(W) * W * H));                                                              % updating rules for W, H
    W = W .* ((V * transpose(H)) ./ (W * H * transpose(H))); 
end


figure(111)
for mm = 1:rank                                                                             % show some samples of original data
    subplot(sqrt(rank), sqrt(rank), mm);imshow(data(:,:,mm));
end

figure(222)
for mm = 1:rank
    imagesc(W, H, V);                                            % show the learned bases use imagesc()
                                                                                            % function
    colormap(gray); axis off;
end  


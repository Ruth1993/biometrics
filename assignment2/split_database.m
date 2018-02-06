function [Xtr, Xte] = split_database
%load size of FaceData database
faces = matfile('FaceData.mat');
[m, n] = size(faces, 'FaceData');

%split faces into half; first half is Xtr (training set) and second half is
faces_new = zeros(1, m * n); % pre-allocate for speedup
counter = 0;
for i=1:m
    for j=1:n
        faces_new(counter) = reshape(double(faces(i,j).Image)/255, 2576,1);
        counter = counter + 1;
    end
end

%Xte (testing set)
Xtr = zeros(1,m*n/2);
Xte = zeros(1,m*n/2);

%initialize Id (identity labels for Xte)
Id = [1:1:d];

%vectorise images in Xtr and Xte
for i=1:m
    for j=1:n
        f = reshape(double(faces.FaceData(i,j).Image)/255, 2576,1);
        
        if m<=20
            Xtr(1,(m-1)*n+j) = f;
        else 
            Xte(1,(m-1)*n+j) = f;
        end
    end
end

end

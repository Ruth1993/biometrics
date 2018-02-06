function [Xtr, Xte] = split_database
%load size of FaceData database
faces = matfile('FaceData.mat');
[m, n] = size(faces, 'FaceData');

%split faces into half; first half is Xtr (training set) and second half is
%Xte (testing set)
Xtr = zeros(1,m*n/2);
Xte = zeros(1,m*n/2);

%initialize Id (identity labels for Xte)
Id = [1:1:size(Xte,2)];

%vectorise images in Xtr and Xte
for i=1:m
    for j=1:n
        f = faces.FaceData(i,j);
        vec = reshape(double(f.Image)/255, 2576,1);
        
        if i<=20
            Xtr(1,(i-1)*n+j) = vec;
        else 
            Xte(1,(i-21)*n+j) = vec;
        end
    end
end

end

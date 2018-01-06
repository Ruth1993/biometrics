function [Xtr, Xte] = split_database
%load size of FaceData database
faces = matfile('FaceData.mat');
[m, n] = size(faces, 'FaceData');

%slit faces into half; first half is Xtr (training set) and second half is
%Xte (testing set)
Xtr = faces.FaceData(1:m/2, 1:n);
Xte = faces.FaceData(m/2+1:m, 1:n);

%size Xtr and Xte
[d, l] = size(Xte);

%initialize Id (identity labels for Xte)
Id = [1:1:d];

%vectorise images in Xtr and Xte
for i=1:d
    for j=1:l
        Xtr(i,j).Image = reshape(double(Xtr(i,j).Image)/255, 2576,1);
        Xte(i,j).Image = reshape(double(Xte(i,j).Image)/255, 2576,1);
    end
end

end

function [Xtr, Xte] = split_database
    %load size of FaceData database

    faces = matfile('FaceData2.mat');
    [m, n] = size(faces, 'FaceData');
    tmp = faces.FaceData(1,1);
    tmp = size(tmp.Image);
    facesize = tmp(1) * tmp(2);

    % split faces into half; first half is Xtr (training set) and second half is
    % Xte (testing set)
    Xtr = zeros(facesize,m*n/2);
    Xte = zeros(facesize,m*n/2);

    % initialize Id (identity labels for Xte)
    Id = [1:1:size(Xte,2)];

    % vectorise images in Xtr and Xte
    for i=1:m
        for j=1:n
            f = faces.FaceData(i,j);
            vec = reshape(double(f.Image)/255, facesize, 1);
            for k=1:size(vec)
                if i<=m/2
                    Xtr(k,(i-1)*n+j) = vec(k);
                else 
                    Xte(k,(i-21)*n+j) = vec(k);
                end
            end
        end
    end

    % learn from train data
    m_tr = mean(Xtr,2);
    zm_tr = Xtr - m_tr;
    cov_matrix = cov(zm_tr.');
    [eig_vec,~] = eig(cov_matrix);
    
    % store identities
    identities = zeros(1, 200);
    for i=1:size(identities,2)
        identities(i) = 1 + floor((i-1) / 10);
    end 
    fprintf(fopen("identitiesmatrix.txt", 'w'), "%d ", identities); 
    
    % Display the mean face and first 10 eigenfaces
    num_faces = 10;
    mean_face = reshape(m_tr,56,46);
    subplot(num_faces/5 + 1,num_faces/2,1);
    imagesc(mean_face);
    title("Mean face");
    colormap(gray);   
    for i=1:num_faces/5
        for j=1:num_faces/2
            eig_face = reshape(eig_vec(:,5*(i - 1) + j),56,46);
            subplot(num_faces/5 + 1,num_faces/2,5 + 5*(i - 1) + j);
            imagesc(mean_face + eig_face);
            title("Eigenface " + (5*(i - 1) + j));
            colormap(gray);
        end
    end
    
    % calculate test scores based on several different amounts of principal components
    num_imgs = 10:10:100;
    for m = num_imgs
        eig_vecs_picked = eig_vec(1:m,:);
            
        % calculate test scores
        scores = zeros(m, size(Xte,2));
        for i=1:size(Xte,2)
            vec = eig_vecs_picked * (Xte(:,i) - m_tr);
            for j=1:m
                scores(j,i) = vec(j);
            end
        end
        score_matrix = squareform(pdist(scores.')*-1000);

        % Save score matrix and identities
        save("scorematrix_" + m + ".txt", 'score_matrix', '-ascii')
    end


end

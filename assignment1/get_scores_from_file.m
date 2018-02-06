function [S, Id] = get_scores_from_file(scorematrix_file, id_file) 
%
% Loads score matrix and plots info.
%
S = load(scorematrix_file, '-ascii');
Id = load(id_file, '-ascii');
[np, nt] = size(S);
nId = max(Id);
%Entries = (1:np);

fprintf(' Size of score matrix: %u x %u\n',np,nt);
fprintf(' Number of identities: %u\n', nId);

fprintf(' Elements in id.txt: %u\n', size(Id, 2));

%figure(1); plot(Entries, Id); 
%xlabel('Entry'); ylabel('Identity'); title('Mapping entry number to identity');

%figure(2); imagesc(S); colormap('gray');
%ylabel('test'); xlabel('reference'); title('Score matrix');

%% backup before running, aviod irreversible damage
path_src='path\to\the\src\code\root';
path_dest='path\to\the\dest\code\root';
path_ignore={'\backup';'\.git\'};




%%
[filepath_dest, iDepth] = file_find( path_dest, '*.m',2,false);
if ~isempty(path_ignore)
    filepath_dest(contains(filepath_dest,append(path_dest,path_ignore)))=[];
end

for i=1:length(filepath_dest)
    [status{i},message{i},messageId{i}]=update_file(filepath_dest{i},path_src,path_ignore);
end

function [status,message,messageId]=update_file(filepath_dest,path_src,path_ignore)

% copy file from file in path_src to filepath_dest
[pathstr, name, ext] = fileparts(filepath_dest);
filename=[name, ext];
[new, iDepth] = file_find(path_src, filename, [],false);
if ~isempty(path_ignore)
    new(contains(new,append(path_src,path_ignore)))=[];
end
if length(new)>1
    error(['found several file: ',filename])
elseif length(new)<1
    warning(['not found file: ',filename])
    status=[];
    message=[];
    messageId=[];
    return;
else
    [status,message,messageId] = copyfile(new{1},filepath_dest,'f');
end
end

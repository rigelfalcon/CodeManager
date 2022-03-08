function [status,message,messageId]=copy_file(old,new)
 %%
 %     Author: Ying Wang, Min Li
 %     Create Time: 2021
 %     Copyright(c): 2020-2022 Ying Wang, yingwangrigel@gmail.com, Min Li, minli.231314@gmail.com
 %     Joint China-Cuba LAB, UESTC
 
num_file=length(old);
assert(num_file==length(new)||isfolder(new));
status=cell(num_file,1);
message=cell(num_file,1);
messageId=cell(num_file,1);

if ~isfolder(new)
    for i=1:num_file
        test_folder(new{i});
        [status{i},message{i},messageId{i}] = copyfile(old{i},new{i},'f');
    end
else
    test_folder(new);
    for i=1:num_file
        [status{i},message{i},messageId{i}] = copyfile(old{i},new,'f');
    end
end
end
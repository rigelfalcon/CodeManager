function [status,message,messageId]=copy_dependency(destPath,srcFile,srcRoot);
 %%
 %     Author: Ying Wang, Min Li
 %     Create Time: 2021
 %     Copyright(c): 2020-2022 Ying Wang, yingwangrigel@gmail.com, Min Li, minli.231314@gmail.com
 %     Joint China-Cuba LAB, UESTC
 
if nargin<3 || isempty(srcRoot)
    srcRoot=[];
end


fList=find_dependency(srcFile);
fList=[srcFile;fList];



if ~isempty(srcRoot)
    destFiles=replace(fList,srcRoot,[destPath,filesep]);
    [status,message,messageId] = copy_file(fList,destFiles);
    
else
    [status,message,messageId]= copy_file(fList,destPath);
end
status=cell2mat(status);
if ~prod(status)
    warning(append('failed copy file: ', fList(~status)));
end
end

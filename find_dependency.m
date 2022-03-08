function fList=find_dependency(srcFile)
 %%
 %     Author: Ying Wang, Min Li
 %     Create Time: 2021
 %     Copyright(c): 2020-2022 Ying Wang, yingwangrigel@gmail.com, Min Li, minli.231314@gmail.com
 %     Joint China-Cuba LAB, UESTC
 

[fList] = matlab.codetools.requiredFilesAndProducts(srcFile).';


end

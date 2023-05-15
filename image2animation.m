% This program creates a movie/slideshow from a set of SWIR reflectance/transillumination, and save it as an animated GIF file.
% Written by Moshe Lindner , Bar-Ilan University, Israel.
% Modified by Yihua Zhu
% 2022

clear all
[file_name file_path]=uigetfile({'*.jpeg;*.jpg;*.bmp;*.tif;*.tiff;*.png;*.gif','Image Files (JPEG, BMP, TIFF, PNG and GIF)'},'Select Images','multiselect','on');
file_name=sort(file_name);
parts = strsplit(file_path, filesep);
%The following three lines need modification when transfer to another
%computer
name1 = parts{1,5};
name2 = parts{1,6};
name3 = parts{1,7};
file_name2 = strcat(name1,'_',name2,'_',name3,'.gif');
filepath0 = uigetdir('D:\Clinical study data\Premolar study data\SWIR_GIF');
file_path2 = strcat(filepath0, '\');
loops = 65535;
delay=0.1;
delay1 = delay;
delay2 = delay;

h = waitbar(0,['0% done'],'name','Progress') ;
for i=1:length(file_name)
    if strcmpi('gif',file_name{i}(end-2:end))
        [M  c_map]=imread([file_path,file_name{i}]);
    else
        a=imread([file_path,file_name{i}]);
        [M  c_map]= gray2ind(a,256);
    end
    if i==1
        imwrite(M,c_map,[file_path2,file_name2],'gif','LoopCount',loops,'DelayTime',delay1)
    elseif i==length(file_name)
        imwrite(M,c_map,[file_path2,file_name2],'gif','WriteMode','append','DelayTime',delay2)
    else
        imwrite(M,c_map,[file_path2,file_name2],'gif','WriteMode','append','DelayTime',delay)
    end
    waitbar(i/length(file_name),h,[num2str(round(100*i/length(file_name))),'% done']) ;
end
close(h);
msgbox('Finished Successfully!')
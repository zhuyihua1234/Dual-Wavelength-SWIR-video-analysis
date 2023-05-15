%This code converts the multiwavelength probe images into Windows
%compatible
%This code automatically detects duplicate transillumination/reflectance
%frames and get rid of them
%Written by Yihua Zhu


%Creates structure of dat images inside working directory
  d=dir('*.tiff');
  for i=1:length(d)
      %Reads in .tiff file
      fname = d(i).name;
      raw_img = imread(fname);
      img = raw_img - 32768;
      img16 = img*16;
      I = img16;
      %Converts to TIF and gives it the .tif extension
      fname = [fname(1:end-4),'.tif'];
      imwrite(I,fname,'tif');

  end
%Delete Tiff Files and keep Tif files
  clear all;
   d=dir('*.tiff');
  for i=1:length(d)
      %Reads in .tiff file
      fname = d(i).name;
      delete(fname);

  end

%Delete duplicate consecutive reflectance/transillumination frames
%Repeat 5 times to delete all duplicate frames
clear all;
  d=dir('*.tif');
 for i=1:length(d)
    try

        fname1 = d(i).name;
        raw_img1 = imread(fname1);
        img_crop1 = imcrop(raw_img1, [0 480 640 15]);
        img1_average = mean2(img_crop1);
        img1_round = round(img1_average/10000);

        fname2 = d(i+1).name;
        raw_img2 = imread(fname2);
        img_crop2 = imcrop(raw_img2, [0 480 640 15]);
        img2_average = mean2(img_crop2);
        img2_round = round(img2_average/10000);

    if img1_round == img2_round
        delete (fname1);
    end
    
    catch
        fprintf('Inconsistent data in iteration %s, skipped.\n', i);
    end


 end

 clear all;
  d=dir('*.tif');
 for i=1:length(d)
    try

        fname1 = d(i).name;
        raw_img1 = imread(fname1);
        img_crop1 = imcrop(raw_img1, [0 480 640 15]);
        img1_average = mean2(img_crop1);
        img1_round = round(img1_average/10000);

        fname2 = d(i+1).name;
        raw_img2 = imread(fname2);
        img_crop2 = imcrop(raw_img2, [0 480 640 15]);
        img2_average = mean2(img_crop2);
        img2_round = round(img2_average/10000);

    if img1_round == img2_round
        delete (fname1);
    end
    
    catch
        fprintf('Inconsistent data in iteration %s, skipped.\n', i);
    end


 end
 
 clear all;
  d=dir('*.tif');
 for i=1:length(d)
    try

        fname1 = d(i).name;
        raw_img1 = imread(fname1);
        img_crop1 = imcrop(raw_img1, [0 480 640 15]);
        img1_average = mean2(img_crop1);
        img1_round = round(img1_average/10000);

        fname2 = d(i+1).name;
        raw_img2 = imread(fname2);
        img_crop2 = imcrop(raw_img2, [0 480 640 15]);
        img2_average = mean2(img_crop2);
        img2_round = round(img2_average/10000);

    if img1_round == img2_round
        delete (fname1);
    end
    
    catch
        fprintf('Inconsistent data in iteration %s, skipped.\n', i);
    end


 end
 
 clear all;
  d=dir('*.tif');
 for i=1:length(d)
    try

        fname1 = d(i).name;
        raw_img1 = imread(fname1);
        img_crop1 = imcrop(raw_img1, [0 480 640 15]);
        img1_average = mean2(img_crop1);
        img1_round = round(img1_average/10000);

        fname2 = d(i+1).name;
        raw_img2 = imread(fname2);
        img_crop2 = imcrop(raw_img2, [0 480 640 15]);
        img2_average = mean2(img_crop2);
        img2_round = round(img2_average/10000);

    if img1_round == img2_round
        delete (fname1);
    end
    
    catch
        fprintf('Inconsistent data in iteration %s, skipped.\n', i);
    end


 end
 
 clear all;
  d=dir('*.tif');
 for i=1:length(d)
    try

        fname1 = d(i).name;
        raw_img1 = imread(fname1);
        img_crop1 = imcrop(raw_img1, [0 480 640 15]);
        img1_average = mean2(img_crop1);
        img1_round = round(img1_average/10000);

        fname2 = d(i+1).name;
        raw_img2 = imread(fname2);
        img_crop2 = imcrop(raw_img2, [0 480 640 15]);
        img2_average = mean2(img_crop2);
        img2_round = round(img2_average/10000);

    if img1_round == img2_round
        delete (fname1);
    end
    
    catch
        fprintf('Inconsistent data in iteration %s, skipped.\n', i);
    end


 end
 
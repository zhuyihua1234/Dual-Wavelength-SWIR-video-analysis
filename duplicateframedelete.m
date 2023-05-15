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
        fprintf('Last image frame skipped.\n', i);
    end


 end

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
        fprintf('Last image frame skipped.\n', i);
    end


 end

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
        fprintf('Last image frame skipped.\n', i);
    end


 end

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
        fprintf('Last image frame skipped.\n', i);
    end


 end

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
        fprintf('Last image frame skipped.\n', i);
    end


 end
 
 clear all
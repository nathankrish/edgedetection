function resultsglobal = resultsglobal(im)
[imfinal1] = binarizeglobal(im,0);
[imfinal2] = binarizeglobal(im,0.03);
[imfinal3] = binarizeglobal(im,0.05);
resultsglobal.imfinal1 = imfinal1;
resultsglobal.imfinal2 = imfinal2;
resultsglobal.imfinal3 = imfinal3;
resultsglobal.canny = canny(im);
%%resultsglobal.edgemapcanny2 = canny(im2uint8(imfinal2));
end
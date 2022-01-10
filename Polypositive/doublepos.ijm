// Name: triplepos.ijm
// Type: ImageJ Macro File
// Author: Jacob Teske
// Created: 20180920
// Modified: 20180921
// Comments: 


waitForUser("Select the SMA image");
pw = getWidth();
ph = getHeight();
imna = getInfo("image.filename");
dir = getInfo("image.directory");
savedir = dir+"/airways/";
File.makeDirectory(savedir);
setTool("freehand");
waitForUser("Roughly circle the airway");
roiManager("reset");
roiManager("add");
roiManager("select",0);
roiManager("rename","Airway");
setBackgroundColor(0, 0, 0);
run("Clear Outside");
run("8-bit");
run("Enhance Contrast", "saturated=0.35");
wait(500);
run("Apply LUT");
setThreshold(120, 255);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Close-");
run("Open");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Create Selection");
roiManager("add");
roiManager("select",1);
roiManager("rename","SMA");
close();
run("8-bit");
roiManager("select",0);
run("Clear Outside");
run("Select None");
run("Enhance Contrast", "saturated=0.35");
wait(500);
run("Apply LUT");
setThreshold(170, 255);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Close-");
run("Open");
run("Dilate");
run("Dilate");
run("Dilate");
run("Create Selection");
roiManager("add");
roiManager("select",2);
roiManager("rename","BMAL1");
close();
run("8-bit");
roiManager("select",0);
run("Clear Outside");
run("Select None");
// run("Enhance Contrast", "saturated=0.35");
wait(500);
// run("Apply LUT");
setThreshold(140, 255);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Close-");
run("Open");
run("Dilate");
run("Dilate");
run("Create Selection");
roiManager("add");
roiManager("select",3);
roiManager("rename","DAPI");
close();
quadpos = imna+'_quadpos'
smacellcount = imna+'_cellcount'
newImage(quadpos, "8-bit white", pw, ph, 1);
roiManager("select",newArray(1,2,3));
roiManager("and");
roiManager("add");
roiManager("select",4);
roiManager("rename","Triple Positive");
roiManager("fill");
run("Make Binary");
run("Open");
run("Watershed");
// run("Analyze Particles...", "size=0-Infinity show=Masks summarize");
saveAs("Tiff", savedir+quadpos);
close();

newImage(smacellcount, "8-bit white", pw, ph, 1);
roiManager("select",newArray(1,3));
roiManager("and");
roiManager("add");
roiManager("select",5);
roiManager("rename","Cell Count");
roiManager("fill");
run("Make Binary");
run("Open");
run("Watershed");
// run("Analyze Particles...", "size=0-Infinity show=Masks summarize");
saveAs("Tiff", savedir+smacellcount);
close();
// Name: SMA_Analysis.ijm
// Type: ImageJ Macro File
// Author: Jacob Teske
// Created: 20180824
// Modified: 20180828
// Comments: 

close("*C=0*");
while (nImages() != 0) {
setTool("freehand");
waitForUser("Circle the area of interest, then click OK.");
run("8-bit");
run("Clear Outside");
run("Select None");
setThreshold(50, 255);
run("Threshold...");
waitForUser("Adjust threshold, then click OK.");
run("Convert to Mask");
selectWindow("Threshold");
run("Close");
run("Analyze Particles...", "clear summarize");
close();
}
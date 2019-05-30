// Name: SMA_Analysis.ijm
// Type: ImageJ Macro File
// Author: Jacob Teske
// Created: 20180824
// Modified: 20180828
// Comments: 

close("*C=0*");
while (nImages() != 0) {
run("Duplicate...", " ");
snapshot();
setTool("freehand");
setMinAndMax(56, 934);
waitForUser("Circle the area of interest, then click OK.");
reset;
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
Dialog.create("Same image?")
Dialog.addCheckbox("Continue using the same image?",0)
Dialog.show()
same = Dialog.getCheckbox();
if (same == 0) {
	close("*C=1-1*");
	close();
} else if (same == 1){
	close("*C=1-1*");
}
}
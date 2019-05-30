// Name: Airway_Area.ijm
// Type: ImageJ Macro File
// Author: Jacob Teske
// Created: 20180827
// Modified: 20180828
// Comments: 

close("*C=0*");
run("Set Measurements...", "area perimeter display redirect=None decimal=3");
while (nImages() != 0) {
waitForUser("Select the image, then click OK");
setMinAndMax(56, 934);
setTool("freehand");
waitForUser("Circle outside of airway, then click OK");
run("Measure");
run("Select None");
}

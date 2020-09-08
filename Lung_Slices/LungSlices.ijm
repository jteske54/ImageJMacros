stackImg = File.openDialog("Choose an image in the stack");
tol = 25;
run("Image Sequence...", "open=stackImg sort");
waitForUser("Find the X and Y values of the airway's most constricted state");
xval = getNumber("Enter the X value of the lumen in the airway's most contracted state",0);
yval = getNumber("Enter the Y value of the lumen in the airway's most contracted state",0);
run("Brightness/Contrast...");
waitForUser("Adjust the brightness and contrast, click OK");
run("Apply LUT", "stack");
run("Find Edges", "stack");
run("Select None");
doWand(xval, yval, tol, "Legacy");
run("Wand Tool...");
tol = getNumber("Change the tolerance if necessary. Enter the new value here.", 25)
run("Select None");
setSlice(1);
sliceN = nSlices()
while (getSliceNumber() != sliceN) {
doWand(xval, yval, tol, "Legacy");
run("Measure");
run("Select None");
run("Next Slice [>]");
}
workingDir = getInfo("image.directory");
saveDir = File.getParent(workingDir);
saveName = getInfo("slice.label") + ".csv";
close();
saveAs("Results", saveDir + "/" + saveName);
Plot.create("Plot of Results", "x", "Area");
Plot.add("Circle", Table.getColumn("Area", "Results"));
Plot.setStyle(0, "blue,#a0a0ff,1.0,Circle");
run("Clear Results");
while (nImages() > 0) {
saveDir = getInfo("image.directory");
DAPIname = getInfo("image.filename");
width = getWidth();
height = getHeight();
information = split(DAPIname, "_");
well = information[0];

run("Make Binary");
run("Convert to Mask");
setForegroundColor(0, 0, 0);
setBackgroundColor(255, 255, 255);
waitForUser("Flood fill any erroneous areas");
run("Erode");
run("Erode");
run("Erode");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Watershed");
saveAs("Tiff", saveDir+well+"_cell-mask");
run("Create Selection");
roiManager("Add");
roiManager("Split");
roiManager("select", 0);
roiManager("delete");
close();
run("Canvas Size...", "width="+width+" height="+height+" position=Top-Left");
n = 0;
cellcount = roiManager("count");
cellcount = cellcount - 1;
run("Set Measurements...", "area mean modal min perimeter redirect=None decimal=3");
while (n < cellcount) {
	roiManager("select", n);
	run("Measure");
	n++;
}
saveAs("Results", saveDir+well+".csv");
run("Clear Results");
close();
roiManager("reset");
}
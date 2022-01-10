loadDir = getDirectory("Choose a Directory");
fileList = getFileList(loadDir);
numberFiles = lengthOf(fileList);
print("Processing " + numberFiles + " files...");
for (i = 0; i < lengthOf(fileList); i++){
	if (endsWith(fileList[i],".nd2")) {
		completion = i / numberFiles * 100;
		print(completion + "%" + "     " + i + " / " + numberFiles);
		name = fileList[i];
		file = loadDir + name;
		run("Bio-Formats Importer", "open=[file] autoscale color_mode=Default rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT");
		setOption("ScaleConversions", true);
		selectWindow(name+" - C=1");
		run("8-bit");
		run("Grays");
		run("Apply LUT");
		setTool("freehand");
		waitForUser("Roughly circle the airway");
		setBackgroundColor(0, 0, 0);
		run("Clear Outside");
		setThreshold(88, 255);
		run("Threshold...");
		waitForUser("Adjust threshold");
		run("Convert to Mask");
		run("Close");
		run("Create Selection");
		roiManager("Add");
		close();
		setOption("ScaleConversions", true);
		run("8-bit");
		run("Apply LUT");
		//run("Brightness/Contrast...");
		//waitForUser("Adjust Brightness");
		//run("Apply LUT");
		//run("Close");
		roiManager("Select", 0);
		run("Clear Outside");
		run("Set Measurements...", "area mean standard modal min perimeter integrated median display redirect=None decimal=3");
		run("Measure");
		roiManager("Delete");
		close();
		close();


}
}
saveAs("Results", loadDir+"Results.csv");
selectWindow("Results");
run("Close");
selectWindow("ROI Manager");
run("Close");
print("Done")
loadDir = getDirectory("Choose a Directory");
fileList = getFileList(loadDir);
numberFiles = lengthOf(fileList);
File.open(loadDir + "results.txt");
File.append("SampleName,OxygenPercentage,Treatment,Magnification,ImageNumber,CellCount,TriplePositiveCount", loadDir + "results.txt")
setForegroundColor(0, 0, 0);
setBackgroundColor(255, 255, 255);
print("Processing " + numberFiles + " files...");
for (i = 0; i < lengthOf(fileList); i++){
	if (endsWith(fileList[i],".nd2")) {
		completion = i / numberFiles * 100;
		print(completion + "%" + "     " + i + " / " + numberFiles);
		name = fileList[i];
		file = loadDir + name;
		run("Bio-Formats Importer", "open=[file] autoscale color_mode=Composite rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT");
		desc = replace(name,".nd2","");
		attr = split(desc,"_");
		roiManager("reset");
		//Selects DAPI channel and isolates cells
		name = getInfo("image.filename");
		selectImage(name + " - C=0"); //Selects DAPI channel.
		close();
		selectImage(name + " - C=2");
		run("Duplicate...", " ");
		run("8-bit");
		setThreshold(20, 255); //Make the first number smaller to be more sensitive on cell count (default: 20, 255)
		//^Note: it is possible that in increasing the sensitivity, the cell count will decrease
		setOption("BlackBackground", false);
		run("Convert to Mask");
		run("Make Binary");
		run("Close-");
		run("Fill Holes");
		run("Erode");
		run("Erode");
		run("Open");
		run("Dilate");
		run("Dilate");
		run("Dilate");
		run("Close-");
		run("Analyze Particles...", "size=60-Infinity show=Masks");
		selectImage(name + " - C=2-1");
		close();
		selectImage("Mask of " + name + " - C=2-1");
		rename(name + " - C=0");
		run("Create Selection");
		roiManager("Add");
		roiManager("select", 0);
		roiManager("Split");
		roiManager("Select", 0);
		roiManager("Delete");
		cellcount = roiManager("count"); //Counts the number of cells present on the DAPI image.
		close();

		//Counts the number of positive FITC cells
		selectImage(name + " - C=2"); //Selects FITC channel
		run("8-bit");
		//roiManager("multi-measure append");
		n = 0;
		rois = roiManager("count");
		while (n < rois) {
			roiManager("select", n);
			run("Measure");
			if (getResult("Max") - getResult("Min") < 60) {//Make this number smaller to be more sensitive on FITC positivity (default: 60)
				roiManager("delete");
				rois = roiManager("count");
			} else {
				n++;
			}
			run("Clear Results");
		}
		close();

		//Counts the number of RFP positive cells that were also positive in the FITC channel.
		selectImage(name + " - C=1"); //Selects RFP channel
		run("8-bit");
		n = 0;
		rois = roiManager("count");
		while (n < rois) {
			roiManager("select", n);
			run("Measure");
			if (getResult("Max") - getResult("Min") < 60) { //Make this number smaller to be more sensitive on RFP positivity (default: 60)
				roiManager("delete");
				rois = roiManager("count");
			} else {
				n++;
			}
			run("Clear Results");
		}
		close();
		triplepos = roiManager("count");
		File.append(attr[0] + "," + attr[1] + "," + attr[2] + "," + attr[3] + "," + attr[4] + "," + cellcount + "," + triplepos, loadDir + "results.txt");


	}


}
print("Done")
print("Results exported to: " + loadDir + "results.txt")

// MitroTracker ImageJ Processing Macro
// Logan Manlove
// 11-23-2015
//
// Script to run preprocessing for mitochondria fission/ fusion analysis.
// Allows user to select directory containing single channel tiff files
// and creates a 'imagej' save folder within that folder. User outlines cell
// and then adjusts brightness and contrast. Asks if user wants to redo or
// select another cell in the image.



// Get user input for folder where tiffs are
// stored and creates a path to store saved files.

loadDir = getDirectory("Choose a Directory");
saveDir = loadDir + "imagej\\";

// retrieves a list of the files in the folder.

fileList = getFileList(loadDir);

// Makes a folder at the save file path

File.makeDirectory(saveDir);

setBackgroundColor(0, 0, 0);
j = 1;
defrbn = 12;
for (i = 0; i < lengthOf(fileList); i++) {
	if (endsWith(fileList[i],".tif")){
 
		file = loadDir + fileList[i];
		open(file);
		if (getBoolean("Does background need to be subtracted?")){
			rbn = getNumber("Enter a number between 5 and 60 (Lower=more background reduction)", defrbn);
			defrbn = rbn;
			run("Subtract Background...", "rolling="+rbn);
			cbr = getBoolean("Change background reduction settings?");
			while (cbr == 1){
				run("Undo");
				rbn = getNumber("Enter a number between 5 and 60 (Lower=more background reduction)", defrbn);
				defrbn = rbn;
				run("Subtract Background...", "rolling="+rbn);
				cbr = getBoolean("Change background reduction settings?");
			}
		}
		setTool("freehand");
		waitForUser("Outline Cell then press 'OK'.");
		run("Clear Outside");
		run("Select None");
		if (getBoolean("Is the nucleus too bright?")){
			setTool("freehand");
			waitForUser("Circle the bright area, then press 'OK'.");
			run("Clear", "slice");
			run("Select None");
		}
		run("Brightness/Contrast...");
		selectWindow("B&C");
		waitForUser("Adjust Brightness and Contrast, then press 'Ok'");
		run("Apply LUT");
		waitForUser("If needed, adjust the brightness again, then press 'Ok'");
		run("Apply LUT");
		selectWindow("B&C");
		run("Close");
		selectWindow(fileList[i]);
		run("RGB Color");
		run("8-bit");
		saveAs("tiff", saveDir + j);
		check = 1;
		if (getBoolean("Redo Image?")){
			check = 2;
			i --;
			j --;
		}
		if (check == 1){
			if (getBoolean("Select another cell in Image?")){
				i--;
			}
		}
		j++;
		close();
		
	}
}

// Name: Batch_Save_ND2_Brightfield.ijm
// Type: ImageJ Macro File
// Author: Jacob Teske
// Created: 2019-05-14
// Modified: 2019-05-30
// Description: Converts Nikon's proprietary .nd2 file format into a .tif file. Also fixes the problem of the red and blue channels being switched when first opening.

loadDir = getDirectory("Folder with files to convert");
saveDir = getDirectory("Folder to save the files into")
fileList = getFileList(loadDir);
numberFiles = lengthOf(fileList);
print("Processing " + numberFiles + " files...");
print("0%" + "     " + 0 + " / " + numberFiles);
for (i = 0; i < lengthOf(fileList); i++){
	if (endsWith(fileList[i],".nd2")) {
		name = fileList[i];
		file = loadDir + name;
		run("Bio-Formats Importer", "open=[file] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
		desc = replace(name,".nd2","");
		origName = name;
		name = desc;
		run("Split Channels");
		selectWindow("C1-"+origName);
		rename("C3");
		selectWindow("C2-"+origName);
		rename("C2");
		selectWindow("C3-"+origName);
		rename("C1");
		run("Merge Channels...", "c1=[C1] c2=[C2] c3=[C3] create");
		run("RGB Color");
		saveAs("Tiff", saveDir+name);
		close();
		close();
}
	iplusone = i + 1;
	completion = iplusone / numberFiles * 100;
	print(completion + "%" + "     " + iplusone + " / " + numberFiles);
}
print("Done")

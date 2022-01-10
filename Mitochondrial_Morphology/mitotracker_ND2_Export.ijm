// Name: Batch_Save_ND2_OneChannel.ijm
// Type: ImageJ Macro File
// Author: Jacob Teske
// Created: 2019-05-14
// Modified: 2019-05-30
// Description: Converts Nikon's proprietary .nd2 files format into both a stacked .tif file and a merged .tif file.

loadDir = getDirectory("Folder with files to convert");
saveDir = getDirectory("Folder to save the files into");
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
		name = desc;
		run("16-bit");
		saveAs("Tiff", saveDir+name);
		close();
}
	iplusone = i + 1;
	completion = iplusone / numberFiles * 100;
	print(completion + "%" + "     " + iplusone + " / " + numberFiles);
}
print("Done")

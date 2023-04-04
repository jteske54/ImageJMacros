loadDir = getDirectory("Folder with files to convert");
saveDir = getDirectory("Folder to save the files into");
fileList = getFileList(loadDir);
numberFiles = lengthOf(fileList);
print("Processing " + numberFiles + " files...");
print("0%" + "     " + 0 + " / " + numberFiles);
for (i = 0; i < lengthOf(fileList); i++){
	if (endsWith(fileList[i],".tiff")) {
		name = fileList[i];
		file = loadDir + name;
		open(file);
		run("Make Substack...", "slices=1,29");
		run("Stack to Images");
		run("Merge Channels...", "c2=Substack-0002 c3=Substack-0001 create ignore");
		run("RGB Color");
		saveAs("Tiff", saveDir+name);
		close();
		close();
		close();
}
	iplusone = i + 1;
	completion = iplusone / numberFiles * 100;
	print(completion + "%" + "     " + iplusone + " / " + numberFiles);
}
print("Done")

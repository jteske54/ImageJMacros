while (nImages() != 0) {
name = getTitle();
dir = getDirectory("image");
path = dir+name+"_Composite";
run("Make Composite");
run("RGB Color");
saveAs("Tiff", path);
run("Close");
run("Split Channels");
run("RGB Color");
path = dir+name+"_Cy5";
saveAs("Tiff", path);
run("Close");
run("RGB Color");
path = dir+name+"_DAPI";
saveAs("Tiff", path);
run("Close");
}
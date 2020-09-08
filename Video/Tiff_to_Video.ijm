loadDir = getDirectory("Folder with sequential TIF files");
fileList = getFileList(loadDir);
numberFiles = lengthOf(fileList);
filename = "/stack";

run("Image Sequence...", "open=loadDir number=numberFiles starting=1 increment=1 scale=100 sort");
run("AVI... ", "compression=JPEG frame=20");
close();
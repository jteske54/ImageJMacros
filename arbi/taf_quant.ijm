run("Split Channels");
//run("Z Project...", "projection=[Max Intensity]");
run("8-bit");
run("Find Edges","stack");
setThreshold(100, 255);
run("Convert to Mask","method=Default background=Default");
run("Fill Holes", "stack");
run("Z Project...", "projection=[Max Intensity]");
run("Dilate");
run("Dilate");
run("Watershed");
run("Analyze Particles...", "size=4-80 pixel circularity=0.60-1.00 exclude add");
n = roiManager("count");
roiManager("select", Array.getSequence(n));
roiManager("Combine");
roiManager("Add");
roiManager("Delete");
roiManager("Deselect");
close();
close();
run("8-bit");
run("Find Edges","stack");
setThreshold(85, 255);
run("Convert to Mask","method=Default background=Default");
run("Fill Holes", "stack");
run("Z Project...", "projection=[Max Intensity]");
run("Dilate");
run("Dilate");
run("Watershed");
run("Analyze Particles...", "size=4-80 pixel circularity=0.60-1.00 exclude add");
n = roiManager("count");
roiManager("select", Array.deleteIndex(Array.getSequence(n),0));
roiManager("Combine");
roiManager("Add");
roiManager("Delete");
roiManager("Deselect");
close();
close();
roiManager("select",newArray(0,1));
roiManager("and");
roiManager("Add");
roiManager("Delete");

//Need to do DAPI portion yet.

roiManager("Interpolate ROIs");
roiManager("select", newArray(0,2));
roiManager("Delete");
roiManager("Split");
roiManager("Delete");
poscells = roiManager("count") - 1;
print(poscells)
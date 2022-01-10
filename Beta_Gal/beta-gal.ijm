while (nImages != 0) {
run("Enhance Contrast...", "saturated=.3");
run("Split Channels");
close();
close();
run("Find Edges");
run("Enhance Contrast...", "saturated=0.3");
setThreshold(77, 255);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Fill Holes");
run("Open");
run("Analyze Particles...", "size=600-Infinity pixel exclude summarize");
close();
}
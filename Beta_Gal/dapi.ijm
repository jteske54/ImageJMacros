while (nImages != 0) {
run("8-bit");
run("Enhance Contrast...", "saturated=0.3");
setThreshold(30, 255);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Close-");
run("Open");
run("Watershed");
run("Analyze Particles...", "size=0-Infinity pixel exclude summarize");
close();
}
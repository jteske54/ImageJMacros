selectWindow("RR_21_1035_region_001.ome.tiff");
run("Stack to Images");
run("Merge Channels...", "c2=Substack-0002 c3=Substack-0001 create ignore");
run("RGB Color");
saveAs("Tiff", "C:/Users/teske/Desktop/Composite (RGB).tif");

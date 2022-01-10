// Analyze_Alveoli
// Logan Manlove
// 3-17-2014
//
// ImageJ macro built to help analyze airway alveoli count and average size

macro "Analyze_Alveoli [f1]" {
	run("8-bit");
	run("Threshold...");
	selectWindow("Threshold");

	waitForUser("Adjust Threshold, then press 'Ok'");

	selectWindow("Threshold");
	run("Close");
	run("Erode");
	run("Erode");	

	waitForUser("Remove any noise, then press 'Ok'");

	run("Analyze Particles...", "size=250-30000 pixel circularity=0.05-1.00 show=Masks exclude summarize");
}

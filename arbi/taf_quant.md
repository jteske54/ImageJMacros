# TAF Quantification

filename: *taf_quant.ijm*

author: *Jacob Teske*

date: *2022-01-07*

language: *ImageJ Macro (ijm)*
___
- [TAF Quantification](#taf-quantification)
  - [Description](#description)
  - [Macro Installation](#macro-installation)
  - [Usage](#usage)
___
## Description
Quantifies TAF staining colocalized with another protein and DAPI.

**Requirements**
Alterations to the code can be made to accomodate different images/types, but in this version, the following must be true:
- There must be exactly 3 channels
- All 3 channels must be contained in the same image file
- All 3 channels must be z-stacks
- DAPI must be on the first channel

## Macro Installation
1. If you don't already have it, download the most recent version of [Fiji/ImageJ](https://imagej.net/software/fiji/downloads).
   1. Unzip the downloaded file
2. Within the ImageJ folder, open the *macros* folder
3. Copy the *taf_quant.ijm* file included with these instructions into the *macros* folder

## Usage
1. Click and drag the image into ImageJ to open it.
   a. If the image is an .nd2 file or something similar,
# Dual-Wavelength-SWIR-video-analysis
Image batch/video processing for multiwavelength SWIR imaging

This repository handles post-processing of image sequences/frames aquired by LabView for dual-SWIR imaging. 


"mass_conversion.m": Convert LabView ".tiff" image sequences to Windows/Mac friendly 16-bit ".tif" images, and delete consecutive frames that duplicate the same wavelength during image acquisition.

"image2animation.m": Convert ".tif" image frames into a ".gif" for video display.

"duplicateframedelete.m": Automatically detect consecutive frames that were acquired into the same wavelength.

"SWIR_image_contrast_calculation": Analysis of single frame image.

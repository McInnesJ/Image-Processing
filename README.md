# Image-Processing
Software package capable of performing various affine transformations, as well as low pass filtering and MSE error calculation. 

READ  ME

Program control is the top level script, and contains function calls to all of the functions the user may wish to utilise, though most are commented out.
It is split into three blocks

	1. Image input/generation. The image ’surrey.png’ has already been read 	into the program. The 	user may also wish to investigate a 	chequerboard pattern. In this instance the user should 	comment out (add a percent sign to the line 
	‘image = double(imread('surrey.png'))./255;’ such that it reads
	‘% image = double(imread('surrey.png'))./255;’ and uncomment 
	(delete the percent sign) from the line 
	‘%image = ipv_cheqpattern(500,500,25,25);’ 
	
	Note, both ’surrey.png’ and the chequerboard have been given the label
	‘image’ This is to ensure the user does not need to concern themselves 	with changing the arguments to the functions in section 2 or 3.


	2. Image Warps. Here are list of all the transformation functions in 	the program has been included. The user may comment and uncomment 	functions, ensuring that only the function s/he wishes to run is 	uncommented at any one time. The results of the transformation will be
	displayed (by the line ‘imgshow(test);’ Note that once again, each 	function has been given the same label, in this instance, ‘test’. This 	is to ensure the user need not change the input argument of imgshow(). 	It is however important to ensure only one function is uncommented at a 
	time. Failure to do so may cause errors. 

	For each of these functions the first input argument is the image which 	the user wishes to warp. Under the normal operation the user should not 	concern themselves with this input, and can change the image being 	warped as explained in section 1. 

		For lowPassFilter() the second input argument is window size. The 
		user can use this parameter to effect the ‘degree of blurring’ 		caused by the low pass filter.

		For functions beginning ‘rotate’ the second input argument is the 		angle of rotation. 

		For functions beginning ’scale’ the second input argument is the 		scale factor.

	The user is encouraged to change these second input parameters to see 	how they effect the warps being performed.


	3. MSE Calculations. Here the program carries out error calculations on 	the various warps. getMSE has 5 input arguments. 
		1. Image. The image to be transformed.
		2. mapDirection. i.e. select forwards (‘f’) or backwards (‘b’) 		mapping.
		3. transformations. i.e. select rotate (‘r’) or scale (’s’).
		4. interpolation. Select interpolation technique. i.e. nearest 		neighbour (’n’) or bilinear (’n’).
		5. Transformation value. i.e. enter the angle of rotation if 		investigating a rotation, or the scale factor if investigating 
		a scale. 

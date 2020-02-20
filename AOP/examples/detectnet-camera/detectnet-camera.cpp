/*
 * Copyright (c) 2019, ADLINK Technology. All rights reserved.
 *
 */

#include "../../utils/camera/indCamera.h"
#include "glDisplay.h"
#include "glTexture.h"
#include <GL/gl.h>
#include <GL/glut.h>

#include "detectNet.h"
#include "commandLine.h"

#include <signal.h>

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>
#include <unistd.h>

#include "cudaNormalize.h"
#include "cudaFont.h"
#include "imageNet.h"

#define DEFAULT_CAMERA -1

bool signal_recieved = false;

void sig_handler(int signo)
{
	if( signo == SIGINT )
	{
		printf("received SIGINT\n");
		signal_recieved = true;
	}
}

int usage()
{
	printf("usage: detectnet-camera [-h] [--network NETWORK] [--camera CAMERA]\n");
	printf("                        [--width WIDTH] [--height HEIGHT]\n\n");
	printf("Locate objects in a live camera stream using an object detection DNN.\n\n");
	printf("optional arguments:\n");
	printf("  --help           show this help message and exit\n");
	printf("  --camera CAMERA  index of the MIPI CSI camera to use (NULL for CSI camera 0),\n");
	printf("                   or for VL42 cameras the /dev/video node to use (/dev/video0).\n");
        printf("                   by default, MIPI CSI camera 0 will be used.\n");
	printf("  --width WIDTH    desired width of camera stream (default is 1280 pixels)\n");
	printf("  --height HEIGHT  desired height of camera stream (default is 720 pixels)\n\n");
	printf("%s\n", detectNet::Usage());

	return 0;
}

/*
void drawBitmapText(char *string,float x,float y,float z) 
{  
	char *c;
	glRasterPos3f(x, y,z);

	for (c=string; *c != (char)0; c++) 
	{
		glutBitmapCharacter(GLUT_BITMAP_HELVETICA_12, *c);
	}
}

*/
int main( int argc, char** argv )
{
	/*
	 * parse command line
	 */
	commandLine cmdLine(argc, argv);

	if( cmdLine.GetFlag("help") )
		return usage();


	/*
	 * attach signal handler
	 */
	if( signal(SIGINT, sig_handler) == SIG_ERR )
		printf("\ncan't catch SIGINT\n");


	/*
	 * create the camera device
	 */
/******
	gstCamera* camera = gstCamera::Create(cmdLine.GetInt("width", gstCamera::DefaultWidth),
								   cmdLine.GetInt("height", gstCamera::DefaultHeight),
								   cmdLine.GetString("camera"));
**********/
	//argv[1]: input_width, argv[2]: input_height
	indCamera* camera = indCamera::Create( cmdLine.GetInt("width", indCamera::DefaultWidth),
                                               cmdLine.GetInt("height", indCamera::DefaultHeight),
                                                                   DEFAULT_CAMERA);


	if( !camera )
	{
		printf("\ndetectnet-camera:  failed to initialize camera device\n");
		return 0;
	}
	
	printf("\ndetectnet-camera:  successfully initialized camera device\n");
	printf("    width:  %u\n", camera->GetWidth());
	printf("   height:  %u\n", camera->GetHeight());
	printf("    depth:  %u (bpp)\n\n", camera->GetPixelDepth());
	

	/*
	 * create detection network
	 */
	detectNet* net = detectNet::Create(argc, argv);
	
	if( !net )
	{
		printf("detectnet-camera:   failed to load detectNet model\n");
		return 0;
	}


	/*
	 * create openGL window
	 */
	glDisplay* display = glDisplay::Create();

	if( !display ) 
		printf("detectnet-camera:  failed to create openGL display\n");


	/*
	 * start streaming
	 */
	if( !camera->Open() )
	{
		printf("detectnet-camera:  failed to open camera for streaming\n");
		return 0;
	}
	
	printf("detectnet-camera:  camera open for streaming\n");
	
	
	/*
	 * processing loop
	 */
	float confidence = 0.0f;
	
	while( !signal_recieved )
	{
		// capture RGBA image
		void* imgCPU  = NULL;
                void* imgCUDA = NULL;
		// convert from YUV to RGBA
		void*  imgRGBA = NULL;

		// get the latest frame
		if( !camera->Capture(&imgCPU, &imgCUDA, 1000) )
			printf("detectNet-camera:  failed to capture frame\n");
		
		if( !camera->ConvertRGBA(imgCUDA, &imgRGBA) )
			printf("detectNet-camera:  failed to convert from NV12 to RGBA\n");

		// detect objects in the frame
		detectNet::Detection* detections = NULL;
	
		const int numDetections = net->Detect((float*)imgRGBA, camera->GetWidth(), camera->GetHeight(), &detections);
		
		if( numDetections > 0 )
		{
			printf("%i objects detected\n", numDetections);

			// use font to draw the class description
			cudaFont* font = cudaFont::Create(40);
char text[512];
			if( font != NULL )
			{
				char str[512];
			}
		
			for( int n=0; n < numDetections; n++ )
			{
				printf("detected obj %i  class #%u (%s)  confidence=%f\n", n, detections[n].ClassID, net->GetClassDesc(detections[n].ClassID), detections[n].Confidence);
				printf("bounding box %i  (%f, %f)  (%f, %f)  w=%f  h=%f\n", n, detections[n].Left, detections[n].Top, detections[n].Right, detections[n].Bottom, detections[n].Width(), detections[n].Height()); 

				//sprintf(str, "%2.3f%% %s", confidence * 100.0f, net->GetClassDesc(numDetections));
				//sprintf(str, "class #%u (%s)  confidence=%f\n", detections[n].ClassID, net->GetClassDesc(detections[n].ClassID), detections[n].Confidence);
				//sprintf(text, "class #%u (%s)  confidence=%f", detections[n].ClassID, net->GetClassDesc(detections[n].ClassID), detections[n].Confidence);
				sprintf(text, "%s", net->GetClassDesc(detections[n].ClassID));
				
				if(detections[n].Confidence>0.9)
				{
					printf(" ****** %d \n",font->OverlayText((float4*)imgRGBA, camera->GetWidth(), camera->GetHeight(), text, detections[n].Left+30, detections[n].Top+30,
							   make_float4(255, 255, 255, 255), make_float4(0, 0, 0, 100)));
				}
			}
		}				

		// update display
		if( display != NULL )
		{
			// render the image
			display->RenderOnce((float*)imgRGBA, camera->GetWidth(), camera->GetHeight());

			// update the status bar
			char str[256];
			sprintf(str, "TensorRT %i.%i.%i | %s | Network %.0f FPS", NV_TENSORRT_MAJOR, NV_TENSORRT_MINOR, NV_TENSORRT_PATCH, precisionTypeToStr(net->GetPrecision()), 1000.0f / net->GetNetworkTime());
			display->SetTitle(str);

			// check if the user quit
			if( display->IsClosed() )
				signal_recieved = true;
		}

		// print out timing info
		net->PrintProfilerTimes();
	}
	

	/*
	 * destroy resources
	 */
	printf("detectnet-camera:  shutting down...\n");
	
	SAFE_DELETE(camera);
	SAFE_DELETE(display);
	SAFE_DELETE(net);

	printf("detectnet-camera:  shutdown complete.\n");
	return 0;
}


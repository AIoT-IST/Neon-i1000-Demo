***  Pre-build requirement ***

1. install necessary libary (need Internet)
sudo apt-get install cmake qt{4,5}-qmake libqt4-dev libglew-dev

2. Add libnvidia
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/pylon5/lib64:/usr/lib/aarch64-linux-gnu/

*** Build process ***

2. make a build folder
mkdir build
cd build

3. Compile source code
cmake ..

make

4. Configure Basler camera by /opt/pylon5/bin/PylonViewerApp
   a. Choose Basler daA1920-30uc (Camera model) 
   b. Feature > Image Format Control > Pixel Format > RGB8

5. Run sample
 ./aarch64/bin/imagenet-camera [input_width] [input_height]

 For example, resolution of camera is 1920x1080, please tpye:
 ./aarch64/bin/imagenet-camera 1920 1080

 ./aarch64/bin/imagenet-console [input_image] [output_image]
 For example, input image you want to classfy,  please tpye:
 ./aarch64/bin/imagenet-console ./aarch64/bin/jellyfish.jpg ./aarch64/bin/output.jpg

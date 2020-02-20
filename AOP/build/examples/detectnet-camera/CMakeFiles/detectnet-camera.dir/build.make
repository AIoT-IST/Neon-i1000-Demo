# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/adlink/Desktop/AOP

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/adlink/Desktop/AOP/build

# Include any dependencies generated for this target.
include examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/depend.make

# Include the progress variables for this target.
include examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/progress.make

# Include the compile flags for this target's objects.
include examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/flags.make

examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.o: examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/flags.make
examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.o: ../examples/detectnet-camera/detectnet-camera.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/adlink/Desktop/AOP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.o"
	cd /home/adlink/Desktop/AOP/build/examples/detectnet-camera && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.o -c /home/adlink/Desktop/AOP/examples/detectnet-camera/detectnet-camera.cpp

examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.i"
	cd /home/adlink/Desktop/AOP/build/examples/detectnet-camera && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/adlink/Desktop/AOP/examples/detectnet-camera/detectnet-camera.cpp > CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.i

examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.s"
	cd /home/adlink/Desktop/AOP/build/examples/detectnet-camera && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/adlink/Desktop/AOP/examples/detectnet-camera/detectnet-camera.cpp -o CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.s

# Object files for target detectnet-camera
detectnet__camera_OBJECTS = \
"CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.o"

# External object files for target detectnet-camera
detectnet__camera_EXTERNAL_OBJECTS =

aarch64/bin/detectnet-camera: examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/detectnet-camera.cpp.o
aarch64/bin/detectnet-camera: examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/build.make
aarch64/bin/detectnet-camera: /usr/local/cuda-10.0/lib64/libcudart_static.a
aarch64/bin/detectnet-camera: /usr/lib/aarch64-linux-gnu/librt.so
aarch64/bin/detectnet-camera: aarch64/lib/libjetson-inference.so
aarch64/bin/detectnet-camera: aarch64/lib/libjetson-utils.so
aarch64/bin/detectnet-camera: /usr/local/cuda-10.0/lib64/libcudart_static.a
aarch64/bin/detectnet-camera: /usr/lib/aarch64-linux-gnu/librt.so
aarch64/bin/detectnet-camera: /usr/lib/libopencv_calib3d.so.3.3.1
aarch64/bin/detectnet-camera: /usr/lib/libopencv_features2d.so.3.3.1
aarch64/bin/detectnet-camera: /usr/lib/libopencv_flann.so.3.3.1
aarch64/bin/detectnet-camera: /usr/lib/libopencv_highgui.so.3.3.1
aarch64/bin/detectnet-camera: /usr/lib/libopencv_videoio.so.3.3.1
aarch64/bin/detectnet-camera: /usr/lib/libopencv_imgcodecs.so.3.3.1
aarch64/bin/detectnet-camera: /usr/lib/libopencv_imgproc.so.3.3.1
aarch64/bin/detectnet-camera: /usr/lib/libopencv_core.so.3.3.1
aarch64/bin/detectnet-camera: /usr/lib/aarch64-linux-gnu/libQtGui.so
aarch64/bin/detectnet-camera: /usr/lib/aarch64-linux-gnu/libQtCore.so
aarch64/bin/detectnet-camera: examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/adlink/Desktop/AOP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../aarch64/bin/detectnet-camera"
	cd /home/adlink/Desktop/AOP/build/examples/detectnet-camera && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/detectnet-camera.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/build: aarch64/bin/detectnet-camera

.PHONY : examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/build

examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/clean:
	cd /home/adlink/Desktop/AOP/build/examples/detectnet-camera && $(CMAKE_COMMAND) -P CMakeFiles/detectnet-camera.dir/cmake_clean.cmake
.PHONY : examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/clean

examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/depend:
	cd /home/adlink/Desktop/AOP/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adlink/Desktop/AOP /home/adlink/Desktop/AOP/examples/detectnet-camera /home/adlink/Desktop/AOP/build /home/adlink/Desktop/AOP/build/examples/detectnet-camera /home/adlink/Desktop/AOP/build/examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/detectnet-camera/CMakeFiles/detectnet-camera.dir/depend

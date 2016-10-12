cmake_minimum_required(VERSION 2.8)

project(hello_world)
message("Project name : ${PROJECT_NAME}")

set(EXE_NAME helloworld)

find_package(Ceres REQUIRED)
include_directories(${CERES_INCLUDE_DIRS})

message("Ceres include dirs : ${CERES_INCLUDE_DIRS}")
message("Ceres include dirs : ${CERES_INCLUDES}")
message("Ceres library dirs : ${CERES_LIBRARIES}")
message("Ceres library dirs : ${CERES_LIBS}")

find_package(OpenCV 2.4 REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

message("OpenCV include dirs : ${OpenCV_INCLUDE_DIRS}")
message("OpenCV include dirs : ${OpenCV_INCLUDES}")
message("OpenCV library dirs : ${OpenCV_LIBRARIES}")
message("OpenCV library dirs : ${OpenCV_LIBS}")

add_executable(${EXE_NAME} hello_ceres_opencv_boost.cc)
target_link_libraries(${EXE_NAME} ${CERES_LIBRARIES} ${OpenCV_LIBRARIES})


cmake_minimum_required(VERSION 3.0.2)
project(ue_msgs)

find_package(catkin REQUIRED COMPONENTS
  std_msgs
  geometry_msgs
  message_generation
)

macro(subdirlist result curdir)
    file(GLOB children ${curdir})
    set(filelist "")
    foreach(child ${children})
        get_filename_component(child ${child} NAME)
        list(APPEND filelist ${child})
    endforeach()
    set(${result} ${filelist})
endmacro()

subdirlist(MSG_FILES "msg/*.msg")
subdirlist(SRV_FILES "srv/*.srv")

add_message_files(DIRECTORY msg FILES ${MSG_FILES})
add_service_files(DIRECTORY srv FILES ${SRV_FILES})

generate_messages(DEPENDENCIES
  std_msgs
  geometry_msgs
)

catkin_package(
  CATKIN_DEPENDS
  message_runtime
  std_msgs
  geometry_msgs
)

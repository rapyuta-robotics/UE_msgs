cmake_minimum_required(VERSION 3.5)
project(ue_msgs)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)

find_package(geometry_msgs REQUIRED)
find_package(rosidl_default_generators REQUIRED)

set(EXCEPTION_MSG 
# msg here won't be built.
)

macro(subdirlist result dir type)
  file(GLOB children "${dir}/${type}")
  set(filelist "")
  foreach(child ${children})
      get_filename_component(child ${child} NAME)
      list(FIND EXCEPTION_MSG ${child} index)
      if(${index} EQUAL -1)
        list(APPEND filelist "${dir}/${child}")
      else()
        message("${child} is not supported in ros2")
      endif()
  endforeach()
  set(${result} ${filelist})
endmacro()

subdirlist(MSG_FILES "msg" "*.msg")
subdirlist(SRV_FILES "srv" "*.srv")

rosidl_generate_interfaces(${PROJECT_NAME}
  ${MSG_FILES}
  ${SRV_FILES}

  DEPENDENCIES geometry_msgs
 )

ament_package()

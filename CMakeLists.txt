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

rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/EntityState.msg"
  "srv/SetEntityState.srv"
  "srv/GetEntityState.srv"
  "srv/SpawnEntity.srv"
  "srv/SpawnEntities.srv"
  "srv/DeleteEntity.srv"
  "srv/SpawnWorld.srv"
  "srv/Attach.srv"
  "srv/GetBoolFromId.srv"
  "srv/GetInt32FromId.srv"
  "srv/SetInt32.srv"
  DEPENDENCIES geometry_msgs
 )

ament_package()

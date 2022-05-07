
cmake_minimum_required(VERSION 3.0.2)
project(ue_msgs)

find_package(catkin REQUIRED COMPONENTS
  std_msgs
  geometry_msgs
  message_generation
)

add_message_files(
  DIRECTORY msg FILES
  EntityState.msg
)

add_service_files(DIRECTORY srv FILES
  GetEntityState.srv
  SetEntityState.srv
  SpawnEntity.srv
  SpawnEntities.srv
  DeleteEntity.srv
  SpawnWorld.srv
  Attach.srv
  GetBoolFromId.srv
  GetInt32FromId.srv
  SetInt32.srv
)

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

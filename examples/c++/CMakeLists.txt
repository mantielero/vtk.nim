#make_minimum_required(VERSION 3.12 FATAL_ERROR)

project(Tutorial_Step1)

find_package(VTK COMPONENTS 
  CommonColor
  CommonCore
  FiltersSources
  InteractionStyle
  RenderingContextOpenGL2
  RenderingCore
  RenderingFreeType
  RenderingGL2PSOpenGL2
  RenderingOpenGL2
)

if (NOT VTK_FOUND)
  message(FATAL_ERROR "Tutorial_Step1: Unable to find the VTK build folder.")
endif()

# Prevent a "command line is too long" failure in Windows.
set(CMAKE_NINJA_FORCE_RESPONSE_FILE "ON" CACHE BOOL "Force Ninja to use response files.")
add_executable(Tutorial_Step1 MACOSX_BUNDLE ex01_cylinder.cpp )
  target_link_libraries(Tutorial_Step1 PRIVATE ${VTK_LIBRARIES}
)
# vtk_module_autoinit is needed
vtk_module_autoinit(
  TARGETS Tutorial_Step1
  MODULES ${VTK_LIBRARIES}
)
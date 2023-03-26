## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRayCastStructures.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkRayCastStructures
##  @brief   the structure definitions for ray casting
##
##
##  These are the structures required for ray casting.
##
##  @sa
##  vtkRayCaster
##

type
  vtkRayCastRayInfo_t* {.importcpp: "vtkRayCastRayInfo_t",
                        header: "vtkRayCastStructures.h", bycopy.} = object ##  These are the input values that define the ray. Depending on
                                                                       ##  whether we are casting a WorldRay or a ViewRay, these are in
                                                                       ##  world coordinates or view coordinates.
    Origin* {.importc: "Origin".}: array[3, cfloat]
    Direction* {.importc: "Direction".}: array[3, cfloat] ##  The pixel location for the ray that is being cast can be
                                                     ##  important, for example if hardware ray bounding is being used
                                                     ##  and the location in the depth buffer must be matched to this
                                                     ##  ray.
    Pixel* {.importc: "Pixel".}: array[2, cint] ##  The world coordinate location of the camera is important for the
                                           ##  ray caster to be able to return a Z value for the intersection
    CameraPosition* {.importc: "CameraPosition".}: array[3, cfloat] ##  This input value defines the size of the image
    ImageSize* {.importc: "ImageSize".}: array[2, cint] ##  These are input values for clipping but may be changed
                                                   ##  along the way
    NearClip* {.importc: "NearClip".}: cfloat
    FarClip* {.importc: "FarClip".}: cfloat ##  These are the return values - RGBA and Z
    Color* {.importc: "Color".}: array[4, cfloat]
    Depth* {.importc: "Depth".}: cfloat ##  Some additional space that may be useful for the
                                    ##  specific implementation of the ray caster. This structure
                                    ##  is a convenient place to put it, since there is one
                                    ##  per thread so that writing to these locations is safe
                                    ##  Ray information transformed into local coordinates
    TransformedStart* {.importc: "TransformedStart".}: array[4, cfloat]
    TransformedEnd* {.importc: "TransformedEnd".}: array[4, cfloat]
    TransformedDirection* {.importc: "TransformedDirection".}: array[4, cfloat]
    TransformedIncrement* {.importc: "TransformedIncrement".}: array[3, cfloat] ##  The number of steps we want to take if this is
                                                                           ##  a ray caster that takes steps
    NumberOfStepsToTake* {.importc: "NumberOfStepsToTake".}: cint ##  The number of steps we actually take if this is
                                                              ##  a ray caster that takes steps
    NumberOfStepsTaken* {.importc: "NumberOfStepsTaken".}: cint

  vtkRayCastRayInfo* = vtkRayCastRayInfo_t

## ignored statement

##  VTK-HeaderTest-Exclude: vtkRayCastStructures.h

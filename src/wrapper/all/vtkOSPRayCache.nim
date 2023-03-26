## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOSPRayCache.h
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
##  @class   vtkOSPRayCache
##  @brief   temporal cache ospray structures to speed flipbooks
##
##  A temporal cache of templated objects that are created on the first
##  playthrough and reused afterward to speed up animations. Cache is
##  first come first serve. In other words the first 'Size' Set()
##  calls will succeed, later calls will be silently ignored. Decreasing
##  the size of the cache frees all previously held contents.
##
##  This class is internal.
##

import
  vtkRenderingRayTracingModule, vtkSystemIncludes, RTWrapper/RTWrapper

type
  vtkOSPRayCache*[T] {.importcpp: "vtkOSPRayCache<\'0>",
                      header: "vtkOSPRayCache.h", bycopy.} = object ##  deletes all of the content in the cache


proc constructvtkOSPRayCache*[T](): vtkOSPRayCache[T] {.constructor,
    importcpp: "vtkOSPRayCache<\'*0>(@)", header: "vtkOSPRayCache.h".}
proc destroyvtkOSPRayCache*[T](this: var vtkOSPRayCache[T]) {.
    importcpp: "#.~vtkOSPRayCache()", header: "vtkOSPRayCache.h".}
proc Set*[T](this: var vtkOSPRayCache[T]; tstep: cdouble; payload: shared_ptr[T]) {.
    importcpp: "Set", header: "vtkOSPRayCache.h".}
proc Get*[T](this: var vtkOSPRayCache[T]; tstep: cdouble): shared_ptr[T] {.
    importcpp: "Get", header: "vtkOSPRayCache.h".}
proc SetSize*[T](this: var vtkOSPRayCache[T]; sz: csize_t) {.importcpp: "SetSize",
    header: "vtkOSPRayCache.h".}
proc GetSize*[T](this: var vtkOSPRayCache[T]): csize_t {.importcpp: "GetSize",
    header: "vtkOSPRayCache.h".}
proc Contains*[T](this: var vtkOSPRayCache[T]; tstep: cdouble): bool {.
    importcpp: "Contains", header: "vtkOSPRayCache.h".}
proc HasRoom*[T](this: var vtkOSPRayCache[T]): bool {.importcpp: "HasRoom",
    header: "vtkOSPRayCache.h".}
type
  vtkOSPRayCacheItemObject* {.importcpp: "vtkOSPRayCacheItemObject",
                             header: "vtkOSPRayCache.h", bycopy.} = object
    `object`* {.importc: "object".}: OSPObject
    size* {.importc: "size".}: csize_t
    backend* {.importc: "backend".}: ptr Backend = nil


proc constructvtkOSPRayCacheItemObject*(be: ptr Backend; obj: OSPObject): vtkOSPRayCacheItemObject {.
    constructor, importcpp: "vtkOSPRayCacheItemObject(@)",
    header: "vtkOSPRayCache.h".}
proc destroyvtkOSPRayCacheItemObject*(this: var vtkOSPRayCacheItemObject) {.
    importcpp: "#.~vtkOSPRayCacheItemObject()", header: "vtkOSPRayCache.h".}
## !!!Ignored construct:  { nullptr } ;
## Error: identifier expected, but got: {!!!

## !!!Ignored construct:  { 0 } ;
## Error: identifier expected, but got: {!!!

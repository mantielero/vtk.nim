## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredExtent.h
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
##  @class   vtkStructuredExtent
##  @brief   helper class to aid working with structured
##   extents.
##
##
##   vtkStructuredExtent is an helper class that helps in arithmetic with
##   structured extents. It defines a bunch of static methods (most of which are
##   inlined) to aid in dealing with extents.
##

import
  vtkCommonDataModelModule, vtkObject

type
  vtkStructuredExtent* {.importcpp: "vtkStructuredExtent",
                        header: "vtkStructuredExtent.h", bycopy.} = object of vtkObject
    vtkStructuredExtent* {.importc: "vtkStructuredExtent".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStructuredExtent {.importcpp: "vtkStructuredExtent::New(@)",
                                   header: "vtkStructuredExtent.h".}
type
  vtkStructuredExtentSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStructuredExtent::IsTypeOf(@)", header: "vtkStructuredExtent.h".}
proc IsA*(this: var vtkStructuredExtent; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStructuredExtent.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStructuredExtent {.
    importcpp: "vtkStructuredExtent::SafeDownCast(@)",
    header: "vtkStructuredExtent.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStructuredExtent :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredExtent :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredExtent :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStructuredExtent; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStructuredExtent.h".}
proc Clamp*(ext: array[6, cint]; wholeExt: ptr cint) {.
    importcpp: "vtkStructuredExtent::Clamp(@)", header: "vtkStructuredExtent.h".}
proc StrictlySmaller*(ext: array[6, cint]; wholeExt: array[6, cint]): bool {.
    importcpp: "vtkStructuredExtent::StrictlySmaller(@)",
    header: "vtkStructuredExtent.h".}
proc Smaller*(ext: array[6, cint]; wholeExt: array[6, cint]): bool {.
    importcpp: "vtkStructuredExtent::Smaller(@)", header: "vtkStructuredExtent.h".}
proc Grow*(ext: array[6, cint]; count: cint) {.
    importcpp: "vtkStructuredExtent::Grow(@)", header: "vtkStructuredExtent.h".}
proc Grow*(ext: array[6, cint]; count: cint; wholeExt: array[6, cint]) {.
    importcpp: "vtkStructuredExtent::Grow(@)", header: "vtkStructuredExtent.h".}
proc Transform*(ext: array[6, cint]; wholeExt: array[6, cint]) {.
    importcpp: "vtkStructuredExtent::Transform(@)",
    header: "vtkStructuredExtent.h".}
proc GetDimensions*(ext: array[6, cint]; dims: array[3, cint]) {.
    importcpp: "vtkStructuredExtent::GetDimensions(@)",
    header: "vtkStructuredExtent.h".}
## ----------------------------------------------------------------------------

proc Clamp*(this: var vtkStructuredExtent; ext: array[6, cint];
           wholeExt: array[6, cint]) {.importcpp: "Clamp",
                                    header: "vtkStructuredExtent.h".}
## ----------------------------------------------------------------------------

proc Smaller*(this: var vtkStructuredExtent; ext: array[6, cint];
             wholeExt: array[6, cint]): bool {.importcpp: "Smaller",
    header: "vtkStructuredExtent.h".}
## ----------------------------------------------------------------------------

proc StrictlySmaller*(this: var vtkStructuredExtent; ext: array[6, cint];
                     wholeExt: array[6, cint]): bool {.importcpp: "StrictlySmaller",
    header: "vtkStructuredExtent.h".}
## ----------------------------------------------------------------------------

proc Grow*(this: var vtkStructuredExtent; ext: array[6, cint]; count: cint) {.
    importcpp: "Grow", header: "vtkStructuredExtent.h".}
## ----------------------------------------------------------------------------

proc Grow*(this: var vtkStructuredExtent; ext: array[6, cint]; count: cint;
          wholeExt: array[6, cint]) {.importcpp: "Grow",
                                   header: "vtkStructuredExtent.h".}
## ----------------------------------------------------------------------------

proc Transform*(this: var vtkStructuredExtent; ext: array[6, cint];
               wholeExt: array[6, cint]) {.importcpp: "Transform",
                                        header: "vtkStructuredExtent.h".}
## ----------------------------------------------------------------------------

proc GetDimensions*(this: var vtkStructuredExtent; ext: array[6, cint];
                   dims: array[3, cint]) {.importcpp: "GetDimensions",
                                        header: "vtkStructuredExtent.h".}
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredPoints.h
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
##  @class   vtkStructuredPoints
##  @brief   A subclass of ImageData.
##
##  StructuredPoints is a subclass of ImageData that requires the data extent
##  to exactly match the update extent. Normal image data allows that the
##  data extent may be larger than the update extent.
##  StructuredPoints also defines the origin differently that vtkImageData.
##  For structured points the origin is the location of first point.
##  Whereas images define the origin as the location of point 0, 0, 0.
##  Image Origin is stored in ivar, and structured points
##  have special methods for setting/getting the origin/extents.
##

import
  vtkCommonDataModelModule, vtkImageData

type
  vtkStructuredPoints* {.importcpp: "vtkStructuredPoints",
                        header: "vtkStructuredPoints.h", bycopy.} = object of vtkImageData
    vtkStructuredPoints* {.importc: "vtkStructuredPoints".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStructuredPoints {.importcpp: "vtkStructuredPoints::New(@)",
                                   header: "vtkStructuredPoints.h".}
type
  vtkStructuredPointsSuperclass* = vtkImageData

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStructuredPoints::IsTypeOf(@)", header: "vtkStructuredPoints.h".}
proc IsA*(this: var vtkStructuredPoints; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStructuredPoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStructuredPoints {.
    importcpp: "vtkStructuredPoints::SafeDownCast(@)",
    header: "vtkStructuredPoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStructuredPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageData :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredPoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStructuredPoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStructuredPoints.h".}
proc GetDataObjectType*(this: var vtkStructuredPoints): cint {.
    importcpp: "GetDataObjectType", header: "vtkStructuredPoints.h".}
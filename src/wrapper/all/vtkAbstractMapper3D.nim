## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractMapper3D.h
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
##  @class   vtkAbstractMapper3D
##  @brief   abstract class specifies interface to map 3D data
##
##  vtkAbstractMapper3D is an abstract class to specify interface between 3D
##  data and graphics primitives or software rendering techniques. Subclasses
##  of vtkAbstractMapper3D can be used for rendering geometry or rendering
##  volumetric data.
##
##  This class also defines an API to support hardware clipping planes (at most
##  six planes can be defined). It also provides geometric data about the input
##  data it maps, such as the bounding box and center.
##
##  @sa
##  vtkAbstractMapper vtkMapper vtkPolyDataMapper vtkVolumeMapper
##

import
  vtkAbstractMapper, vtkRenderingCoreModule

discard "forward decl of vtkWindow"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkMatrix4x4"
type
  vtkAbstractMapper3D* {.importcpp: "vtkAbstractMapper3D",
                        header: "vtkAbstractMapper3D.h", bycopy.} = object of vtkAbstractMapper
    vtkAbstractMapper3D* {.importc: "vtkAbstractMapper3D".}: VTK_NEWINSTANCE

  vtkAbstractMapper3DSuperclass* = vtkAbstractMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractMapper3D::IsTypeOf(@)", header: "vtkAbstractMapper3D.h".}
proc IsA*(this: var vtkAbstractMapper3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractMapper3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractMapper3D {.
    importcpp: "vtkAbstractMapper3D::SafeDownCast(@)",
    header: "vtkAbstractMapper3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractMapper3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractMapper3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractMapper3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractMapper3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractMapper3D.h".}
## !!!Ignored construct:  *
##  Return bounding box (array of six doubles) of data expressed as
##  (xmin,xmax, ymin,ymax, zmin,zmax).
##  Update this->Bounds as a side effect.
##  virtual double * GetBounds ( ) VTK_SIZEHINT ( 6 ) = 0 ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkAbstractMapper3D; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkAbstractMapper3D.h".}
## !!!Ignored construct:  /@{ *
##  Return the Center of this mapper's data.
##  double * GetCenter ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetCenter*(this: var vtkAbstractMapper3D; center: array[3, cdouble]) {.
    importcpp: "GetCenter", header: "vtkAbstractMapper3D.h".}
proc GetLength*(this: var vtkAbstractMapper3D): cdouble {.importcpp: "GetLength",
    header: "vtkAbstractMapper3D.h".}
proc IsARayCastMapper*(this: var vtkAbstractMapper3D): vtkTypeBool {.
    importcpp: "IsARayCastMapper", header: "vtkAbstractMapper3D.h".}
proc IsARenderIntoImageMapper*(this: var vtkAbstractMapper3D): vtkTypeBool {.
    importcpp: "IsARenderIntoImageMapper", header: "vtkAbstractMapper3D.h".}
proc GetClippingPlaneInDataCoords*(this: var vtkAbstractMapper3D;
                                  propMatrix: ptr vtkMatrix4x4; i: cint;
                                  planeEquation: array[4, cdouble]) {.
    importcpp: "GetClippingPlaneInDataCoords", header: "vtkAbstractMapper3D.h".}
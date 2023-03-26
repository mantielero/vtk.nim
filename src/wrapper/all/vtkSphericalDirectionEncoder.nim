## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphericalDirectionEncoder.h
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
##  @class   vtkSphericalDirectionEncoder
##  @brief   A direction encoder based on spherical coordinates
##
##  vtkSphericalDirectionEncoder is a direction encoder which uses spherical
##  coordinates for mapping (nx, ny, nz) into an azimuth, elevation pair.
##
##  @sa
##  vtkDirectionEncoder
##

import
  vtkDirectionEncoder, vtkRenderingVolumeModule

type
  vtkSphericalDirectionEncoder* {.importcpp: "vtkSphericalDirectionEncoder",
                                 header: "vtkSphericalDirectionEncoder.h", bycopy.} = object of vtkDirectionEncoder
    vtkSphericalDirectionEncoder* {.importc: "vtkSphericalDirectionEncoder".}: VTK_NEWINSTANCE

  vtkSphericalDirectionEncoderSuperclass* = vtkDirectionEncoder

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSphericalDirectionEncoder::IsTypeOf(@)",
    header: "vtkSphericalDirectionEncoder.h".}
proc IsA*(this: var vtkSphericalDirectionEncoder; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSphericalDirectionEncoder.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSphericalDirectionEncoder {.
    importcpp: "vtkSphericalDirectionEncoder::SafeDownCast(@)",
    header: "vtkSphericalDirectionEncoder.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSphericalDirectionEncoder :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDirectionEncoder :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphericalDirectionEncoder :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphericalDirectionEncoder :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSphericalDirectionEncoder; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkSphericalDirectionEncoder.h".}
proc New*(): ptr vtkSphericalDirectionEncoder {.
    importcpp: "vtkSphericalDirectionEncoder::New(@)",
    header: "vtkSphericalDirectionEncoder.h".}
proc GetEncodedDirection*(this: var vtkSphericalDirectionEncoder;
                         n: array[3, cfloat]): cint {.
    importcpp: "GetEncodedDirection", header: "vtkSphericalDirectionEncoder.h".}
## !!!Ignored construct:  *
##  / Given an encoded value, return a pointer to the normal vector
##  float * GetDecodedGradient ( int value ) VTK_SIZEHINT ( 3 ) override ;
## Error: expected ';'!!!

proc GetNumberOfEncodedDirections*(this: var vtkSphericalDirectionEncoder): cint {.
    importcpp: "GetNumberOfEncodedDirections",
    header: "vtkSphericalDirectionEncoder.h".}
proc GetDecodedGradientTable*(this: var vtkSphericalDirectionEncoder): ptr cfloat {.
    importcpp: "GetDecodedGradientTable", header: "vtkSphericalDirectionEncoder.h".}
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRecursiveSphereDirectionEncoder.h
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
##  @class   vtkRecursiveSphereDirectionEncoder
##  @brief   A direction encoder based on the recursive subdivision of an octahedron
##
##  vtkRecursiveSphereDirectionEncoder is a direction encoder which uses the
##  vertices of a recursive subdivision of an octahedron (with the vertices
##  pushed out onto the surface of an enclosing sphere) to encode directions
##  into a two byte value.
##
##  @sa
##  vtkDirectionEncoder
##

import
  vtkDirectionEncoder, vtkRenderingVolumeModule

type
  vtkRecursiveSphereDirectionEncoder* {.importcpp: "vtkRecursiveSphereDirectionEncoder", header: "vtkRecursiveSphereDirectionEncoder.h",
                                       bycopy.} = object of vtkDirectionEncoder
    vtkRecursiveSphereDirectionEncoder* {.
        importc: "vtkRecursiveSphereDirectionEncoder".}: VTK_NEWINSTANCE
    ##  The index table which maps (x,y) position in the rotated grid
    ##  to an encoded normal
    ##  int                   IndexTable[2*NORM_SQR_SIZE - 1][2*NORM_SQR_SIZE -1];
    ##  This is a table that maps encoded normal (2 byte value) to a
    ##  normal (dx, dy, dz)
    ##  float                 DecodedNormal[3*(1 + 2*(NORM_SQR_SIZE*NORM_SQR_SIZE+
    ##                              (NORM_SQR_SIZE-1)*(NORM_SQR_SIZE-1)))];
    ##  Method to initialize the index table and variable that
    ##  stored the recursion depth the last time the table was
    ##  built

  vtkRecursiveSphereDirectionEncoderSuperclass* = vtkDirectionEncoder

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRecursiveSphereDirectionEncoder::IsTypeOf(@)",
    header: "vtkRecursiveSphereDirectionEncoder.h".}
proc IsA*(this: var vtkRecursiveSphereDirectionEncoder; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRecursiveSphereDirectionEncoder.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRecursiveSphereDirectionEncoder {.
    importcpp: "vtkRecursiveSphereDirectionEncoder::SafeDownCast(@)",
    header: "vtkRecursiveSphereDirectionEncoder.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRecursiveSphereDirectionEncoder :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDirectionEncoder :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRecursiveSphereDirectionEncoder :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRecursiveSphereDirectionEncoder :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRecursiveSphereDirectionEncoder; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkRecursiveSphereDirectionEncoder.h".}
proc New*(): ptr vtkRecursiveSphereDirectionEncoder {.
    importcpp: "vtkRecursiveSphereDirectionEncoder::New(@)",
    header: "vtkRecursiveSphereDirectionEncoder.h".}
proc GetEncodedDirection*(this: var vtkRecursiveSphereDirectionEncoder;
                         n: array[3, cfloat]): cint {.
    importcpp: "GetEncodedDirection",
    header: "vtkRecursiveSphereDirectionEncoder.h".}
## !!!Ignored construct:  *
##  / Given an encoded value, return a pointer to the normal vector
##  float * GetDecodedGradient ( int value ) VTK_SIZEHINT ( 3 ) override ;
## Error: expected ';'!!!

proc GetNumberOfEncodedDirections*(this: var vtkRecursiveSphereDirectionEncoder): cint {.
    importcpp: "GetNumberOfEncodedDirections",
    header: "vtkRecursiveSphereDirectionEncoder.h".}
proc GetDecodedGradientTable*(this: var vtkRecursiveSphereDirectionEncoder): ptr cfloat {.
    importcpp: "GetDecodedGradientTable",
    header: "vtkRecursiveSphereDirectionEncoder.h".}
proc SetRecursionDepth*(this: var vtkRecursiveSphereDirectionEncoder; _arg: cint) {.
    importcpp: "SetRecursionDepth", header: "vtkRecursiveSphereDirectionEncoder.h".}
proc GetRecursionDepthMinValue*(this: var vtkRecursiveSphereDirectionEncoder): cint {.
    importcpp: "GetRecursionDepthMinValue",
    header: "vtkRecursiveSphereDirectionEncoder.h".}
proc GetRecursionDepthMaxValue*(this: var vtkRecursiveSphereDirectionEncoder): cint {.
    importcpp: "GetRecursionDepthMaxValue",
    header: "vtkRecursiveSphereDirectionEncoder.h".}
## !!!Ignored construct:  virtual int GetRecursionDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RecursionDepth  of  << this -> RecursionDepth ) ; return this -> RecursionDepth ; } ;
## Error: expected ';'!!!

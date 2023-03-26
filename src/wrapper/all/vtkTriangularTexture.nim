## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTriangularTexture.h
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
##  @class   vtkTriangularTexture
##  @brief   generate 2D triangular texture map
##
##  vtkTriangularTexture is a filter that generates a 2D texture map based on
##  the paper "Opacity-modulating Triangular Textures for Irregular Surfaces,"
##  by Penny Rheingans, IEEE Visualization '96, pp. 219-225.
##  The textures assume texture coordinates of (0,0), (1.0) and
##  (.5, sqrt(3)/2). The sequence of texture values is the same along each
##  edge of the triangular texture map. So, the assignment order of texture
##  coordinates is arbitrary.
##
##  @sa
##  vtkTriangularTCoords
##

import
  vtkImageAlgorithm, vtkImagingHybridModule

type
  vtkTriangularTexture* {.importcpp: "vtkTriangularTexture",
                         header: "vtkTriangularTexture.h", bycopy.} = object of vtkImageAlgorithm
    vtkTriangularTexture* {.importc: "vtkTriangularTexture".}: VTK_NEWINSTANCE

  vtkTriangularTextureSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTriangularTexture::IsTypeOf(@)",
    header: "vtkTriangularTexture.h".}
proc IsA*(this: var vtkTriangularTexture; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTriangularTexture.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTriangularTexture {.
    importcpp: "vtkTriangularTexture::SafeDownCast(@)",
    header: "vtkTriangularTexture.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTriangularTexture :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTriangularTexture :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTriangularTexture :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTriangularTexture; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTriangularTexture.h".}
proc New*(): ptr vtkTriangularTexture {.importcpp: "vtkTriangularTexture::New(@)",
                                    header: "vtkTriangularTexture.h".}
proc SetScaleFactor*(this: var vtkTriangularTexture; _arg: cdouble) {.
    importcpp: "SetScaleFactor", header: "vtkTriangularTexture.h".}
## !!!Ignored construct:  virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ;
## Error: expected ';'!!!

proc SetScaleFactorXSize*(this: var vtkTriangularTexture; _arg: cint) {.
    importcpp: "SetScaleFactorXSize", header: "vtkTriangularTexture.h".}
## !!!Ignored construct:  virtual int GetScaleFactorXSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XSize  of  << this -> XSize ) ; return this -> XSize ; } ;
## Error: expected ';'!!!

proc SetScaleFactorXSizeYSize*(this: var vtkTriangularTexture; _arg: cint) {.
    importcpp: "SetScaleFactorXSizeYSize", header: "vtkTriangularTexture.h".}
## !!!Ignored construct:  virtual int GetScaleFactorXSizeYSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YSize  of  << this -> YSize ) ; return this -> YSize ; } ;
## Error: expected ';'!!!

proc SetTexturePattern*(this: var vtkTriangularTexture; _arg: cint) {.
    importcpp: "SetTexturePattern", header: "vtkTriangularTexture.h".}
proc GetTexturePatternMinValue*(this: var vtkTriangularTexture): cint {.
    importcpp: "GetTexturePatternMinValue", header: "vtkTriangularTexture.h".}
proc GetTexturePatternMaxValue*(this: var vtkTriangularTexture): cint {.
    importcpp: "GetTexturePatternMaxValue", header: "vtkTriangularTexture.h".}
## !!!Ignored construct:  virtual int GetScaleFactorXSizeYSizeTexturePattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TexturePattern  of  << this -> TexturePattern ) ; return this -> TexturePattern ; } ;
## Error: expected ';'!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBooleanTexture.h
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
##  @class   vtkBooleanTexture
##  @brief   generate 2D texture map based on combinations of inside, outside, and on region boundary
##
##
##  vtkBooleanTexture is a filter to generate a 2D texture map based on
##  combinations of inside, outside, and on region boundary. The "region" is
##  implicitly represented via 2D texture coordinates. These texture
##  coordinates are normally generated using a filter like
##  vtkImplicitTextureCoords, which generates the texture coordinates for
##  any implicit function.
##
##  vtkBooleanTexture generates the map according to the s-t texture
##  coordinates plus the notion of being in, on, or outside of a
##  region. An in region is when the texture coordinate is between
##  (0,0.5-thickness/2).  An out region is where the texture coordinate
##  is (0.5+thickness/2). An on region is between
##  (0.5-thickness/2,0.5+thickness/2). The combination in, on, and out
##  for each of the s-t texture coordinates results in 16 possible
##  combinations (see text). For each combination, a different value of
##  intensity and transparency can be assigned. To assign maximum intensity
##  and/or opacity use the value 255. A minimum value of 0 results in
##  a black region (for intensity) and a fully transparent region (for
##  transparency).
##
##  @sa
##  vtkImplicitTextureCoords vtkThresholdTextureCoords
##

import
  vtkImageAlgorithm, vtkImagingHybridModule

type
  vtkBooleanTexture* {.importcpp: "vtkBooleanTexture",
                      header: "vtkBooleanTexture.h", bycopy.} = object of vtkImageAlgorithm
    vtkBooleanTexture* {.importc: "vtkBooleanTexture".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBooleanTexture {.importcpp: "vtkBooleanTexture::New(@)",
                                 header: "vtkBooleanTexture.h".}
type
  vtkBooleanTextureSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBooleanTexture::IsTypeOf(@)", header: "vtkBooleanTexture.h".}
proc IsA*(this: var vtkBooleanTexture; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBooleanTexture.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBooleanTexture {.
    importcpp: "vtkBooleanTexture::SafeDownCast(@)", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBooleanTexture :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBooleanTexture :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBooleanTexture :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBooleanTexture; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBooleanTexture.h".}
proc SetXSize*(this: var vtkBooleanTexture; _arg: cint) {.importcpp: "SetXSize",
    header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual int GetXSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XSize  of  << this -> XSize ) ; return this -> XSize ; } ;
## Error: expected ';'!!!

proc SetXSizeYSize*(this: var vtkBooleanTexture; _arg: cint) {.
    importcpp: "SetXSizeYSize", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual int GetXSizeYSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YSize  of  << this -> YSize ) ; return this -> YSize ; } ;
## Error: expected ';'!!!

proc SetXSizeYSizeThickness*(this: var vtkBooleanTexture; _arg: cint) {.
    importcpp: "SetXSizeYSizeThickness", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual int GetXSizeYSizeThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Thickness  of  << this -> Thickness ) ; return this -> Thickness ; } ;
## Error: expected ';'!!!

proc SetInIn*(this: var vtkBooleanTexture; _arg1: cuchar; _arg2: cuchar) {.
    importcpp: "SetInIn", header: "vtkBooleanTexture.h".}
proc SetInIn*(this: var vtkBooleanTexture; _arg: array[2, cuchar]) {.
    importcpp: "SetInIn", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInIn ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << InIn  pointer  << this -> InIn ) ; return this -> InIn ; } VTK_WRAPEXCLUDE virtual void GetInIn ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> InIn [ i ] ; } } ;
## Error: expected ';'!!!

proc SetInInInOut*(this: var vtkBooleanTexture; _arg1: cuchar; _arg2: cuchar) {.
    importcpp: "SetInInInOut", header: "vtkBooleanTexture.h".}
proc SetInInInOut*(this: var vtkBooleanTexture; _arg: array[2, cuchar]) {.
    importcpp: "SetInInInOut", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInInInOut ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << InOut  pointer  << this -> InOut ) ; return this -> InOut ; } VTK_WRAPEXCLUDE virtual void GetInInInOut ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> InOut [ i ] ; } } ;
## Error: expected ';'!!!

proc SetInInInOutOutIn*(this: var vtkBooleanTexture; _arg1: cuchar; _arg2: cuchar) {.
    importcpp: "SetInInInOutOutIn", header: "vtkBooleanTexture.h".}
proc SetInInInOutOutIn*(this: var vtkBooleanTexture; _arg: array[2, cuchar]) {.
    importcpp: "SetInInInOutOutIn", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInInInOutOutIn ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutIn  pointer  << this -> OutIn ) ; return this -> OutIn ; } VTK_WRAPEXCLUDE virtual void GetInInInOutOutIn ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> OutIn [ i ] ; } } ;
## Error: expected ';'!!!

proc SetInInInOutOutInOutOut*(this: var vtkBooleanTexture; _arg1: cuchar;
                             _arg2: cuchar) {.
    importcpp: "SetInInInOutOutInOutOut", header: "vtkBooleanTexture.h".}
proc SetInInInOutOutInOutOut*(this: var vtkBooleanTexture; _arg: array[2, cuchar]) {.
    importcpp: "SetInInInOutOutInOutOut", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInInInOutOutInOutOut ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutOut  pointer  << this -> OutOut ) ; return this -> OutOut ; } VTK_WRAPEXCLUDE virtual void GetInInInOutOutInOutOut ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> OutOut [ i ] ; } } ;
## Error: expected ';'!!!

proc SetInInInOutOutInOutOutOnOn*(this: var vtkBooleanTexture; _arg1: cuchar;
                                 _arg2: cuchar) {.
    importcpp: "SetInInInOutOutInOutOutOnOn", header: "vtkBooleanTexture.h".}
proc SetInInInOutOutInOutOutOnOn*(this: var vtkBooleanTexture;
                                 _arg: array[2, cuchar]) {.
    importcpp: "SetInInInOutOutInOutOutOnOn", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInInInOutOutInOutOutOnOn ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OnOn  pointer  << this -> OnOn ) ; return this -> OnOn ; } VTK_WRAPEXCLUDE virtual void GetInInInOutOutInOutOutOnOn ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> OnOn [ i ] ; } } ;
## Error: expected ';'!!!

proc SetInInInOutOutInOutOutOnOnOnIn*(this: var vtkBooleanTexture; _arg1: cuchar;
                                     _arg2: cuchar) {.
    importcpp: "SetInInInOutOutInOutOutOnOnOnIn", header: "vtkBooleanTexture.h".}
proc SetInInInOutOutInOutOutOnOnOnIn*(this: var vtkBooleanTexture;
                                     _arg: array[2, cuchar]) {.
    importcpp: "SetInInInOutOutInOutOutOnOnOnIn", header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInInInOutOutInOutOutOnOnOnIn ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OnIn  pointer  << this -> OnIn ) ; return this -> OnIn ; } VTK_WRAPEXCLUDE virtual void GetInInInOutOutInOutOutOnOnOnIn ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> OnIn [ i ] ; } } ;
## Error: expected ';'!!!

proc SetInInInOutOutInOutOutOnOnOnInOnOut*(this: var vtkBooleanTexture;
    _arg1: cuchar; _arg2: cuchar) {.importcpp: "SetInInInOutOutInOutOutOnOnOnInOnOut",
                                header: "vtkBooleanTexture.h".}
proc SetInInInOutOutInOutOutOnOnOnInOnOut*(this: var vtkBooleanTexture;
    _arg: array[2, cuchar]) {.importcpp: "SetInInInOutOutInOutOutOnOnOnInOnOut",
                           header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInInInOutOutInOutOutOnOnOnInOnOut ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OnOut  pointer  << this -> OnOut ) ; return this -> OnOut ; } VTK_WRAPEXCLUDE virtual void GetInInInOutOutInOutOutOnOnOnInOnOut ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> OnOut [ i ] ; } } ;
## Error: expected ';'!!!

proc SetInInInOutOutInOutOutOnOnOnInOnOutInOn*(this: var vtkBooleanTexture;
    _arg1: cuchar; _arg2: cuchar) {.importcpp: "SetInInInOutOutInOutOutOnOnOnInOnOutInOn",
                                header: "vtkBooleanTexture.h".}
proc SetInInInOutOutInOutOutOnOnOnInOnOutInOn*(this: var vtkBooleanTexture;
    _arg: array[2, cuchar]) {.importcpp: "SetInInInOutOutInOutOutOnOnOnInOnOutInOn",
                           header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInInInOutOutInOutOutOnOnOnInOnOutInOn ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << InOn  pointer  << this -> InOn ) ; return this -> InOn ; } VTK_WRAPEXCLUDE virtual void GetInInInOutOutInOutOutOnOnOnInOnOutInOn ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> InOn [ i ] ; } } ;
## Error: expected ';'!!!

proc SetInInInOutOutInOutOutOnOnOnInOnOutInOnOutOn*(this: var vtkBooleanTexture;
    _arg1: cuchar; _arg2: cuchar) {.importcpp: "SetInInInOutOutInOutOutOnOnOnInOnOutInOnOutOn",
                                header: "vtkBooleanTexture.h".}
proc SetInInInOutOutInOutOutOnOnOnInOnOutInOnOutOn*(this: var vtkBooleanTexture;
    _arg: array[2, cuchar]) {.importcpp: "SetInInInOutOutInOutOutOnOnOnInOnOutInOnOutOn",
                           header: "vtkBooleanTexture.h".}
## !!!Ignored construct:  virtual unsigned char * GetInInInOutOutInOutOutOnOnOnInOnOutInOnOutOn ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutOn  pointer  << this -> OutOn ) ; return this -> OutOn ; } VTK_WRAPEXCLUDE virtual void GetInInInOutOutInOutOutOnOnOnInOnOutInOnOutOn ( unsigned char data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> OutOn [ i ] ; } } ;
## Error: expected ';'!!!

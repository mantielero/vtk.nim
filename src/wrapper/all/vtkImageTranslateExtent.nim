## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageTranslateExtent.h
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
##  @class   vtkImageTranslateExtent
##  @brief   Changes extent, nothing else.
##
##  vtkImageTranslateExtent shift the whole extent, but does not
##  change the data.
##

import
  vtkImageAlgorithm, vtkImagingCoreModule

type
  vtkImageTranslateExtent* {.importcpp: "vtkImageTranslateExtent",
                            header: "vtkImageTranslateExtent.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageTranslateExtent* {.importc: "vtkImageTranslateExtent".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageTranslateExtent {.importcpp: "vtkImageTranslateExtent::New(@)",
                                       header: "vtkImageTranslateExtent.h".}
type
  vtkImageTranslateExtentSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageTranslateExtent::IsTypeOf(@)",
    header: "vtkImageTranslateExtent.h".}
proc IsA*(this: var vtkImageTranslateExtent; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageTranslateExtent.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageTranslateExtent {.
    importcpp: "vtkImageTranslateExtent::SafeDownCast(@)",
    header: "vtkImageTranslateExtent.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageTranslateExtent :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageTranslateExtent :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageTranslateExtent :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageTranslateExtent; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageTranslateExtent.h".}
proc SetTranslation*(this: var vtkImageTranslateExtent; _arg1: cint; _arg2: cint;
                    _arg3: cint) {.importcpp: "SetTranslation",
                                 header: "vtkImageTranslateExtent.h".}
proc SetTranslation*(this: var vtkImageTranslateExtent; _arg: array[3, cint]) {.
    importcpp: "SetTranslation", header: "vtkImageTranslateExtent.h".}
## !!!Ignored construct:  virtual int * GetTranslation ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Translation  pointer  << this -> Translation ) ; return this -> Translation ; } VTK_WRAPEXCLUDE virtual void GetTranslation ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> Translation [ 0 ] ; _arg2 = this -> Translation [ 1 ] ; _arg3 = this -> Translation [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Translation  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTranslation ( int _arg [ 3 ] ) { this -> GetTranslation ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

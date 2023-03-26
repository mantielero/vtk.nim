## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWindowLevelLookupTable.h
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
##  @class   vtkWindowLevelLookupTable
##  @brief   map scalar values into colors or colors to scalars; generate color table
##
##  vtkWindowLevelLookupTable is an object that is used by mapper objects
##  to map scalar values into rgba (red-green-blue-alpha transparency)
##  color specification, or rgba into scalar values. The color table can
##  be created by direct insertion of color values, or by specifying a
##  window and level. Window / Level is used in medical imaging to specify
##  a linear greyscale ramp. The Level is the center of the ramp.  The
##  Window is the width of the ramp.
##
##  @warning
##  vtkWindowLevelLookupTable is a reference counted object. Therefore, you
##  should always use operator "new" to construct new objects. This procedure
##  will avoid memory problems (see text).
##
##  @sa
##  vtkLogLookupTable
##

import
  vtkLookupTable, vtkRenderingCoreModule

type
  vtkWindowLevelLookupTable* {.importcpp: "vtkWindowLevelLookupTable",
                              header: "vtkWindowLevelLookupTable.h", bycopy.} = object of vtkLookupTable
    vtkWindowLevelLookupTable* {.importc: "vtkWindowLevelLookupTable".}: VTK_NEWINSTANCE


proc New*(): ptr vtkWindowLevelLookupTable {.
    importcpp: "vtkWindowLevelLookupTable::New(@)",
    header: "vtkWindowLevelLookupTable.h".}
type
  vtkWindowLevelLookupTableSuperclass* = vtkLookupTable

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWindowLevelLookupTable::IsTypeOf(@)",
    header: "vtkWindowLevelLookupTable.h".}
proc IsA*(this: var vtkWindowLevelLookupTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkWindowLevelLookupTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWindowLevelLookupTable {.
    importcpp: "vtkWindowLevelLookupTable::SafeDownCast(@)",
    header: "vtkWindowLevelLookupTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWindowLevelLookupTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWindowLevelLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWindowLevelLookupTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWindowLevelLookupTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWindowLevelLookupTable.h".}
proc ForceBuild*(this: var vtkWindowLevelLookupTable) {.importcpp: "ForceBuild",
    header: "vtkWindowLevelLookupTable.h".}
proc SetWindow*(this: var vtkWindowLevelLookupTable; window: cdouble) {.
    importcpp: "SetWindow", header: "vtkWindowLevelLookupTable.h".}
## !!!Ignored construct:  virtual double GetWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Window  of  << this -> Window ) ; return this -> Window ; } ;
## Error: expected ';'!!!

proc SetLevel*(this: var vtkWindowLevelLookupTable; level: cdouble) {.
    importcpp: "SetLevel", header: "vtkWindowLevelLookupTable.h".}
## !!!Ignored construct:  virtual double GetWindowLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Level  of  << this -> Level ) ; return this -> Level ; } ;
## Error: expected ';'!!!

proc SetInverseVideo*(this: var vtkWindowLevelLookupTable; iv: vtkTypeBool) {.
    importcpp: "SetInverseVideo", header: "vtkWindowLevelLookupTable.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWindowLevelInverseVideo ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InverseVideo  of  << this -> InverseVideo ) ; return this -> InverseVideo ; } ;
## Error: expected ';'!!!

proc InverseVideoOn*(this: var vtkWindowLevelLookupTable) {.
    importcpp: "InverseVideoOn", header: "vtkWindowLevelLookupTable.h".}
proc InverseVideoOff*(this: var vtkWindowLevelLookupTable) {.
    importcpp: "InverseVideoOff", header: "vtkWindowLevelLookupTable.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the minimum table value.  All lookup table entries below the
  ##  start of the ramp will be set to this color.  After you change
  ##  this value, you must re-build the lookup table.
  ##
proc SetMinimumTableValue*(this: var vtkWindowLevelLookupTable; _arg1: cdouble;
                          _arg2: cdouble; _arg3: cdouble; _arg4: cdouble) {.
    importcpp: "SetMinimumTableValue", header: "vtkWindowLevelLookupTable.h".}
proc SetMinimumTableValue*(this: var vtkWindowLevelLookupTable;
                          _arg: array[4, cdouble]) {.
    importcpp: "SetMinimumTableValue", header: "vtkWindowLevelLookupTable.h".}
## !!!Ignored construct:  virtual double * GetMinimumTableValue ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumTableValue  pointer  << this -> MinimumTableValue ) ; return this -> MinimumTableValue ; } VTK_WRAPEXCLUDE virtual void GetMinimumTableValue ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> MinimumTableValue [ 0 ] ; _arg2 = this -> MinimumTableValue [ 1 ] ; _arg3 = this -> MinimumTableValue [ 2 ] ; _arg4 = this -> MinimumTableValue [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MinimumTableValue  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMinimumTableValue ( double _arg [ 4 ] ) { this -> GetMinimumTableValue ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetMinimumTableValueMaximumTableValue*(this: var vtkWindowLevelLookupTable;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble; _arg4: cdouble) {.
    importcpp: "SetMinimumTableValueMaximumTableValue",
    header: "vtkWindowLevelLookupTable.h".}
proc SetMinimumTableValueMaximumTableValue*(this: var vtkWindowLevelLookupTable;
    _arg: array[4, cdouble]) {.importcpp: "SetMinimumTableValueMaximumTableValue",
                            header: "vtkWindowLevelLookupTable.h".}
## !!!Ignored construct:  virtual double * GetMinimumTableValueMaximumTableValue ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumTableValue  pointer  << this -> MaximumTableValue ) ; return this -> MaximumTableValue ; } VTK_WRAPEXCLUDE virtual void GetMinimumTableValueMaximumTableValue ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> MaximumTableValue [ 0 ] ; _arg2 = this -> MaximumTableValue [ 1 ] ; _arg3 = this -> MaximumTableValue [ 2 ] ; _arg4 = this -> MaximumTableValue [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MaximumTableValue  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMinimumTableValueMaximumTableValue ( double _arg [ 4 ] ) { this -> GetMinimumTableValueMaximumTableValue ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

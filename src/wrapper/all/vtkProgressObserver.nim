## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProgressObserver.h
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
##  @class   vtkProgressObserver
##  @brief   Basic class to optionally replace vtkAlgorithm progress functionality.
##
##  When the basic functionality in vtkAlgorithm that reports progress is
##  not enough, a subclass of vtkProgressObserver can be used to provide
##  custom functionality.
##  The main use case for this is when an algorithm's RequestData() is
##  called from multiple threads in parallel - the basic functionality in
##  vtkAlgorithm is not thread safe. vtkSMPProgressObserver can
##  handle this situation by routing progress from each thread to a
##  thread local vtkProgressObserver, which will invoke events separately
##  for each thread.
##

import
  vtkCommonExecutionModelModule, vtkObject

type
  vtkProgressObserver* {.importcpp: "vtkProgressObserver",
                        header: "vtkProgressObserver.h", bycopy.} = object of vtkObject
    vtkProgressObserver* {.importc: "vtkProgressObserver".}: VTK_NEWINSTANCE


proc New*(): ptr vtkProgressObserver {.importcpp: "vtkProgressObserver::New(@)",
                                   header: "vtkProgressObserver.h".}
type
  vtkProgressObserverSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProgressObserver::IsTypeOf(@)", header: "vtkProgressObserver.h".}
proc IsA*(this: var vtkProgressObserver; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkProgressObserver.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProgressObserver {.
    importcpp: "vtkProgressObserver::SafeDownCast(@)",
    header: "vtkProgressObserver.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProgressObserver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProgressObserver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProgressObserver :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProgressObserver; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProgressObserver.h".}
proc UpdateProgress*(this: var vtkProgressObserver; amount: cdouble) {.
    importcpp: "UpdateProgress", header: "vtkProgressObserver.h".}
## !!!Ignored construct:  /@{ *
##  Returns the progress reported by the algorithm.
##  virtual double GetProgressProgress ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Progress  of  << this -> Progress ) ; return this -> Progress ; } ;
## Error: expected ';'!!!

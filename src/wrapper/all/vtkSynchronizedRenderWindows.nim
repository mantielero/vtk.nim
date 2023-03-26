## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSynchronizedRenderWindows.h
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
##  @class   vtkSynchronizedRenderWindows
##  @brief   synchronizes render windows across
##  processes.
##
##  vtkSynchronizedRenderWindows is used to synchronize render windows across
##  processes for parallel rendering.
##

import
  vtkObject, vtkRenderingParallelModule

discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkCommand"
discard "forward decl of vtkMultiProcessStream"
type
  vtkSynchronizedRenderWindows* {.importcpp: "vtkSynchronizedRenderWindows",
                                 header: "vtkSynchronizedRenderWindows.h", bycopy.} = object of vtkObject
    vtkSynchronizedRenderWindows* {.importc: "vtkSynchronizedRenderWindows".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSynchronizedRenderWindows {.
    importcpp: "vtkSynchronizedRenderWindows::New(@)",
    header: "vtkSynchronizedRenderWindows.h".}
type
  vtkSynchronizedRenderWindowsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSynchronizedRenderWindows::IsTypeOf(@)",
    header: "vtkSynchronizedRenderWindows.h".}
proc IsA*(this: var vtkSynchronizedRenderWindows; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSynchronizedRenderWindows.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSynchronizedRenderWindows {.
    importcpp: "vtkSynchronizedRenderWindows::SafeDownCast(@)",
    header: "vtkSynchronizedRenderWindows.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSynchronizedRenderWindows :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSynchronizedRenderWindows :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSynchronizedRenderWindows :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSynchronizedRenderWindows; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkSynchronizedRenderWindows.h".}
proc SetRenderWindow*(this: var vtkSynchronizedRenderWindows;
                     a2: ptr vtkRenderWindow) {.importcpp: "SetRenderWindow",
    header: "vtkSynchronizedRenderWindows.h".}
proc GetnameRenderWindow*(this: var vtkSynchronizedRenderWindows): ptr vtkRenderWindow {.
    importcpp: "GetnameRenderWindow", header: "vtkSynchronizedRenderWindows.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the parallel message communicator. This is used to communicate among
  ##  processes.
  ##
proc SetParallelController*(this: var vtkSynchronizedRenderWindows;
                           a2: ptr vtkMultiProcessController) {.
    importcpp: "SetParallelController", header: "vtkSynchronizedRenderWindows.h".}
proc GetnameRenderWindowParallelController*(
    this: var vtkSynchronizedRenderWindows): ptr vtkMultiProcessController {.
    importcpp: "GetnameRenderWindowParallelController",
    header: "vtkSynchronizedRenderWindows.h".}
  ## /@}
  ## /@{
  ## *
  ##  It's acceptable to have multiple instances on vtkSynchronizedRenderWindows
  ##  on each processes to synchronize different render windows. In that case
  ##  there's no way to each of the vtkSynchronizedRenderWindows instance to know
  ##  how they correspond across processes. To enable that identification, a
  ##  vtkSynchronizedRenderWindows can be assigned a unique id. All
  ##  vtkSynchronizedRenderWindows across different processes that have the same
  ##  id are "linked" together for synchronization. It's critical that the id is
  ##  set before any rendering happens.
  ##
proc SetIdentifier*(this: var vtkSynchronizedRenderWindows; id: cuint) {.
    importcpp: "SetIdentifier", header: "vtkSynchronizedRenderWindows.h".}
## !!!Ignored construct:  virtual unsigned int GetIdentifier ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Identifier  of  << this -> Identifier ) ; return this -> Identifier ; } ;
## Error: expected ';'!!!

proc SetParallelRendering*(this: var vtkSynchronizedRenderWindows; _arg: bool) {.
    importcpp: "SetParallelRendering", header: "vtkSynchronizedRenderWindows.h".}
## !!!Ignored construct:  virtual bool GetIdentifierParallelRendering ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParallelRendering  of  << this -> ParallelRendering ) ; return this -> ParallelRendering ; } ;
## Error: expected ';'!!!

proc ParallelRenderingOn*(this: var vtkSynchronizedRenderWindows) {.
    importcpp: "ParallelRenderingOn", header: "vtkSynchronizedRenderWindows.h".}
proc ParallelRenderingOff*(this: var vtkSynchronizedRenderWindows) {.
    importcpp: "ParallelRenderingOff", header: "vtkSynchronizedRenderWindows.h".}
  ## /@}
  ##  Turns on/off render event propagation.  When on (the default) and
  ##  ParallelRendering is on, process 0 will send an RMI call to all remote
  ##  processes to perform a synchronized render.  When off, render must be
  ##  manually called on each process.
proc SetParallelRenderingRenderEventPropagation*(
    this: var vtkSynchronizedRenderWindows; _arg: bool) {.
    importcpp: "SetParallelRenderingRenderEventPropagation",
    header: "vtkSynchronizedRenderWindows.h".}
## !!!Ignored construct:  virtual bool GetIdentifierParallelRenderingRenderEventPropagation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderEventPropagation  of  << this -> RenderEventPropagation ) ; return this -> RenderEventPropagation ; } ;
## Error: expected ';'!!!

proc RenderEventPropagationOn*(this: var vtkSynchronizedRenderWindows) {.
    importcpp: "RenderEventPropagationOn",
    header: "vtkSynchronizedRenderWindows.h".}
proc RenderEventPropagationOff*(this: var vtkSynchronizedRenderWindows) {.
    importcpp: "RenderEventPropagationOff",
    header: "vtkSynchronizedRenderWindows.h".}
  ## *
  ##  This method call be called while a render is in progress to abort the
  ##  rendering. It should be called on the root node (or client).
  ##
proc AbortRender*(this: var vtkSynchronizedRenderWindows) {.
    importcpp: "AbortRender", header: "vtkSynchronizedRenderWindows.h".}
proc SetParallelRenderingRenderEventPropagationRootProcessId*(
    this: var vtkSynchronizedRenderWindows; _arg: cint) {.
    importcpp: "SetParallelRenderingRenderEventPropagationRootProcessId",
    header: "vtkSynchronizedRenderWindows.h".}
## !!!Ignored construct:  virtual int GetIdentifierParallelRenderingRenderEventPropagationRootProcessId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RootProcessId  of  << this -> RootProcessId ) ; return this -> RootProcessId ; } ;
## Error: expected ';'!!!

const
  vtkSynchronizedRenderWindowsSYNC_RENDER_TAG* = 15001

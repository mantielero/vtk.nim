## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkObserverMediator.h
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
##  @class   vtkObserverMediator
##  @brief   manage contention for cursors and other resources
##
##  The vtkObserverMediator is a helper class that manages requests for
##  cursor changes from multiple interactor observers (e.g. widgets). It keeps
##  a list of widgets (and their priorities) and their current requests for
##  cursor shape. It then satisfies requests based on widget priority and the
##  relative importance of the request (e.g., a lower priority widget
##  requesting a particular cursor shape will overrule a higher priority
##  widget requesting a default shape).
##
##  @sa
##  vtkAbstractWidget vtkWidgetRepresentation
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of vtkInteractorObserver"
discard "forward decl of vtkObserverMap"
type
  vtkObserverMediator* {.importcpp: "vtkObserverMediator",
                        header: "vtkObserverMediator.h", bycopy.} = object of vtkObject ## *
                                                                                 ##  Instantiate the class.
                                                                                 ##
    vtkObserverMediator* {.importc: "vtkObserverMediator".}: VTK_NEWINSTANCE
    ##  A map whose key is the observer*, and whose data value is a cursor
    ##  request. Note that a special compare function is used to sort the
    ##  widgets based on the observer's priority.
    ##  given a widget*, return its data
    ##  The current observer and cursor shape


proc New*(): ptr vtkObserverMediator {.importcpp: "vtkObserverMediator::New(@)",
                                   header: "vtkObserverMediator.h".}
type
  vtkObserverMediatorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkObserverMediator::IsTypeOf(@)", header: "vtkObserverMediator.h".}
proc IsA*(this: var vtkObserverMediator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkObserverMediator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkObserverMediator {.
    importcpp: "vtkObserverMediator::SafeDownCast(@)",
    header: "vtkObserverMediator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkObserverMediator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkObserverMediator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkObserverMediator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkObserverMediator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkObserverMediator.h".}
proc SetInteractor*(this: var vtkObserverMediator;
                   iren: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkObserverMediator.h".}
proc GetnameInteractor*(this: var vtkObserverMediator): ptr vtkRenderWindowInteractor {.
    importcpp: "GetnameInteractor", header: "vtkObserverMediator.h".}
  ## /@}
  ## *
  ##  Method used to request a cursor shape. Note that the shape is specified
  ##  using one of the integral values determined in vtkRenderWindow.h. The
  ##  method returns a non-zero value if the shape was successfully changed.
  ##
proc RequestCursorShape*(this: var vtkObserverMediator;
                        a2: ptr vtkInteractorObserver; requestedShape: cint): cint {.
    importcpp: "RequestCursorShape", header: "vtkObserverMediator.h".}
proc RemoveAllCursorShapeRequests*(this: var vtkObserverMediator;
                                  a2: ptr vtkInteractorObserver) {.
    importcpp: "RemoveAllCursorShapeRequests", header: "vtkObserverMediator.h".}
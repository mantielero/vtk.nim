## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContinuousValueWidgetRepresentation.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkContinuousValueWidgetRepresentation
##  @brief   provide the representation for a continuous value
##
##  This class is used mainly as a superclass for continuous value widgets
##
##

import
  vtkDeprecation, vtkInteractionWidgetsModule, vtkWidgetRepresentation

type
  vtkContinuousValueWidgetRepresentation* {.
      importcpp: "vtkContinuousValueWidgetRepresentation",
      header: "vtkContinuousValueWidgetRepresentation.h", bycopy.} = object of vtkWidgetRepresentation ## /@{
                                                                                                ## *
                                                                                                ##  Standard methods for the class.
                                                                                                ##
    vtkContinuousValueWidgetRepresentation*
        {.importc: "vtkContinuousValueWidgetRepresentation".}: VTK_NEWINSTANCE

  vtkContinuousValueWidgetRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkContinuousValueWidgetRepresentation::IsTypeOf(@)",
    header: "vtkContinuousValueWidgetRepresentation.h".}
proc IsA*(this: var vtkContinuousValueWidgetRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkContinuousValueWidgetRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkContinuousValueWidgetRepresentation {.
    importcpp: "vtkContinuousValueWidgetRepresentation::SafeDownCast(@)",
    header: "vtkContinuousValueWidgetRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkContinuousValueWidgetRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContinuousValueWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContinuousValueWidgetRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkContinuousValueWidgetRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkContinuousValueWidgetRepresentation.h".}
proc PlaceWidget*(this: var vtkContinuousValueWidgetRepresentation;
                 bounds: array[6, cdouble]) {.importcpp: "PlaceWidget",
    header: "vtkContinuousValueWidgetRepresentation.h".}
proc BuildRepresentation*(this: var vtkContinuousValueWidgetRepresentation) {.
    importcpp: "BuildRepresentation",
    header: "vtkContinuousValueWidgetRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkContinuousValueWidgetRepresentation;
                            eventPos: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction",
    header: "vtkContinuousValueWidgetRepresentation.h".}
proc WidgetInteraction*(this: var vtkContinuousValueWidgetRepresentation;
                       eventPos: array[2, cdouble]) {.
    importcpp: "WidgetInteraction",
    header: "vtkContinuousValueWidgetRepresentation.h".}
type
  vtkContinuousValueWidgetRepresentationInteractionStateType* {.
      size: sizeof(cint), importcpp: "vtkContinuousValueWidgetRepresentation::InteractionStateType",
      header: "vtkContinuousValueWidgetRepresentation.h".} = enum
    Outside = 0, Inside, Adjusting


## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!

proc SetValue*(this: var vtkContinuousValueWidgetRepresentation; value: cdouble) {.
    importcpp: "SetValue", header: "vtkContinuousValueWidgetRepresentation.h".}
proc GetValue*(this: var vtkContinuousValueWidgetRepresentation): cdouble {.
    importcpp: "GetValue", header: "vtkContinuousValueWidgetRepresentation.h".}
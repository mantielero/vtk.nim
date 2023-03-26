## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataRepresentation.h
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
##  @class   vtkDataRepresentation
##  @brief   The superclass for all representations
##
##
##  vtkDataRepresentation the superclass for representations of data objects.
##  This class itself may be instantiated and used as a representation
##  that simply holds a connection to a pipeline.
##
##  If there are multiple representations present in a view, you should use
##  a subclass of vtkDataRepresentation.  The representation is
##  responsible for taking the input pipeline connection and converting it
##  to an object usable by a view.  In the most common case, the representation
##  will contain the pipeline necessary to convert a data object into an actor
##  or set of actors.
##
##  The representation has a concept of a selection.  If the user performs a
##  selection operation on the view, the view forwards this on to its
##  representations.  The representation is responsible for displaying that
##  selection in an appropriate way.
##
##  Representation selections may also be linked.  The representation shares
##  the selection by converting it into a view-independent format, then
##  setting the selection on its vtkAnnotationLink.  Other representations
##  sharing the same selection link instance will get the same selection
##  from the selection link when the view is updated.  The application is
##  responsible for linking representations as appropriate by setting the
##  same vtkAnnotationLink on each linked representation.
##

import
  vtkPassInputTypeAlgorithm, vtkViewsCoreModule

discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkAnnotationLayers"
discard "forward decl of vtkAnnotationLink"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkSelection"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTrivialProducer"
discard "forward decl of vtkView"
discard "forward decl of vtkViewTheme"
type
  vtkDataRepresentation* {.importcpp: "vtkDataRepresentation",
                          header: "vtkDataRepresentation.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkDataRepresentation* {.importc: "vtkDataRepresentation".}: VTK_NEWINSTANCE
    ## /@}
    ##  Whether its representation can handle a selection.
    ## *
    ##  The selection type created by the view.
    ##
    ## *
    ##  If a VALUES selection, the array names used in the selection.
    ##
    ##  ------------------------------------------------------------------------
    ##  Methods to override in subclasses
    ##  ------------------------------------------------------------------------
    ## *
    ##  Adds the representation to the view.  This is called from
    ##  vtkView::AddRepresentation().  Subclasses should override this method.
    ##  Returns true if the addition succeeds.
    ##


proc New*(): ptr vtkDataRepresentation {.importcpp: "vtkDataRepresentation::New(@)",
                                     header: "vtkDataRepresentation.h".}
type
  vtkDataRepresentationSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataRepresentation::IsTypeOf(@)",
    header: "vtkDataRepresentation.h".}
proc IsA*(this: var vtkDataRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDataRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataRepresentation {.
    importcpp: "vtkDataRepresentation::SafeDownCast(@)",
    header: "vtkDataRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataRepresentation.h".}
proc GetInputConnection*(this: var vtkDataRepresentation; port: cint = 0;
                        index: cint = 0): ptr vtkAlgorithmOutput {.
    importcpp: "GetInputConnection", header: "vtkDataRepresentation.h".}
proc GetAnnotationLink*(this: var vtkDataRepresentation): ptr vtkAnnotationLink {.
    importcpp: "GetAnnotationLink", header: "vtkDataRepresentation.h".}
proc SetAnnotationLink*(this: var vtkDataRepresentation; link: ptr vtkAnnotationLink) {.
    importcpp: "SetAnnotationLink", header: "vtkDataRepresentation.h".}
proc ApplyViewTheme*(this: var vtkDataRepresentation;
                    vtkNotUsed: proc (a1: theme): ptr vtkViewTheme) {.
    importcpp: "ApplyViewTheme", header: "vtkDataRepresentation.h".}
proc Select*(this: var vtkDataRepresentation; view: ptr vtkView;
            selection: ptr vtkSelection) {.importcpp: "Select",
                                        header: "vtkDataRepresentation.h".}
proc Select*(this: var vtkDataRepresentation; view: ptr vtkView;
            selection: ptr vtkSelection; extend: bool) {.importcpp: "Select",
    header: "vtkDataRepresentation.h".}
proc Annotate*(this: var vtkDataRepresentation; view: ptr vtkView;
              annotations: ptr vtkAnnotationLayers) {.importcpp: "Annotate",
    header: "vtkDataRepresentation.h".}
proc Annotate*(this: var vtkDataRepresentation; view: ptr vtkView;
              annotations: ptr vtkAnnotationLayers; extend: bool) {.
    importcpp: "Annotate", header: "vtkDataRepresentation.h".}
proc SetSelectable*(this: var vtkDataRepresentation; _arg: bool) {.
    importcpp: "SetSelectable", header: "vtkDataRepresentation.h".}
## !!!Ignored construct:  virtual bool GetSelectable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Selectable  of  << this -> Selectable ) ; return this -> Selectable ; } ;
## Error: expected ';'!!!

proc SelectableOn*(this: var vtkDataRepresentation) {.importcpp: "SelectableOn",
    header: "vtkDataRepresentation.h".}
proc SelectableOff*(this: var vtkDataRepresentation) {.importcpp: "SelectableOff",
    header: "vtkDataRepresentation.h".}
  ## /@}
  ## *
  ##  Updates the selection in the selection link and fires a selection
  ##  change event. Subclasses should not override this method,
  ##  but should instead override ConvertSelection.
  ##  The optional second argument specifies whether the selection should be
  ##  added to the previous selection on this representation.
  ##
proc UpdateSelection*(this: var vtkDataRepresentation; selection: ptr vtkSelection) {.
    importcpp: "UpdateSelection", header: "vtkDataRepresentation.h".}
proc UpdateSelection*(this: var vtkDataRepresentation; selection: ptr vtkSelection;
                     extend: bool) {.importcpp: "UpdateSelection",
                                   header: "vtkDataRepresentation.h".}
proc UpdateAnnotations*(this: var vtkDataRepresentation;
                       annotations: ptr vtkAnnotationLayers) {.
    importcpp: "UpdateAnnotations", header: "vtkDataRepresentation.h".}
proc UpdateAnnotations*(this: var vtkDataRepresentation;
                       annotations: ptr vtkAnnotationLayers; extend: bool) {.
    importcpp: "UpdateAnnotations", header: "vtkDataRepresentation.h".}
proc GetInternalAnnotationOutputPort*(this: var vtkDataRepresentation): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalAnnotationOutputPort",
    header: "vtkDataRepresentation.h".}
proc GetInternalAnnotationOutputPort*(this: var vtkDataRepresentation; port: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalAnnotationOutputPort",
    header: "vtkDataRepresentation.h".}
proc GetInternalAnnotationOutputPort*(this: var vtkDataRepresentation; port: cint;
                                     conn: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalAnnotationOutputPort",
    header: "vtkDataRepresentation.h".}
proc GetInternalSelectionOutputPort*(this: var vtkDataRepresentation): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalSelectionOutputPort", header: "vtkDataRepresentation.h".}
proc GetInternalSelectionOutputPort*(this: var vtkDataRepresentation; port: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalSelectionOutputPort", header: "vtkDataRepresentation.h".}
proc GetInternalSelectionOutputPort*(this: var vtkDataRepresentation; port: cint;
                                    conn: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalSelectionOutputPort", header: "vtkDataRepresentation.h".}
proc GetInternalOutputPort*(this: var vtkDataRepresentation): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalOutputPort", header: "vtkDataRepresentation.h".}
proc GetInternalOutputPort*(this: var vtkDataRepresentation; port: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalOutputPort", header: "vtkDataRepresentation.h".}
proc GetInternalOutputPort*(this: var vtkDataRepresentation; port: cint; conn: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalOutputPort", header: "vtkDataRepresentation.h".}
proc SetSelectableSelectionType*(this: var vtkDataRepresentation; _arg: cint) {.
    importcpp: "SetSelectableSelectionType", header: "vtkDataRepresentation.h".}
## !!!Ignored construct:  virtual int GetSelectableSelectionType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionType  of  << this -> SelectionType ) ; return this -> SelectionType ; } ;
## Error: expected ';'!!!

proc SetSelectionArrayNames*(this: var vtkDataRepresentation;
                            names: ptr vtkStringArray) {.
    importcpp: "SetSelectionArrayNames", header: "vtkDataRepresentation.h".}
proc GetnameSelectionArrayNames*(this: var vtkDataRepresentation): ptr vtkStringArray {.
    importcpp: "GetnameSelectionArrayNames", header: "vtkDataRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  If a VALUES selection, the array used to produce a selection.
  ##
proc SetSelectionArrayName*(this: var vtkDataRepresentation; name: cstring) {.
    importcpp: "SetSelectionArrayName", header: "vtkDataRepresentation.h".}
proc GetSelectionArrayName*(this: var vtkDataRepresentation): cstring {.
    importcpp: "GetSelectionArrayName", header: "vtkDataRepresentation.h".}
proc ConvertSelection*(this: var vtkDataRepresentation; view: ptr vtkView;
                      selection: ptr vtkSelection): ptr vtkSelection {.
    importcpp: "ConvertSelection", header: "vtkDataRepresentation.h".}
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextWidget.h
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
##  @class   vtkTextWidget
##  @brief   widget for placing text on overlay plane
##
##  This class provides support for interactively placing text on the 2D
##  overlay plane. The text is defined by an instance of vtkTextActor. It uses
##  the event bindings of its superclass (vtkBorderWidget). In addition, when
##  the text is selected, the widget emits a WidgetActivateEvent that
##  observers can watch for. This is useful for opening GUI dialogues to
##  adjust font characteristics, etc. (Please see the superclass for a
##  description of event bindings.)
##
##  @sa
##  vtkBorderWidget vtkCaptionWidget
##

## !!!Ignored construct:  # vtkTextWidget_h [NewLine] # vtkTextWidget_h [NewLine] class vtkTextRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkTextActor"
import
  vtkBorderWidget, vtkInteractionWidgetsModule

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkTextWidget : public vtkBorderWidget { public : *
##  Instantiate class.
##  static vtkTextWidget * New ( ) ; /@{ *
##  Standard VTK methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkBorderWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkBorderWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTextWidget :: IsTypeOf ( type ) ; } static vtkTextWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTextWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTextWidget * NewInstance ( ) const { return vtkTextWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Specify an instance of vtkWidgetRepresentation used to represent this
##  widget in the scene. Note that the representation is a subclass of vtkProp
##  so it can be added to the renderer independent of the widget.
##  void SetRepresentation ( vtkTextRepresentation * r ) ; /@{ *
##  Specify a vtkTextActor to manage. This is a convenient, alternative
##  method to specify the representation for the widget (i.e., used instead
##  of SetRepresentation()). It internally creates a vtkTextRepresentation
##  and then invokes vtkTextRepresentation::SetTextActor().
##  void SetTextActor ( vtkTextActor * textActor ) ; vtkTextActor * GetTextActor ( ) ; /@} *
##  Create the default widget representation if one is not set.
##  void CreateDefaultRepresentation ( ) override ; protected : vtkTextWidget ( ) ; ~ vtkTextWidget ( ) override ; private : vtkTextWidget ( const vtkTextWidget & ) = delete ; void operator = ( const vtkTextWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

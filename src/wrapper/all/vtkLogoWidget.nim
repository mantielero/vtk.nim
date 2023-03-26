## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLogoWidget.h
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
##  @class   vtkLogoWidget
##  @brief   2D widget for placing and manipulating a logo
##
##  This class provides support for interactively displaying and manipulating
##  a logo. Logos are defined by an image; this widget simply allows you to
##  interactively place and resize the image logo. To use this widget, simply
##  create a vtkLogoRepresentation (or subclass) and associate it with the
##  vtkLogoWidget.
##
##  @sa
##  vtkBorderWidget
##

## !!!Ignored construct:  # vtkLogoWidget_h [NewLine] # vtkLogoWidget_h [NewLine] # vtkBorderWidget.h [NewLine] # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkLogoRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkLogoWidget : public vtkBorderWidget { public : *
##  Instantiate this class.
##  static vtkLogoWidget * New ( ) ; /@{ *
##  Standard VTK class methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkBorderWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkBorderWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLogoWidget :: IsTypeOf ( type ) ; } static vtkLogoWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLogoWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLogoWidget * NewInstance ( ) const { return vtkLogoWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLogoWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLogoWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Specify an instance of vtkWidgetRepresentation used to represent this
##  widget in the scene. Note that the representation is a subclass of vtkProp
##  so it can be added to the renderer independent of the widget.
##  void SetRepresentation ( vtkLogoRepresentation * r ) { this -> Superclass :: SetWidgetRepresentation ( reinterpret_cast < vtkWidgetRepresentation * > ( r ) ) ; } *
##  Create the default widget representation if one is not set.
##  void CreateDefaultRepresentation ( ) override ; protected : vtkLogoWidget ( ) ; ~ vtkLogoWidget ( ) override ; private : vtkLogoWidget ( const vtkLogoWidget & ) = delete ; void operator = ( const vtkLogoWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

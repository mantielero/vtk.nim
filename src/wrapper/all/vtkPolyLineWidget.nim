## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyLineWidget.h
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
##  @class   vtkPolyLineWidget
##  @brief   widget for vtkPolyLineRepresentation.
##
##  vtkPolyLineWidget is the vtkAbstractWidget subclass for
##  vtkPolyLineRepresentation which manages the interactions with
##  vtkPolyLineRepresentation. This is based on vtkPolyLineWidget.
##
##  This widget allows the creation of a polyline interactively by adding or removing points
##  based on mouse position and a modifier key.
##
##  - ctrl+click inserts a new point on the selected line
##  - shift+click deletes the selected point
##  - alt+click adds a new point anywhere depending on last selected point.
##    If the first point is selected, the new point is added at the beginning,
##    else it is added at the end.
##
##  @sa
##  vtkPolyLineRepresentation, vtkPolyLineWidget
##

## !!!Ignored construct:  # vtkPolyLineWidget_h [NewLine] # vtkPolyLineWidget_h [NewLine] # vtkAbstractWidget.h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkPolyLineRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkPolyLineWidget : public vtkAbstractWidget { public : static vtkPolyLineWidget * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyLineWidget :: IsTypeOf ( type ) ; } static vtkPolyLineWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyLineWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyLineWidget * NewInstance ( ) const { return vtkPolyLineWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyLineWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyLineWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Specify an instance of vtkWidgetRepresentation used to represent this
##  widget in the scene. Note that the representation is a subclass of
##  vtkProp so it can be added to the renderer independent of the widget.
##  void SetRepresentation ( vtkPolyLineRepresentation * r ) { this -> Superclass :: SetWidgetRepresentation ( reinterpret_cast < vtkWidgetRepresentation * > ( r ) ) ; } *
##  Create the default widget representation if one is not set. By default,
##  this is an instance of the vtkPolyLineRepresentation class.
##  void CreateDefaultRepresentation ( ) override ; *
##  Override superclasses' SetEnabled() method because the line
##  widget must enable its internal handle widgets.
##  void SetEnabled ( int enabling ) override ; protected : vtkPolyLineWidget ( ) ; ~ vtkPolyLineWidget ( ) override ; int WidgetState ; enum WidgetStateType { Start = 0 , Active } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ; # [NewLine]  These methods handle events static void SelectAction ( vtkAbstractWidget * ) ; static void EndSelectAction ( vtkAbstractWidget * ) ; static void TranslateAction ( vtkAbstractWidget * ) ; static void ScaleAction ( vtkAbstractWidget * ) ; static void MoveAction ( vtkAbstractWidget * ) ; vtkCallbackCommand * KeyEventCallbackCommand ; static void ProcessKeyEvents ( vtkObject * , unsigned long , void * , void * ) ; private : vtkPolyLineWidget ( const vtkPolyLineWidget & ) = delete ; void operator = ( const vtkPolyLineWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

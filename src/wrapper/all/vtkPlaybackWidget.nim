## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlaybackWidget.h
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
##  @class   vtkPlaybackWidget
##  @brief   2D widget for controlling a playback stream
##
##  This class provides support for interactively controlling the playback of
##  a serial stream of information (e.g., animation sequence, video, etc.).
##  Controls for play, stop, advance one step forward, advance one step backward,
##  jump to beginning, and jump to end are available.
##
##  @sa
##  vtkBorderWidget
##

## !!!Ignored construct:  # vtkPlaybackWidget_h [NewLine] # vtkPlaybackWidget_h [NewLine] # vtkBorderWidget.h [NewLine] # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkPlaybackRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkPlaybackWidget : public vtkBorderWidget { public : *
##  Instantiate this class.
##  static vtkPlaybackWidget * New ( ) ; /@{ *
##  Standard VTK class methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkBorderWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkBorderWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPlaybackWidget :: IsTypeOf ( type ) ; } static vtkPlaybackWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPlaybackWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPlaybackWidget * NewInstance ( ) const { return vtkPlaybackWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlaybackWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlaybackWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Specify an instance of vtkPlaybackRepresentation used to represent this
##  widget in the scene. Note that the representation is a subclass of vtkProp
##  so it can be added to the renderer independent of the widget.
##  void SetRepresentation ( vtkPlaybackRepresentation * r ) { this -> Superclass :: SetWidgetRepresentation ( reinterpret_cast < vtkWidgetRepresentation * > ( r ) ) ; } *
##  Create the default widget representation if one is not set.
##  void CreateDefaultRepresentation ( ) override ; protected : vtkPlaybackWidget ( ) ; ~ vtkPlaybackWidget ( ) override ; *
##  When selecting the interior of this widget, special operations occur
##  (i.e., operating the playback controls).
##  void SelectRegion ( double eventPos [ 2 ] ) override ; private : vtkPlaybackWidget ( const vtkPlaybackWidget & ) = delete ; void operator = ( const vtkPlaybackWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

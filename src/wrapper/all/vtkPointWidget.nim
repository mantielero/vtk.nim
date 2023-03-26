## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointWidget.h
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
##  @class   vtkPointWidget
##  @brief   position a point in 3D space
##
##  This 3D widget allows the user to position a point in 3D space using a 3D
##  cursor. The cursor has an outline bounding box, axes-aligned cross-hairs,
##  and axes shadows. (The outline and shadows can be turned off.) Any of
##  these can be turned off. A nice feature of the object is that the
##  vtkPointWidget, like any 3D widget, will work with the current interactor
##  style. That is, if vtkPointWidget does not handle an event, then all other
##  registered observers (including the interactor style) have an opportunity
##  to process the event. Otherwise, the vtkPointWidget will terminate the
##  processing of the event that it handles.
##
##  To use this object, just invoke SetInteractor() with the argument of the
##  method a vtkRenderWindowInteractor.  You may also wish to invoke
##  "PlaceWidget()" to initially position the widget. The interactor will act
##  normally until the "i" key (for "interactor") is pressed, at which point
##  the vtkPointWidget will appear. (See superclass documentation for
##  information about changing this behavior.) To move the point, the user can
##  grab (left mouse) on any widget line and "slide" the point into
##  position. Scaling is achieved by using the right mouse button "up" the
##  render window (makes the widget bigger) or "down" the render window (makes
##  the widget smaller). To translate the widget use the middle mouse button.
##  (Note: all of the translation interactions can be constrained to one of
##  the x-y-z axes by using the "shift" key.) The vtkPointWidget produces as
##  output a polydata with a single point and a vertex cell.
##
##  Some additional features of this class include the ability to control the
##  rendered properties of the widget. You can set the properties of the
##  selected and unselected representations of the parts of the widget. For
##  example, you can set the property of the 3D cursor in its normal and
##  selected states.
##
##
##  The constrained translation/sliding action (i.e., when the "shift" key is
##  depressed) along the axes is based on a combination of a "hot" spot around
##  the cursor focus plus the initial mouse motion after selection. That is,
##  if the user selects an axis outside of the hot spot, then the motion is
##  constrained along that axis. If the user selects the point widget near the
##  focus (within the hot spot), the initial motion defines a vector which is
##  compared to the x-y-z axes. The motion is constrained to the axis that is
##  most parallel to the initial motion vector.
##
##
##  @sa
##  vtk3DWidget vtkLineWidget vtkBoxWidget vtkPlaneWidget
##

## !!!Ignored construct:  # vtkPointWidget_h [NewLine] # vtkPointWidget_h [NewLine] # vtk3DWidget.h [NewLine] # vtkCursor3D.h  Needed for faster access to the Cursor3D # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkProperty"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkPointWidget : public vtk3DWidget { public : *
##  Instantiate this widget
##  static vtkPointWidget * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtk3DWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtk3DWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointWidget :: IsTypeOf ( type ) ; } static vtkPointWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointWidget * NewInstance ( ) const { return vtkPointWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtk3DWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Methods that satisfy the superclass' API.
##  void SetEnabled ( int ) override ; void PlaceWidget ( double bounds [ 6 ] ) override ; void PlaceWidget ( ) override { this -> Superclass :: PlaceWidget ( ) ; } void PlaceWidget ( double xmin , double xmax , double ymin , double ymax , double zmin , double zmax ) override { this -> Superclass :: PlaceWidget ( xmin , xmax , ymin , ymax , zmin , zmax ) ; } /@} *
##  Grab the polydata (including points) that defines the point. A
##  single point and a vertex compose the vtkPolyData.
##  void GetPolyData ( vtkPolyData * pd ) ; *
##  Set/Get the position of the point. Note that if the position is set
##  outside of the bounding box, it will be clamped to the boundary of
##  the bounding box.
##  void SetPosition ( double x , double y , double z ) { this -> Cursor3D -> SetFocalPoint ( x , y , z ) ; } void SetPosition ( double x [ 3 ] ) { this -> SetPosition ( x [ 0 ] , x [ 1 ] , x [ 2 ] ) ; } double * GetPosition ( ) VTK_SIZEHINT ( 3 ) { return this -> Cursor3D -> GetFocalPoint ( ) ; } void GetPosition ( double xyz [ 3 ] ) { this -> Cursor3D -> GetFocalPoint ( xyz ) ; } *
##  Turn on/off the wireframe bounding box.
##  void SetOutline ( int o ) { this -> Cursor3D -> SetOutline ( o ) ; } int GetOutline ( ) { return this -> Cursor3D -> GetOutline ( ) ; } void OutlineOn ( ) { this -> Cursor3D -> OutlineOn ( ) ; } void OutlineOff ( ) { this -> Cursor3D -> OutlineOff ( ) ; } *
##  Turn on/off the wireframe x-shadows.
##  void SetXShadows ( int o ) { this -> Cursor3D -> SetXShadows ( o ) ; } int GetXShadows ( ) { return this -> Cursor3D -> GetXShadows ( ) ; } void XShadowsOn ( ) { this -> Cursor3D -> XShadowsOn ( ) ; } void XShadowsOff ( ) { this -> Cursor3D -> XShadowsOff ( ) ; } *
##  Turn on/off the wireframe y-shadows.
##  void SetYShadows ( int o ) { this -> Cursor3D -> SetYShadows ( o ) ; } int GetYShadows ( ) { return this -> Cursor3D -> GetYShadows ( ) ; } void YShadowsOn ( ) { this -> Cursor3D -> YShadowsOn ( ) ; } void YShadowsOff ( ) { this -> Cursor3D -> YShadowsOff ( ) ; } *
##  Turn on/off the wireframe z-shadows.
##  void SetZShadows ( int o ) { this -> Cursor3D -> SetZShadows ( o ) ; } int GetZShadows ( ) { return this -> Cursor3D -> GetZShadows ( ) ; } void ZShadowsOn ( ) { this -> Cursor3D -> ZShadowsOn ( ) ; } void ZShadowsOff ( ) { this -> Cursor3D -> ZShadowsOff ( ) ; } *
##  If translation mode is on, as the widget is moved the bounding box,
##  shadows, and cursor are all translated simultaneously as the point
##  moves.
##  void SetTranslationMode ( int mode ) { this -> Cursor3D -> SetTranslationMode ( mode ) ; this -> Cursor3D -> Update ( ) ; } int GetTranslationMode ( ) { return this -> Cursor3D -> GetTranslationMode ( ) ; } void TranslationModeOn ( ) { this -> SetTranslationMode ( 1 ) ; } void TranslationModeOff ( ) { this -> SetTranslationMode ( 0 ) ; } /@{ *
##  Convenience methods to turn outline and shadows on and off.
##  void AllOn ( ) { this -> OutlineOn ( ) ; this -> XShadowsOn ( ) ; this -> YShadowsOn ( ) ; this -> ZShadowsOn ( ) ; } void AllOff ( ) { this -> OutlineOff ( ) ; this -> XShadowsOff ( ) ; this -> YShadowsOff ( ) ; this -> ZShadowsOff ( ) ; } /@} /@{ *
##  Get the handle properties (the little balls are the handles). The
##  properties of the handles when selected and normal can be
##  set.
##  virtual vtkProperty * GetnameProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Property  address  << static_cast < vtkProperty * > ( this -> Property ) ) ; return this -> Property ; } ; virtual vtkProperty * GetnamePropertySelectedProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedProperty  address  << static_cast < vtkProperty * > ( this -> SelectedProperty ) ) ; return this -> SelectedProperty ; } ; /@} /@{ *
##  Set the "hot spot" size; i.e., the region around the focus, in which the
##  motion vector is used to control the constrained sliding action. Note the
##  size is specified as a fraction of the length of the diagonal of the
##  point widget's bounding box.
##  virtual void SetHotSpotSize ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << HotSpotSize  to  << _arg ) ; if ( this -> HotSpotSize != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> HotSpotSize = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetHotSpotSizeMinValue ( ) { return 0.0 ; } virtual double GetHotSpotSizeMaxValue ( ) { return 1.0 ; } ; virtual double GetHotSpotSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HotSpotSize  of  << this -> HotSpotSize ) ; return this -> HotSpotSize ; } ; /@} protected : vtkPointWidget ( ) ; ~ vtkPointWidget ( ) override ;  Manage the state of the widget friend class vtkLineWidget ; int State ; enum WidgetState { Start = 0 , Moving , Scaling , Translating , Outside } ;  Handles the events static void ProcessEvents ( vtkObject * object , unsigned long event , void * clientdata , void * calldata ) ;  ProcessEvents() dispatches to these methods. virtual void OnMouseMove ( ) ; virtual void OnLeftButtonDown ( ) ; virtual void OnLeftButtonUp ( ) ; virtual void OnMiddleButtonDown ( ) ; virtual void OnMiddleButtonUp ( ) ; virtual void OnRightButtonDown ( ) ; virtual void OnRightButtonUp ( ) ;  the cursor3D vtkActor * Actor ; vtkPolyDataMapper * Mapper ; vtkCursor3D * Cursor3D ; void Highlight ( int highlight ) ;  Do the picking vtkCellPicker * CursorPicker ;  Register internal Pickers within PickingManager void RegisterPickers ( ) override ;  Methods to manipulate the cursor int ConstraintAxis ; void Translate ( double * p1 , double * p2 ) ; void Scale ( double * p1 , double * p2 , int X , int Y ) ; void MoveFocus ( double * p1 , double * p2 ) ; int TranslationMode ;  Properties used to control the appearance of selected objects and
##  the manipulator in general. vtkProperty * Property ; vtkProperty * SelectedProperty ; void CreateDefaultProperties ( ) ;  The size of the hot spot. double HotSpotSize ; int DetermineConstraintAxis ( int constraint , double * x ) ; int WaitingForMotion ; int WaitCount ; private : vtkPointWidget ( const vtkPointWidget & ) = delete ; void operator = ( const vtkPointWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

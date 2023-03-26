## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkControlPointsItem.h
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
##  @class   vtkControlPointsItem
##  @brief   Abstract class for control points items.
##
##  vtkControlPointsItem provides control point painting and management for
##  subclasses that provide points (typically control points of a transfer
##  function)
##  @sa
##  vtkScalarsToColorsItem
##  vtkPiecewiseControlPointsItem
##

## !!!Ignored construct:  # vtkControlPointsItem_h [NewLine] # vtkControlPointsItem_h [NewLine] # vtkPlot.h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkCommand.h  For vtkCommand enum # vtkSmartPointer.h  For SmartPointer # vtkVector.h  For vtkVector2f # < string >  Used by GetControlPointLabel [NewLine] class vtkCallbackCommand ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkContext2D"
discard "forward decl of vtkControlPointsAddPointItem"
discard "forward decl of vtkPiecewisePointHandleItem"
discard "forward decl of vtkPoints2D"
discard "forward decl of vtkTransform2D"
## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkControlPointsItem : public vtkPlot { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPlot Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPlot :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkControlPointsItem :: IsTypeOf ( type ) ; } static vtkControlPointsItem * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkControlPointsItem * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkControlPointsItem * NewInstance ( ) const { return vtkControlPointsItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkControlPointsItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkControlPointsItem :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Events fires by this class (and subclasses).
##  \li CurrentPointChangedEvent is fired when the current point index is changed.
##  \li CurrentPointEditEvent is fired to request the application to show UI to
##  edit the current point.
##  \li vtkCommand::StartEvent and vtkCommand::EndEvent is fired
##  to mark groups of changes to control points. enum { CurrentPointChangedEvent = vtkCommand :: UserEvent , CurrentPointEditEvent } ; *
##  Bounds of the item, typically the bound of all the control points
##  except if custom bounds have been set \sa SetUserBounds.
##  void GetBounds ( double bounds [ 4 ] ) override ; /@{ *
##  Set custom bounds, except if bounds are invalid, bounds will be
##  automatically computed based on the range of the control points
##  Invalid bounds by default.
##  virtual void SetUserBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << UserBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> UserBounds [ 0 ] != _arg1 ) || ( this -> UserBounds [ 1 ] != _arg2 ) || ( this -> UserBounds [ 2 ] != _arg3 ) || ( this -> UserBounds [ 3 ] != _arg4 ) ) { this -> UserBounds [ 0 ] = _arg1 ; this -> UserBounds [ 1 ] = _arg2 ; this -> UserBounds [ 2 ] = _arg3 ; this -> UserBounds [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetUserBounds ( const double _arg [ 4 ] ) { this -> SetUserBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetUserBounds ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << UserBounds  pointer  << this -> UserBounds ) ; return this -> UserBounds ; } VTK_WRAPEXCLUDE virtual void GetUserBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> UserBounds [ 0 ] ; _arg2 = this -> UserBounds [ 1 ] ; _arg3 = this -> UserBounds [ 2 ] ; _arg4 = this -> UserBounds [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << UserBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetUserBounds ( double _arg [ 4 ] ) { this -> GetUserBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} /@{ *
##  Controls the valid range for the values.
##  An invalid value (0, -1, 0., -1, 0, -1.) indicates that the valid
##  range is the current bounds. It is the default behavior.
##  virtual void SetUserBoundsValidBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ValidBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> ValidBounds [ 0 ] != _arg1 ) || ( this -> ValidBounds [ 1 ] != _arg2 ) || ( this -> ValidBounds [ 2 ] != _arg3 ) || ( this -> ValidBounds [ 3 ] != _arg4 ) ) { this -> ValidBounds [ 0 ] = _arg1 ; this -> ValidBounds [ 1 ] = _arg2 ; this -> ValidBounds [ 2 ] = _arg3 ; this -> ValidBounds [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetUserBoundsValidBounds ( const double _arg [ 4 ] ) { this -> SetUserBoundsValidBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetUserBoundsValidBounds ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ValidBounds  pointer  << this -> ValidBounds ) ; return this -> ValidBounds ; } VTK_WRAPEXCLUDE virtual void GetUserBoundsValidBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> ValidBounds [ 0 ] ; _arg2 = this -> ValidBounds [ 1 ] ; _arg3 = this -> ValidBounds [ 2 ] ; _arg4 = this -> ValidBounds [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ValidBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetUserBoundsValidBounds ( double _arg [ 4 ] ) { this -> GetUserBoundsValidBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} /@{ *
##  Get/set the radius for screen points.
##  Default is 6.f
##  virtual float GetScreenPointRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScreenPointRadius  of  << this -> ScreenPointRadius ) ; return this -> ScreenPointRadius ; } ; virtual void SetScreenPointRadius ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScreenPointRadius  to  << _arg ) ; if ( this -> ScreenPointRadius != _arg ) { this -> ScreenPointRadius = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get/Set the flag to draw points.
##  Default is true.
##  virtual bool GetScreenPointRadiusDrawPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawPoints  of  << this -> DrawPoints ) ; return this -> DrawPoints ; } ; virtual void SetScreenPointRadiusDrawPoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DrawPoints  to  << _arg ) ; if ( this -> DrawPoints != _arg ) { this -> DrawPoints = _arg ; this -> Modified ( ) ; } } ; virtual void DrawPointsOn ( ) { this -> SetDrawPoints ( static_cast < bool > ( 1 ) ) ; } virtual void DrawPointsOff ( ) { this -> SetDrawPoints ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Paint the points with a fixed size (cosmetic) which doesn't depend
##  on the scene zoom factor. Selected and unselected points are drawn
##  with a different color.
##  bool Paint ( vtkContext2D * painter ) override ; *
##  Select a point by its ID
##  void SelectPoint ( vtkIdType pointId ) ; *
##  Utility function that selects a point providing its coordinates.
##  To be found, the position of the point must be no further away than its
##  painted point size
##  void SelectPoint ( double * currentPoint ) ; *
##  Select all the points
##  void SelectAllPoints ( ) ; *
##  Unselect a point by its ID
##  void DeselectPoint ( vtkIdType pointId ) ; *
##  Utility function that unselects a point providing its coordinates.
##  To be found, the position of the point must be no further away than its
##  painted point size
##  void DeselectPoint ( double * currentPoint ) ; *
##  Unselect all the previously selected points
##  void DeselectAllPoints ( ) ; *
##  Toggle the selection of a point by its ID. If the point was selected then
##  unselect it, otherwise select it.
##  void ToggleSelectPoint ( vtkIdType pointId ) ; *
##  Utility function that toggles the selection a point providing its
##  coordinates. To be found, the position of the point must be no further
##  away than its painted point size
##  void ToggleSelectPoint ( double * currentPoint ) ; *
##  Select all points in the specified rectangle.
##  bool SelectPoints ( const vtkVector2f & min , const vtkVector2f & max ) override ; *
##  Return the number of selected points.
##  vtkIdType GetNumberOfSelectedPoints ( ) const ; *
##  Returns the vtkIdType of the point given its coordinates and a tolerance
##  based on the screen point size.
##  vtkIdType FindPoint ( double * pos ) ; *
##  Returns true if pos is above the pointId point, false otherwise.
##  It uses the size of the drawn point. To search what point is under the pos,
##  use the more efficient \sa FindPoint() instead.
##  bool IsOverPoint ( double * pos , vtkIdType pointId ) ; *
##  Returns the id of the control point exactly matching pos, -1 if not found.
##  vtkIdType GetControlPointId ( double * pos ) ; *
##  Utility function that returns an array of all the control points IDs
##  Typically: [0, 1, 2, ... n -1] where n is the point count
##  Can exclude the first and last point ids from the array.
##  void GetControlPointsIds ( vtkIdTypeArray * ids , bool excludeFirstAndLast = false ) const ; /@{ *
##  Controls whether or not control points are drawn (true) or clicked and
##  moved (false).
##  False by default.
##  virtual void SetScreenPointRadiusDrawPointsStrokeMode ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StrokeMode  to  << _arg ) ; if ( this -> StrokeMode != _arg ) { this -> StrokeMode = _arg ; this -> Modified ( ) ; } } ; virtual bool GetScreenPointRadiusDrawPointsStrokeMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StrokeMode  of  << this -> StrokeMode ) ; return this -> StrokeMode ; } ; /@} /@{ *
##  If DrawPoints is false, SwitchPoints controls the behavior when a control
##  point is dragged past another point. The crossed point becomes current
##  (true) or the current point is blocked/stopped (false).
##  False by default.
##  virtual void SetScreenPointRadiusDrawPointsStrokeModeSwitchPointsMode ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SwitchPointsMode  to  << _arg ) ; if ( this -> SwitchPointsMode != _arg ) { this -> SwitchPointsMode = _arg ; this -> Modified ( ) ; } } ; virtual bool GetScreenPointRadiusDrawPointsStrokeModeSwitchPointsMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SwitchPointsMode  of  << this -> SwitchPointsMode ) ; return this -> SwitchPointsMode ; } ; /@} /@{ *
##  If EndPointsMovable is false, the two end points will not
##  be moved. True by default.
##  virtual void SetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovable ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EndPointsXMovable  to  << _arg ) ; if ( this -> EndPointsXMovable != _arg ) { this -> EndPointsXMovable = _arg ; this -> Modified ( ) ; } } ; virtual bool GetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndPointsXMovable  of  << this -> EndPointsXMovable ) ; return this -> EndPointsXMovable ; } ; virtual void SetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovableEndPointsYMovable ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EndPointsYMovable  to  << _arg ) ; if ( this -> EndPointsYMovable != _arg ) { this -> EndPointsYMovable = _arg ; this -> Modified ( ) ; } } ; virtual bool GetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovableEndPointsYMovable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndPointsYMovable  of  << this -> EndPointsYMovable ) ; return this -> EndPointsYMovable ; } ; virtual bool GetEndPointsMovable ( ) ; /@} /@{ *
##  If EndPointsRemovable is false, the two end points will not
##  be removed. True by default.
##  virtual void SetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovableEndPointsYMovableEndPointsRemovable ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EndPointsRemovable  to  << _arg ) ; if ( this -> EndPointsRemovable != _arg ) { this -> EndPointsRemovable = _arg ; this -> Modified ( ) ; } } ; virtual bool GetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovableEndPointsYMovableEndPointsRemovable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndPointsRemovable  of  << this -> EndPointsRemovable ) ; return this -> EndPointsRemovable ; } ; /@} /@{ *
##  When set to true, labels are shown on the current control point and the end
##  points. Default is false.
##  virtual void SetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovableEndPointsYMovableEndPointsRemovableShowLabels ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ShowLabels  to  << _arg ) ; if ( this -> ShowLabels != _arg ) { this -> ShowLabels = _arg ; this -> Modified ( ) ; } } ; virtual bool GetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovableEndPointsYMovableEndPointsRemovableShowLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowLabels  of  << this -> ShowLabels ) ; return this -> ShowLabels ; } ; /@} /@{ *
##  Get/Set the label format. Default is "%.4f, %.4f".
##  virtual void SetLabelFormat ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LabelFormat  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LabelFormat == nullptr && _arg == nullptr ) { return ; } if ( this -> LabelFormat && _arg && ( ! strcmp ( this -> LabelFormat , _arg ) ) ) { return ; } delete [ ] this -> LabelFormat ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LabelFormat = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LabelFormat = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetLabelFormat ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << LabelFormat  of  << ( this -> LabelFormat ? this -> LabelFormat : (null) ) ) ; return this -> LabelFormat ; } ; /@} *
##  Add a point to the function. Returns the index of the point (0 based),
##  or -1 on error.
##  Subclasses should reimplement this function to do the actual work.
##  virtual vtkIdType AddPoint ( double * newPos ) = 0 ; *
##  Remove a point of the function. Returns the index of the point (0 based),
##  or -1 on error.
##  Subclasses should reimplement this function to do the actual work.
##  virtual vtkIdType RemovePoint ( double * pos ) = 0 ; *
##  Remove a point give its id. It is a utility function that internally call
##  the virtual method RemovePoint(double*) and return its result.
##  vtkIdType RemovePoint ( vtkIdType pointId ) ; *
##  Remove the current point.
##  void RemoveCurrentPoint ( ) ; *
##  Returns the total number of points
##  virtual vtkIdType GetNumberOfPoints ( ) const = 0 ; *
##  Returns the x and y coordinates as well as the midpoint and sharpness
##  of the control point corresponding to the index.
##  point must be a double array of size 4.
##  virtual void GetControlPoint ( vtkIdType index , double * point ) const = 0 ; *
##  Sets the x and y coordinates as well as the midpoint and sharpness
##  of the control point corresponding to the index.
##  virtual void SetControlPoint ( vtkIdType index , double * point ) = 0 ; *
##  Move the points referred by pointIds by a given translation.
##  The new positions won't be outside the bounds.
##  MovePoints is typically called with GetControlPointsIds() or GetSelection().
##  Warning: if you pass this->GetSelection(), the array is deleted after
##  each individual point move. Increase the reference count of the array.
##  See also MoveAllPoints()
##  void MovePoints ( const vtkVector2f & translation , vtkIdTypeArray * pointIds ) ; *
##  Utility function to move all the control points of the given translation
##  If dontMoveFirstAndLast is true, then the first and last points won't be
##  moved.
##  void MovePoints ( const vtkVector2f & translation , bool dontMoveFirstAndLast = false ) ; *
##  Spread the points referred by pointIds
##  If factor > 0, points are moved away from each other.
##  If factor < 0, points are moved closer to each other
##  SpreadPoints is typically called with GetControlPointsIds() or GetSelection().
##  Warning: if you pass this->GetSelection(), the array is deleted after
##  each individual point move. Increase the reference count of the array.
##  void SpreadPoints ( float factor , vtkIdTypeArray * pointIds ) ; *
##  Utility function to spread all the control points of a given factor
##  If dontSpreadFirstAndLast is true, then the first and last points won't be
##  spread.
##  void SpreadPoints ( float factor , bool dontSpreadFirstAndLast = false ) ; *
##  Returns the current point ID selected or -1 if there is no point current.
##  No current point by default.
##  vtkIdType GetCurrentPoint ( ) const ; *
##  Sets the current point selected.
##  void SetCurrentPoint ( vtkIdType index ) ; /@{ *
##  Gets the selected point pen and brush.
##  virtual vtkPen * GetnameSelectedPointPen ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedPointPen  address  << static_cast < vtkPen * > ( this -> SelectedPointPen ) ) ; return this -> SelectedPointPen ; } ; /@} /@{ *
##  Depending on the control points item, the brush might not be taken into
##  account.
##  virtual vtkBrush * GetnameSelectedPointPenSelectedPointBrush ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedPointBrush  address  << static_cast < vtkBrush * > ( this -> SelectedPointBrush ) ) ; return this -> SelectedPointBrush ; } ; /@} /@{ *
##  When enabled, a dedicated item is used to determine if a point should
##  be added when clicking anywhere.
##  This item can be recovered with GetAddPointItem and can this be placed
##  below all other items. False by default.
##  virtual bool GetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovableEndPointsYMovableEndPointsRemovableShowLabelsUseAddPointItem ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseAddPointItem  of  << this -> UseAddPointItem ) ; return this -> UseAddPointItem ; } ; virtual void SetScreenPointRadiusDrawPointsStrokeModeSwitchPointsModeEndPointsXMovableEndPointsYMovableEndPointsRemovableShowLabelsUseAddPointItem ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseAddPointItem  to  << _arg ) ; if ( this -> UseAddPointItem != _arg ) { this -> UseAddPointItem = _arg ; this -> Modified ( ) ; } } ; virtual void UseAddPointItemOn ( ) { this -> SetDrawPointsUseAddPointItem ( static_cast < bool > ( 1 ) ) ; } virtual void UseAddPointItemOff ( ) { this -> SetDrawPointsUseAddPointItem ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Item dedicated to add point, to be added below all other items.
##  Used only if UseAddPointItem is set to true.
##  vtkPlot * GetAddPointItem ( ) ; *
##  Recompute the bounds next time they are requested.
##  You shouldn't have to call it but it is provided for rare cases.
##  void ResetBounds ( ) ; /@{ *
##  Mouse and key events.
##  bool MouseButtonPressEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseDoubleClickEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseButtonReleaseEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseMoveEvent ( const vtkContextMouseEvent & mouse ) override ; bool KeyPressEvent ( const vtkContextKeyEvent & key ) override ; bool KeyReleaseEvent ( const vtkContextKeyEvent & key ) override ; /@} protected : vtkControlPointsItem ( ) ; ~ vtkControlPointsItem ( ) override ; friend class vtkPiecewisePointHandleItem ; void StartChanges ( ) ; void EndChanges ( ) ; void StartInteraction ( ) ; void StartInteractionIfNotStarted ( ) ; void Interaction ( ) ; void EndInteraction ( ) ; int GetInteractionsCount ( ) const ; virtual void emitEvent ( unsigned long event , void * params = nullptr ) = 0 ; static void CallComputePoints ( vtkObject * sender , unsigned long event , void * receiver , void * params ) ; /@{ *
##  Must be reimplemented by subclasses to calculate the points to draw.
##  It's subclass responsibility to call ComputePoints() via the callback
##  virtual void ComputePoints ( ) ; virtual vtkMTimeType GetControlPointsMTime ( ) = 0 ; /@} *
##  Returns true if the supplied x, y are within the bounds or on a control point.
##  If UseAddPointItem is true,
##  returns true only if the supplied x, y are on a control point.
##  bool Hit ( const vtkContextMouseEvent & mouse ) override ; /@{ *
##  Clamp the given 2D pos into the bounds of the function.
##  Return true if the pos has been clamped, false otherwise.
##  bool ClampValidDataPos ( double pos [ 2 ] ) ; bool ClampValidScreenPos ( double pos [ 2 ] ) ; /@} /@{ *
##  Internal function that paints a collection of points and optionally
##  excludes some.
##  void DrawUnselectedPoints ( vtkContext2D * painter ) ; void DrawSelectedPoints ( vtkContext2D * painter ) ; virtual void DrawPoint ( vtkContext2D * painter , vtkIdType index ) ; /@} void SetCurrentPointPos ( const vtkVector2f & newPos ) ; vtkIdType SetPointPos ( vtkIdType point , const vtkVector2f & newPos ) ; void MoveCurrentPoint ( const vtkVector2f & translation ) ; vtkIdType MovePoint ( vtkIdType point , const vtkVector2f & translation ) ; vtkVector2f GetSelectionCenterOfMass ( ) const ; vtkVector2f GetCenterOfMass ( vtkIdTypeArray * pointIDs ) const ; void Stroke ( const vtkVector2f & newPos ) ; virtual void EditPoint ( float vtkNotUsed ( tX ) , float vtkNotUsed ( tY ) ) ; *
##  Generate label for a control point.
##  virtual std :: string GetControlPointLabel ( vtkIdType index ) ; void AddPointId ( vtkIdType addedPointId ) ; *
##  Return true if any of the end points is current point
##  or part of the selection
##  bool IsEndPointPicked ( ) ; *
##  Return true if the point is removable
##  bool IsPointRemovable ( vtkIdType pointId ) ; *
##  Compute the bounds for this item. Typically, the bounds should be aligned
##  to the range of the vtkScalarsToColors or vtkPiecewiseFunction that is
##  being controlled by the subclasses.
##  Default implementation uses the range of the control points themselves.
##  virtual void ComputeBounds ( double * bounds ) ; vtkNew < vtkCallbackCommand > Callback ; vtkNew < vtkPen > SelectedPointPen ; vtkNew < vtkBrush > SelectedPointBrush ; int BlockUpdates = 0 ; int StartedInteractions = 0 ; int StartedChanges = 0 ; vtkIdType CurrentPoint = - 1 ; double Bounds [ 4 ] = { 0.0 , - 1.0 , 0.0 , - 1.0 } ; double UserBounds [ 4 ] = { 0.0 , - 1.0 , 0.0 , - 1.0 } ; double ValidBounds [ 4 ] = { 0.0 , - 1.0 , 0.0 , - 1.0 } ; vtkNew < vtkTransform2D > ControlPointsTransform ; float ScreenPointRadius = 6.f ; bool DrawPoints = true ; bool StrokeMode = false ; bool SwitchPointsMode = false ; bool MouseMoved = false ; bool EnforceValidFunction = true ; vtkIdType PointToDelete = - 1 ; bool PointAboutToBeDeleted = false ; vtkIdType PointToToggle = - 1 ; bool PointAboutToBeToggled = false ; bool InvertShadow = false ; bool EndPointsXMovable = true ; bool EndPointsYMovable = true ; bool EndPointsRemovable = true ; bool ShowLabels = false ; char * LabelFormat = nullptr ; private : vtkControlPointsItem ( const vtkControlPointsItem & ) = delete ; void operator = ( const vtkControlPointsItem & ) = delete ; void ComputeBounds ( ) ; vtkIdType RemovePointId ( vtkIdType removedPointId ) ; bool UseAddPointItem = false ; vtkNew < vtkControlPointsAddPointItem > AddPointItem ; } ;
## Error: token expected: ; but got: [identifier]!!!

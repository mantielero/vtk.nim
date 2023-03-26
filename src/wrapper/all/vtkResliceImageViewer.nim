## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceImageViewer.h
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
##  @class   vtkResliceImageViewer
##  @brief   Display an image along with a reslice cursor
##
##  This class is similar to vtkImageViewer2. It displays the image along with
##  a two cross hairs for reslicing. The cross hairs may be interactively
##  manipulated and are typically used to reslice two other views of
##  vtkResliceImageViewer. See QtVTKRenderWindows for an example. The reslice
##  cursor is used to perform thin or thick MPR through data. The class can
##  also default to the behaviour of vtkImageViewer2 if the Reslice mode is
##  set to RESLICE_AXIS_ALIGNED.
##  @sa
##  vtkResliceCursor vtkResliceCursorWidget vtkResliceCursorRepresentation
##

## !!!Ignored construct:  # vtkResliceImageViewer_h [NewLine] # vtkResliceImageViewer_h [NewLine] # vtkImageViewer2.h [NewLine] # vtkInteractionImageModule.h  For export macro [NewLine] class vtkResliceCursorWidget ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkResliceCursor"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkBoundedPlanePointPlacer"
discard "forward decl of vtkResliceImageViewerMeasurements"
discard "forward decl of vtkResliceImageViewerScrollCallback"
discard "forward decl of vtkPlane"
## !!!Ignored construct:  class VTKINTERACTIONIMAGE_EXPORT vtkResliceImageViewer : public vtkImageViewer2 { public : /@{ *
##  Standard VTK methods.
##  static vtkResliceImageViewer * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageViewer2 Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageViewer2 :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkResliceImageViewer :: IsTypeOf ( type ) ; } static vtkResliceImageViewer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkResliceImageViewer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkResliceImageViewer * NewInstance ( ) const { return vtkResliceImageViewer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageViewer2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceImageViewer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceImageViewer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Render the resulting image.
##  void Render ( ) override ; /@{ *
##  Set/Get the input image to the viewer.
##  void SetInputData ( vtkImageData * in ) override ; void SetInputConnection ( vtkAlgorithmOutput * input ) override ; /@} /@{ *
##  Set window and level for mapping pixels to colors.
##  void SetColorWindow ( double s ) override ; void SetColorLevel ( double s ) override ; /@} /@{ *
##  Get the internal render window, renderer, image actor, and
##  image map instances.
##  virtual vtkResliceCursorWidget * GetnameResliceCursorWidget ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ResliceCursorWidget  address  << static_cast < vtkResliceCursorWidget * > ( this -> ResliceCursorWidget ) ) ; return this -> ResliceCursorWidget ; } ; /@} *
##  Set/get the slice orientation
##  enum { RESLICE_AXIS_ALIGNED = 0 , RESLICE_OBLIQUE = 1 } ; virtual int GetResliceMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResliceMode  of  << this -> ResliceMode ) ; return this -> ResliceMode ; } ; virtual void SetResliceMode ( int resliceMode ) ; virtual void SetResliceModeToAxisAligned ( ) { this -> SetResliceMode ( vtkResliceImageViewer :: RESLICE_AXIS_ALIGNED ) ; } virtual void SetResliceModeToOblique ( ) { this -> SetResliceMode ( vtkResliceImageViewer :: RESLICE_OBLIQUE ) ; } /@{ *
##  Set/Get the reslice cursor.
##  vtkResliceCursor * GetResliceCursor ( ) ; void SetResliceCursor ( vtkResliceCursor * rc ) ; /@} /@{ *
##  Set the lookup table
##  virtual void SetLookupTable ( vtkScalarsToColors * ) ; vtkScalarsToColors * GetLookupTable ( ) ; /@} /@{ *
##  Switch to / from thick mode
##  virtual void SetThickMode ( int ) ; virtual int GetThickMode ( ) ; /@} *
##  Reset all views back to initial state
##  virtual void Reset ( ) ; /@{ *
##  Get the point placer.
##  virtual vtkBoundedPlanePointPlacer * GetnameResliceCursorWidgetPointPlacer ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PointPlacer  address  << static_cast < vtkBoundedPlanePointPlacer * > ( this -> PointPlacer ) ) ; return this -> PointPlacer ; } ; /@} /@{ *
##  Get the measurements manager
##  virtual vtkResliceImageViewerMeasurements * GetnameResliceCursorWidgetPointPlacerMeasurements ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Measurements  address  << static_cast < vtkResliceImageViewerMeasurements * > ( this -> Measurements ) ) ; return this -> Measurements ; } ; /@} /@{ *
##  Get the render window interactor
##  virtual vtkRenderWindowInteractor * GetnameResliceCursorWidgetPointPlacerMeasurementsInteractor ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Interactor  address  << static_cast < vtkRenderWindowInteractor * > ( this -> Interactor ) ) ; return this -> Interactor ; } ; /@} /@{ *
##  Scroll slices on the mouse wheel ? In the case of MPR
##  view, it moves one "normalized spacing" in the direction of the normal to
##  the resliced plane, provided the new center will continue to lie within
##  the volume.
##  virtual void SetSliceScrollOnMouseWheel ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SliceScrollOnMouseWheel  to  << _arg ) ; if ( this -> SliceScrollOnMouseWheel != _arg ) { this -> SliceScrollOnMouseWheel = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetResliceModeSliceScrollOnMouseWheel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SliceScrollOnMouseWheel  of  << this -> SliceScrollOnMouseWheel ) ; return this -> SliceScrollOnMouseWheel ; } ; virtual void SliceScrollOnMouseWheelOn ( ) { this -> SetSliceScrollOnMouseWheel ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SliceScrollOnMouseWheelOff ( ) { this -> SetSliceScrollOnMouseWheel ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} @{ *
##  Define a factor that will be applied in addition to the inter slice spacing when scrolling
##  image. When the view is in axis aligned ResliceMode, and the factor is not an integer,
##  then the new value of the slice will be rounded. Otherwise, the factor is applied
##  normally. Default value is 1.0.
##  Note that in axis aligned ResliceMode, the factor is applied in local coordinate (i, j, k),
##  whereas in oblique ResliceMode, the factor is applied in world coordinate (x, y, z)
##  virtual void SetSliceScrollOnMouseWheelSliceScrollFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SliceScrollFactor  to  << _arg ) ; if ( this -> SliceScrollFactor != _arg ) { this -> SliceScrollFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetResliceModeSliceScrollOnMouseWheelSliceScrollFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SliceScrollFactor  of  << this -> SliceScrollFactor ) ; return this -> SliceScrollFactor ; } ; @} *
##  Increment/Decrement slice by 'inc' slices
##  virtual void IncrementSlice ( int inc ) ; enum { SliceChangedEvent = 1001 } ; protected : vtkResliceImageViewer ( ) ; ~ vtkResliceImageViewer ( ) override ; void InstallPipeline ( ) override ; void UnInstallPipeline ( ) override ; void UpdateOrientation ( ) override ; void UpdateDisplayExtent ( ) override ; virtual void UpdatePointPlacer ( ) ; /@{ *
##  Convenience methods to get the reslice plane and the normalized
##  spacing between slices in reslice mode.
##  vtkPlane * GetReslicePlane ( ) ; double GetInterSliceSpacingInResliceMode ( ) ; /@} vtkResliceCursorWidget * ResliceCursorWidget ; vtkBoundedPlanePointPlacer * PointPlacer ; int ResliceMode ; vtkResliceImageViewerMeasurements * Measurements ; vtkTypeBool SliceScrollOnMouseWheel ; vtkResliceImageViewerScrollCallback * ScrollCallback ; double SliceScrollFactor = 1.0 ; private : vtkResliceImageViewer ( const vtkResliceImageViewer & ) = delete ; void operator = ( const vtkResliceImageViewer & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceCursorLineRepresentation.h
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
##  @class   vtkResliceCursorLineRepresentation
##  @brief   represent the vtkResliceCursorWidget
##
##  This class provides a representation for the reslice cursor widget. It
##  consists of two cross sectional hairs, with an optional thickness. The
##  hairs may have a hole in the center. These may be translated or rotated
##  independent of each other in the view. The result is used to reslice
##  the data along these cross sections. This allows the user to perform
##  multi-planar thin or thick reformat of the data on an image view, rather
##  than a 3D view.
##  @sa
##  vtkResliceCursorWidget vtkResliceCursor vtkResliceCursorPolyDataAlgorithm
##  vtkResliceCursorRepresentation vtkResliceCursorThickLineRepresentation
##  vtkResliceCursorActor vtkImagePlaneWidget
##

## !!!Ignored construct:  # vtkResliceCursorLineRepresentation_h [NewLine] # vtkResliceCursorLineRepresentation_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkResliceCursorRepresentation.h [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkResliceCursorActor"
discard "forward decl of vtkResliceCursorPolyDataAlgorithm"
discard "forward decl of vtkResliceCursorPicker"
discard "forward decl of vtkResliceCursor"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkResliceCursorLineRepresentation : public vtkResliceCursorRepresentation { public : *
##  Instantiate the class.
##  static vtkResliceCursorLineRepresentation * New ( ) ; /@{ *
##  Standard VTK methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkResliceCursorRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkResliceCursorRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkResliceCursorLineRepresentation :: IsTypeOf ( type ) ; } static vtkResliceCursorLineRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkResliceCursorLineRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkResliceCursorLineRepresentation * NewInstance ( ) const { return vtkResliceCursorLineRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkResliceCursorRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceCursorLineRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceCursorLineRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  These are methods that satisfy vtkWidgetRepresentation's API.
##  void BuildRepresentation ( ) override ; int ComputeInteractionState ( int X , int Y , int modify = 0 ) override ; void StartWidgetInteraction ( double startEventPos [ 2 ] ) override ; void WidgetInteraction ( double e [ 2 ] ) override ; void Highlight ( int highlightOn ) override ; /@} /@{ *
##  Methods required by vtkProp superclass.
##  void ReleaseGraphicsResources ( vtkWindow * w ) override ; int RenderOverlay ( vtkViewport * viewport ) override ; int RenderOpaqueGeometry ( vtkViewport * viewport ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * viewport ) override ; vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; /@} *
##  Get the bounds of this prop. This simply returns the bounds of the
##  reslice cursor object.
##  double * GetBounds ( ) override ; /@{ *
##  Get the reslice cursor actor. You must set the reslice cursor on this
##  class
##  virtual vtkResliceCursorActor * GetnameResliceCursorActor ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ResliceCursorActor  address  << static_cast < vtkResliceCursorActor * > ( this -> ResliceCursorActor ) ) ; return this -> ResliceCursorActor ; } ; /@} *
##  Get the reslice cursor.
##  vtkResliceCursor * GetResliceCursor ( ) override ; *
##  Set the user matrix on all the internal actors.
##  virtual void SetUserMatrix ( vtkMatrix4x4 * matrix ) ; *
##  Re-implemented to set the tolerance of the picker.
##  void SetTolerance ( int t ) override ; protected : vtkResliceCursorLineRepresentation ( ) ; ~ vtkResliceCursorLineRepresentation ( ) override ; vtkResliceCursorPolyDataAlgorithm * GetCursorAlgorithm ( ) override ; double RotateAxis ( double evenPos [ 2 ] , int axis ) ; double TranslateAxis ( double evenPos [ 2 ] , int axis ) ; void RotateAxis ( int axis , double angle ) ; void RotateVectorAboutVector ( double vectorToBeRotated [ 3 ] , double axis [ 3 ] ,  vector about which we rotate double angle ,  angle in radians double o [ 3 ] ) ; int DisplayToReslicePlaneIntersection ( double displayPos [ 2 ] , double intersectionPos [ 3 ] ) ; void ApplyTolerance ( ) ; vtkResliceCursorActor * ResliceCursorActor ; vtkResliceCursorPicker * Picker ; double StartPickPosition [ 3 ] ; double StartCenterPosition [ 3 ] ;  Transformation matrices. These have no offset. Offset is recomputed
##  based on the cursor, so that the center of the cursor has the same
##  location in transformed space as it does in physical space. vtkMatrix4x4 * MatrixReslice ; vtkMatrix4x4 * MatrixView ; vtkMatrix4x4 * MatrixReslicedView ; private : vtkResliceCursorLineRepresentation ( const vtkResliceCursorLineRepresentation & ) = delete ; void operator = ( const vtkResliceCursorLineRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

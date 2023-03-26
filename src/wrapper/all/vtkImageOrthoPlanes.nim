## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageOrthoPlanes.h
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
##  @class   vtkImageOrthoPlanes
##  @brief   Connect three vtkImagePlaneWidgets together
##
##  vtkImageOrthoPlanes is an event observer class that listens to the
##  events from three vtkImagePlaneWidgets and keeps their orientations
##  and scales synchronized.
##  @sa
##  vtkImagePlaneWidget
##  @par Thanks:
##  Thanks to Atamai Inc. for developing and contributing this class.
##

## !!!Ignored construct:  # vtkImageOrthoPlanes_h [NewLine] # vtkImageOrthoPlanes_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkObject.h [NewLine] class vtkImagePlaneWidget ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkTransform"
discard "forward decl of vtkMatrix4x4"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkImageOrthoPlanes : public vtkObject { public : static vtkImageOrthoPlanes * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageOrthoPlanes :: IsTypeOf ( type ) ; } static vtkImageOrthoPlanes * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageOrthoPlanes * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageOrthoPlanes * NewInstance ( ) const { return vtkImageOrthoPlanes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageOrthoPlanes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageOrthoPlanes :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  You must set three planes for the widget.
##  void SetPlane ( int i , vtkImagePlaneWidget * imagePlaneWidget ) ; vtkImagePlaneWidget * GetPlane ( int i ) ; /@} *
##  Reset the planes to original scale, rotation, and location.
##  void ResetPlanes ( ) ; *
##  Get the transform for the planes.
##  vtkTransform * GetTransform ( ) { return this -> Transform ; } *
##  A public method to be used only by the event callback.
##  void HandlePlaneEvent ( vtkImagePlaneWidget * imagePlaneWidget ) ; protected : vtkImageOrthoPlanes ( ) ; ~ vtkImageOrthoPlanes ( ) override ; void HandlePlaneRotation ( vtkImagePlaneWidget * imagePlaneWidget , int indexOfModifiedPlane ) ; void HandlePlanePush ( vtkImagePlaneWidget * imagePlaneWidget , int indexOfModifiedPlane ) ; void HandlePlaneTranslate ( vtkImagePlaneWidget * imagePlaneWidget , int indexOfModifiedPlane ) ; void HandlePlaneScale ( vtkImagePlaneWidget * imagePlaneWidget , int indexOfModifiedPlane ) ; void SetTransformMatrix ( vtkMatrix4x4 * matrix , vtkImagePlaneWidget * currentImagePlane , int indexOfModifiedPlane ) ; void GetBounds ( double bounds [ 3 ] ) ;  The plane definitions prior to any rotations or scales double Origin [ 3 ] [ 3 ] ; double Point1 [ 3 ] [ 3 ] ; double Point2 [ 3 ] [ 3 ] ;  The current position and orientation of the bounding box with
##  respect to the origin. vtkTransform * Transform ;  An array to hold the planes vtkImagePlaneWidget * * Planes ;  The number of planes. int NumberOfPlanes ;  The observer tags for these planes long * ObserverTags ; private : vtkImageOrthoPlanes ( const vtkImageOrthoPlanes & ) = delete ; void operator = ( const vtkImageOrthoPlanes & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

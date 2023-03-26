## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFocalPlaneContourRepresentation.h
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
##  @class   vtkFocalPlaneContourRepresentation
##  @brief   represent a contour drawn on the
##  focal plane.
##
##
##  The contour will stay on the focal plane irrespective of camera
##  position/orientation changes. The class was written in order to be able to
##  draw contours on a volume widget and have the contours overlaid on the
##  focal plane in order to do contour segmentation. The superclass,
##  vtkContourRepresentation handles contours that are drawn in actual world
##  position co-ordinates, so they would rotate with the camera position/
##  orientation changes
##
##  @sa
##  vtkContourWidget vtkHandleRepresentation vtkContourRepresentation
##

## !!!Ignored construct:  # vtkFocalPlaneContourRepresentation_h [NewLine] # vtkFocalPlaneContourRepresentation_h [NewLine] # vtkContourRepresentation.h [NewLine] # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkHandleRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkFocalPlaneContourRepresentation : public vtkContourRepresentation { public : /@{ *
##  Standard VTK methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkContourRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkContourRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFocalPlaneContourRepresentation :: IsTypeOf ( type ) ; } static vtkFocalPlaneContourRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFocalPlaneContourRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFocalPlaneContourRepresentation * NewInstance ( ) const { return vtkFocalPlaneContourRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContourRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFocalPlaneContourRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFocalPlaneContourRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Get the world position of the intermediate point at
##  index idx between nodes n and (n+1) (or n and 0 if
##  n is the last node and the loop is closed). Returns
##  1 on success or 0 if n or idx are out of range.
##  int GetIntermediatePointWorldPosition ( int n , int idx , double point [ 3 ] ) override ; *
##  Get the world position of the intermediate point at
##  index idx between nodes n and (n+1) (or n and 0 if
##  n is the last node and the loop is closed). Returns
##  1 on success or 0 if n or idx are out of range.
##  virtual int GetIntermediatePointDisplayPosition ( int n , int idx , double point [ 3 ] ) ; *
##  Get the nth node's display position. Will return
##  1 on success, or 0 if there are not at least
##  (n+1) nodes (0 based counting).
##  int GetNthNodeDisplayPosition ( int n , double pos [ 2 ] ) override ; *
##  Get the nth node's world position. Will return
##  1 on success, or 0 if there are not at least
##  (n+1) nodes (0 based counting).
##  int GetNthNodeWorldPosition ( int n , double pos [ 3 ] ) override ; *
##  The class maintains its true contour locations based on display co-ords
##  This method syncs the world co-ords data structure with the display co-ords.
##  virtual void UpdateContourWorldPositionsBasedOnDisplayPositions ( ) ; *
##  The method must be called whenever the contour needs to be updated, usually
##  from RenderOpaqueGeometry()
##  int UpdateContour ( ) override ; void UpdateLines ( int index ) override ; protected : vtkFocalPlaneContourRepresentation ( ) ; ~ vtkFocalPlaneContourRepresentation ( ) override ; private : vtkFocalPlaneContourRepresentation ( const vtkFocalPlaneContourRepresentation & ) = delete ; void operator = ( const vtkFocalPlaneContourRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

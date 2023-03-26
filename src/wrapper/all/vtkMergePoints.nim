## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergePoints.h
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
##  @class   vtkMergePoints
##  @brief   merge exactly coincident points
##
##  vtkMergePoints is a locator object to quickly locate points in 3D.
##  The primary difference between vtkMergePoints and its superclass
##  vtkPointLocator is that vtkMergePoints merges precisely coincident points
##  and is therefore much faster.
##  @sa
##  vtkCleanPolyData
##

## !!!Ignored construct:  # vtkMergePoints_h [NewLine] # vtkMergePoints_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkPointLocator.h [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkMergePoints : public vtkPointLocator { public : static vtkMergePoints * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointLocator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointLocator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMergePoints :: IsTypeOf ( type ) ; } static vtkMergePoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMergePoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMergePoints * NewInstance ( ) const { return vtkMergePoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergePoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergePoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Determine whether point given by x[3] has been inserted into points list.
##  Return id of previously inserted point if this is true, otherwise return
##  -1.
##  vtkIdType IsInsertedPoint ( const double x [ 3 ] ) override ; vtkIdType IsInsertedPoint ( double x , double y , double z ) override { return this -> vtkPointLocator :: IsInsertedPoint ( x , y , z ) ; } /@} *
##  Determine whether point given by x[3] has been inserted into points list.
##  Return 0 if point was already in the list, otherwise return 1. If the
##  point was not in the list, it will be ADDED.  In either case, the id of
##  the point (newly inserted or not) is returned in the ptId argument.
##  Note this combines the functionality of IsInsertedPoint() followed
##  by a call to InsertNextPoint().
##  int InsertUniquePoint ( const double x [ 3 ] , vtkIdType & ptId ) override ; protected : vtkMergePoints ( ) = default ; ~ vtkMergePoints ( ) override = default ; private : vtkMergePoints ( const vtkMergePoints & ) = delete ; void operator = ( const vtkMergePoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNonMergingPointLocator.h
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
##  @class   vtkNonMergingPointLocator
##  @brief   direct / check-free point insertion.
##
##
##   As a special sub-class of vtkPointLocator, vtkNonMergingPointLocator is
##   intended for direct / check-free insertion of points into a vtkPoints
##   object. In other words, any given point is always directly inserted.
##   The name emphasizes the difference between this class and its sibling
##   class vtkMergePoints in that the latter class performs check-based zero
##   tolerance point insertion (or to 'merge' exactly duplicate / coincident
##   points) by exploiting the uniform bin mechanism employed by the parent
##   class vtkPointLocator. vtkPointLocator allows for generic (zero and non-
##   zero) tolerance point insertion as well as point location.
##
##  @sa
##   vtkIncrementalPointLocator vtkPointLocator vtkMergePoints
##

## !!!Ignored construct:  # vtkNonMergingPointLocator_h [NewLine] # vtkNonMergingPointLocator_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkPointLocator.h [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkNonMergingPointLocator : public vtkPointLocator { public : static vtkNonMergingPointLocator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointLocator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointLocator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkNonMergingPointLocator :: IsTypeOf ( type ) ; } static vtkNonMergingPointLocator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkNonMergingPointLocator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkNonMergingPointLocator * NewInstance ( ) const { return vtkNonMergingPointLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNonMergingPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNonMergingPointLocator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Determine whether a given point x has been inserted into the points list.
##  Return the id of the already inserted point if it is true, or -1 else.
##  Note this function always returns -1 since any point is always inserted.
##  vtkIdType IsInsertedPoint ( const double [ 3 ] ) override { return - 1 ; } vtkIdType IsInsertedPoint ( double , double , double ) override { return - 1 ; } *
##  Determine whether a given point x has been inserted into the points list.
##  Return 0 if a duplicate has been inserted in the list, or 1 else. Note
##  this function always returns 1 since any point is always inserted. The
##  index of the point is returned via ptId.
##  int InsertUniquePoint ( const double x [ 3 ] , vtkIdType & ptId ) override ; protected : vtkNonMergingPointLocator ( ) = default ; ~ vtkNonMergingPointLocator ( ) override = default ; private : vtkNonMergingPointLocator ( const vtkNonMergingPointLocator & ) = delete ; void operator = ( const vtkNonMergingPointLocator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkKdTreePointLocator.h
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
##  @class   vtkKdTreePointLocator
##  @brief   class to quickly locate points in 3-space
##
##  vtkKdTreePointLocator is a wrapper class that derives from
##  vtkAbstractPointLocator and calls the search functions in vtkKdTree.
##
##  @sa
##  vtkKdTree
##

## !!!Ignored construct:  # vtkKdTreePointLocator_h [NewLine] # vtkKdTreePointLocator_h [NewLine] # vtkAbstractPointLocator.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkKdTree"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkKdTreePointLocator : public vtkAbstractPointLocator { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractPointLocator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractPointLocator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkKdTreePointLocator :: IsTypeOf ( type ) ; } static vtkKdTreePointLocator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkKdTreePointLocator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkKdTreePointLocator * NewInstance ( ) const { return vtkKdTreePointLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkKdTreePointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkKdTreePointLocator :: New ( ) ; } public : ; static vtkKdTreePointLocator * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Given a position x, return the id of the point closest to it. Alternative
##  method requires separate x-y-z values.
##  These methods are thread safe if BuildLocator() is directly or
##  indirectly called from a single thread first.
##  vtkIdType FindClosestPoint ( const double x [ 3 ] ) override ; *
##  Given a position x and a radius r, return the id of the point
##  closest to the point in that radius.
##  dist2 returns the squared distance to the point.
##  vtkIdType FindClosestPointWithinRadius ( double radius , const double x [ 3 ] , double & dist2 ) override ; *
##  Find the closest N points to a position. This returns the closest
##  N points to a position. A faster method could be created that returned
##  N close points to a position, but necessarily the exact N closest.
##  The returned points are sorted from closest to farthest.
##  These methods are thread safe if BuildLocator() is directly or
##  indirectly called from a single thread first.
##  void FindClosestNPoints ( int N , const double x [ 3 ] , vtkIdList * result ) override ; *
##  Find all points within a specified radius R of position x.
##  The result is not sorted in any specific manner.
##  These methods are thread safe if BuildLocator() is directly or
##  indirectly called from a single thread first.
##  void FindPointsWithinRadius ( double R , const double x [ 3 ] , vtkIdList * result ) override ; /@{ *
##  See vtkLocator interface documentation.
##  These methods are not thread safe.
##  void FreeSearchStructure ( ) override ; void BuildLocator ( ) override ; void ForceBuildLocator ( ) override ; void GenerateRepresentation ( int level , vtkPolyData * pd ) override ; /@} protected : vtkKdTreePointLocator ( ) ; ~ vtkKdTreePointLocator ( ) override ; void BuildLocatorInternal ( ) override ; vtkKdTree * KdTree ; private : vtkKdTreePointLocator ( const vtkKdTreePointLocator & ) = delete ; void operator = ( const vtkKdTreePointLocator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

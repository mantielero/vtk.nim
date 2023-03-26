## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHierarchicalDataSetGeometryFilter.h
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
##  @class   vtkHierarchicalDataSetGeometryFilter
##  @brief   extract geometry from hierarchical data
##
##  Legacy class. Use vtkCompositeDataGeometryFilter instead.
##
##  @sa
##  vtkCompositeDataGeometryFilter
##

## !!!Ignored construct:  # vtkHierarchicalDataSetGeometryFilter_h [NewLine] # vtkHierarchicalDataSetGeometryFilter_h [NewLine] # vtkCompositeDataGeometryFilter.h [NewLine] # vtkFiltersGeometryModule.h  For export macro [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGEOMETRY_EXPORT vtkHierarchicalDataSetGeometryFilter : public vtkCompositeDataGeometryFilter { public : static vtkHierarchicalDataSetGeometryFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCompositeDataGeometryFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCompositeDataGeometryFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHierarchicalDataSetGeometryFilter :: IsTypeOf ( type ) ; } static vtkHierarchicalDataSetGeometryFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHierarchicalDataSetGeometryFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHierarchicalDataSetGeometryFilter * NewInstance ( ) const { return vtkHierarchicalDataSetGeometryFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeDataGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalDataSetGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalDataSetGeometryFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkHierarchicalDataSetGeometryFilter ( ) ; ~ vtkHierarchicalDataSetGeometryFilter ( ) override ; private : vtkHierarchicalDataSetGeometryFilter ( const vtkHierarchicalDataSetGeometryFilter & ) = delete ; void operator = ( const vtkHierarchicalDataSetGeometryFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

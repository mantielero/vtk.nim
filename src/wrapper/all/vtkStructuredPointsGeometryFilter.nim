## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredPointsGeometryFilter.h
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
##  @class   vtkStructuredPointsGeometryFilter
##  @brief   obsolete class
##
##  vtkStructuredPointsGeometryFilter has been renamed to
##  vtkImageDataGeometryFilter
##

## !!!Ignored construct:  # vtkStructuredPointsGeometryFilter_h [NewLine] # vtkStructuredPointsGeometryFilter_h [NewLine] # vtkFiltersGeometryModule.h  For export macro # vtkImageDataGeometryFilter.h [NewLine] class VTKFILTERSGEOMETRY_EXPORT vtkStructuredPointsGeometryFilter : public vtkImageDataGeometryFilter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageDataGeometryFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageDataGeometryFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkStructuredPointsGeometryFilter :: IsTypeOf ( type ) ; } static vtkStructuredPointsGeometryFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkStructuredPointsGeometryFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkStructuredPointsGeometryFilter * NewInstance ( ) const { return vtkStructuredPointsGeometryFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageDataGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredPointsGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredPointsGeometryFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with initial extent of all the data
##  static vtkStructuredPointsGeometryFilter * New ( ) ; protected : vtkStructuredPointsGeometryFilter ( ) ; ~ vtkStructuredPointsGeometryFilter ( ) override = default ; private : vtkStructuredPointsGeometryFilter ( const vtkStructuredPointsGeometryFilter & ) = delete ; void operator = ( const vtkStructuredPointsGeometryFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

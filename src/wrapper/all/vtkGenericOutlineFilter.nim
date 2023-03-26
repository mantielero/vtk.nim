## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericOutlineFilter.h
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
##  @class   vtkGenericOutlineFilter
##  @brief   create wireframe outline for arbitrary
##  generic data set
##
##
##  vtkGenericOutlineFilter is a filter that generates a wireframe outline of
##  any generic data set. The outline consists of the twelve edges of the
##  generic dataset bounding box.
##
##  @sa
##  vtkGenericDataSet
##

## !!!Ignored construct:  # vtkGenericOutlineFilter_h [NewLine] # vtkGenericOutlineFilter_h [NewLine] # vtkFiltersGenericModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkOutlineSource ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERIC_EXPORT vtkGenericOutlineFilter : public vtkPolyDataAlgorithm { public : static vtkGenericOutlineFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGenericOutlineFilter :: IsTypeOf ( type ) ; } static vtkGenericOutlineFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGenericOutlineFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGenericOutlineFilter * NewInstance ( ) const { return vtkGenericOutlineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericOutlineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericOutlineFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkGenericOutlineFilter ( ) ; ~ vtkGenericOutlineFilter ( ) override ; vtkOutlineSource * OutlineSource ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkGenericOutlineFilter ( const vtkGenericOutlineFilter & ) = delete ; void operator = ( const vtkGenericOutlineFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

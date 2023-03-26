## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPassThroughFilter.h
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
##  @class   vtkPassThroughFilter
##  @brief   Filter which shallow copies it's input to it's output
##
##  This filter shallow copies it's input to it's output. It is normally
##  used by PVSources with multiple outputs as the VTK filter in the
##  dummy connection objects at each output.
##

## !!!Ignored construct:  # vtkPassThroughFilter_h [NewLine] # vtkPassThroughFilter_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkFiltersParallelModule.h  For export macro [NewLine] class vtkFieldData ;
## Error: expected ';'!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Use vtkPassThrough instead. ) class vtkPassThroughFilter : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPassThroughFilter :: IsTypeOf ( type ) ; } static vtkPassThroughFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPassThroughFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPassThroughFilter * NewInstance ( ) const { return vtkPassThroughFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPassThroughFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPassThroughFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Create a new vtkPassThroughFilter.
##  static vtkPassThroughFilter * New ( ) ; protected : vtkPassThroughFilter ( ) ; ~ vtkPassThroughFilter ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkPassThroughFilter ( const vtkPassThroughFilter & ) = delete ; void operator = ( const vtkPassThroughFilter & ) = delete ; } ;
## Error: expected ';'!!!

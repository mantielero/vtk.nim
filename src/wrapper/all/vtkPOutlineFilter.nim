## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPOutlineFilter.h
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
##  @class   vtkPOutlineFilter
##  @brief   create wireframe outline for arbitrary data set
##
##  vtkPOutlineFilter works like vtkOutlineFilter, but it looks for data
##  partitions in other processes.  It assumes the filter is operated
##  in a data parallel pipeline.
##

## !!!Ignored construct:  # vtkPOutlineFilter_h [NewLine] # vtkPOutlineFilter_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkOutlineSource ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkPOutlineFilter : public vtkPolyDataAlgorithm { public : static vtkPOutlineFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPOutlineFilter :: IsTypeOf ( type ) ; } static vtkPOutlineFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPOutlineFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPOutlineFilter * NewInstance ( ) const { return vtkPOutlineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPOutlineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPOutlineFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set and get the controller.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkPOutlineFilter ( ) ; ~ vtkPOutlineFilter ( ) override ; vtkMultiProcessController * Controller ; vtkOutlineSource * OutlineSource ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPOutlineFilter ( const vtkPOutlineFilter & ) = delete ; void operator = ( const vtkPOutlineFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

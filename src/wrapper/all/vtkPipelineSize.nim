## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPipelineSize.h
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
##  @class   vtkPipelineSize
##  @brief   compute the memory required by a pipeline
##

## !!!Ignored construct:  # vtkPipelineSize_h [NewLine] # vtkPipelineSize_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkObject.h [NewLine] class vtkAlgorithm ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkPipelineSize : public vtkObject { public : static vtkPipelineSize * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPipelineSize :: IsTypeOf ( type ) ; } static vtkPipelineSize * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPipelineSize * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPipelineSize * NewInstance ( ) const { return vtkPipelineSize :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPipelineSize :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPipelineSize :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Compute an estimate of how much memory a pipline will require in
##  kibibytes (1024 bytes) This is only an estimate and the
##  calculations in here do not take into account the specifics of many
##  sources and filters.
##  unsigned long GetEstimatedSize ( vtkAlgorithm * input , int inputPort , int connection ) ; *
##  Determine how many subpieces a mapper should use to fit a target memory
##  limit. The piece and numPieces can be queried from the mapper using
##  `vtkPolyDataMapper::GetPiece` and
##  `vtkPolyDataMapper::GetNumberOfSubPieces`.
##  unsigned long GetNumberOfSubPieces ( unsigned long memoryLimit , vtkAlgorithm * mapper , int piece , int numPieces ) ; protected : vtkPipelineSize ( ) = default ; void GenericComputeSourcePipelineSize ( vtkAlgorithm * src , int outputPort , unsigned long size [ 3 ] ) ; void ComputeSourcePipelineSize ( vtkAlgorithm * src , int outputPort , unsigned long size [ 3 ] ) ; void ComputeOutputMemorySize ( vtkAlgorithm * src , int outputPort , unsigned long * inputSize , unsigned long size [ 2 ] ) ; void GenericComputeOutputMemorySize ( vtkAlgorithm * src , int outputPort , unsigned long * inputSize , unsigned long size [ 2 ] ) ; private : vtkPipelineSize ( const vtkPipelineSize & ) = delete ; void operator = ( const vtkPipelineSize & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

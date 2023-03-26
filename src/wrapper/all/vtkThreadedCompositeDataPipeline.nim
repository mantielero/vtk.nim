## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkThreadedCompositeDataPipeline.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   =========================================================================
## *
##  @class   vtkThreadedCompositeDataPipeline
##  @brief   Executive that works in parallel
##
##  vtkThreadedCompositeDataPipeline processes a composite data object in
##  parallel using the SMP framework. It does this by creating a vector of
##  data objects (the pieces of the composite data) and processing them
##  using vtkSMPTools::For. Note that this requires that the
##  algorithm implement all pipeline passes in a re-entrant way. It should
##  store/retrieve all state changes using input and output information
##  objects, which are unique to each thread.
##

## !!!Ignored construct:  # vtkThreadedCompositeDataPipeline_h [NewLine] # vtkThreadedCompositeDataPipeline_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkCompositeDataPipeline.h [NewLine] class vtkInformationVector ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformation"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkThreadedCompositeDataPipeline : public vtkCompositeDataPipeline { public : static vtkThreadedCompositeDataPipeline * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCompositeDataPipeline Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCompositeDataPipeline :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkThreadedCompositeDataPipeline :: IsTypeOf ( type ) ; } static vtkThreadedCompositeDataPipeline * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkThreadedCompositeDataPipeline * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkThreadedCompositeDataPipeline * NewInstance ( ) const { return vtkThreadedCompositeDataPipeline :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeDataPipeline :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkThreadedCompositeDataPipeline :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkThreadedCompositeDataPipeline :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  An API to CallAlgorithm that allows you to pass in the info objects to
##  be used
##  int CallAlgorithm ( vtkInformation * request , int direction , vtkInformationVector * * inInfo , vtkInformationVector * outInfo ) override ; protected : vtkThreadedCompositeDataPipeline ( ) ; ~ vtkThreadedCompositeDataPipeline ( ) override ; void ExecuteEach ( vtkCompositeDataIterator * iter , vtkInformationVector * * inInfoVec , vtkInformationVector * outInfoVec , int compositePort , int connection , vtkInformation * request , std :: vector < vtkSmartPointer < vtkCompositeDataSet >> & compositeOutput ) override ; private : vtkThreadedCompositeDataPipeline ( const vtkThreadedCompositeDataPipeline & ) = delete ; void operator = ( const vtkThreadedCompositeDataPipeline & ) = delete ; friend class ProcessBlock ; } ;
## Error: token expected: ; but got: [identifier]!!!

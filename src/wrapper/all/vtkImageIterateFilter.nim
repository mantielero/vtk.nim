## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageIterateFilter.h
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
##  @class   vtkImageIterateFilter
##  @brief   Multiple executes per update.
##
##  vtkImageIterateFilter is a filter superclass that supports calling execute
##  multiple times per update.  The largest hack/open issue is that the input
##  and output caches are temporarily changed to "fool" the subclasses.  I
##  believe the correct solution is to pass the in and out cache to the
##  subclasses methods as arguments.  Now the data is passes.  Can the caches
##  be passed, and data retrieved from the cache?
##

## !!!Ignored construct:  # vtkImageIterateFilter_h [NewLine] # vtkImageIterateFilter_h [NewLine] # vtkImagingCoreModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageIterateFilter : public vtkThreadedImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageIterateFilter :: IsTypeOf ( type ) ; } static vtkImageIterateFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageIterateFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageIterateFilter * NewInstance ( ) const { return vtkImageIterateFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageIterateFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageIterateFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get which iteration is current being performed. Normally the
##  user will not access this method.
##  virtual int GetIteration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Iteration  of  << this -> Iteration ) ; return this -> Iteration ; } ; virtual int GetIterationNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIterations  of  << this -> NumberOfIterations ) ; return this -> NumberOfIterations ; } ; /@} protected : vtkImageIterateFilter ( ) ; ~ vtkImageIterateFilter ( ) override ;  Implement standard requests by calling iterative versions the
##  specified number of times. int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;  Iterative versions of standard requests.  These are given the
##  pipeline information object for the in/out pair at each
##  iteration. virtual int IterativeRequestInformation ( vtkInformation * in , vtkInformation * out ) ; virtual int IterativeRequestUpdateExtent ( vtkInformation * in , vtkInformation * out ) ; virtual int IterativeRequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; virtual void SetNumberOfIterations ( int num ) ;  for filters that execute multiple times. int NumberOfIterations ; int Iteration ;  A list of intermediate caches that is created when
##  is called SetNumberOfIterations() vtkAlgorithm * * IterationData ; vtkInformationVector * InputVector ; vtkInformationVector * OutputVector ; private : vtkImageIterateFilter ( const vtkImageIterateFilter & ) = delete ; void operator = ( const vtkImageIterateFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

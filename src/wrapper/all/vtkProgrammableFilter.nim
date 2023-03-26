## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProgrammableFilter.h
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
##  @class   vtkProgrammableFilter
##  @brief   a user-programmable filter
##
##  vtkProgrammableFilter is a filter that can be programmed by the user.  To
##  use the filter you define a function that retrieves input of the correct
##  type, creates data, and then manipulates the output of the filter.  Using
##  this filter avoids the need for subclassing - and the function can be
##  defined in an interpreter wrapper language such as Java.
##
##  The trickiest part of using this filter is that the input and output
##  methods are unusual and cannot be compile-time type checked. Instead, as a
##  user of this filter it is your responsibility to set and get the correct
##  input and output types.
##
##  @warning
##  The filter correctly manages modified time and network execution in most
##  cases. However, if you change the definition of the filter function,
##  you'll want to send a manual Modified() method to the filter to force it
##  to reexecute.
##
##  @sa
##  vtkProgrammablePointDataFilter vtkProgrammableSource
##

## !!!Ignored construct:  # vtkProgrammableFilter_h [NewLine] # vtkProgrammableFilter_h [NewLine] # vtkFiltersProgrammableModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class VTKFILTERSPROGRAMMABLE_EXPORT vtkProgrammableFilter : public vtkPassInputTypeAlgorithm { public : static vtkProgrammableFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProgrammableFilter :: IsTypeOf ( type ) ; } static vtkProgrammableFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProgrammableFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProgrammableFilter * NewInstance ( ) const { return vtkProgrammableFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProgrammableFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProgrammableFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Signature definition for programmable method callbacks. Methods passed to
##  SetExecuteMethod or SetExecuteMethodArgDelete must conform to this
##  signature.
##  The presence of this typedef is useful for reference and for external
##  analysis tools, but it cannot be used in the method signatures in these
##  header files themselves because it prevents the internal VTK wrapper
##  generators from wrapping these methods.
##  typedef void ( * ProgrammableMethodCallbackType ) ( void * arg ) ; *
##  Specify the function to use to operate on the point attribute data. Note
##  that the function takes a single (void *) argument.
##  void SetExecuteMethod ( void ( * f ) ( void * ) , void * arg ) ; *
##  Set the arg delete method. This is used to free user memory.
##  void SetExecuteMethodArgDelete ( void ( * f ) ( void * ) ) ; /@{ *
##  Get the input as a concrete type. This method is typically used by the
##  writer of the filter function to get the input as a particular type (i.e.,
##  it essentially does type casting). It is the users responsibility to know
##  the correct type of the input data.
##  vtkPolyData * GetPolyDataInput ( ) ; vtkStructuredPoints * GetStructuredPointsInput ( ) ; vtkStructuredGrid * GetStructuredGridInput ( ) ; vtkUnstructuredGrid * GetUnstructuredGridInput ( ) ; vtkRectilinearGrid * GetRectilinearGridInput ( ) ; vtkGraph * GetGraphInput ( ) ; vtkMolecule * GetMoleculeInput ( ) ; vtkTable * GetTableInput ( ) ; vtkHyperTreeGrid * GetHyperTreeGridInput ( ) ; /@} /@{ *
##  When CopyArrays is true, all arrays are copied to the output
##  iff input and output are of the same type. False by default.
##  virtual void SetCopyArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CopyArrays  to  << _arg ) ; if ( this -> CopyArrays != _arg ) { this -> CopyArrays = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCopyArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CopyArrays  of  << this -> CopyArrays ) ; return this -> CopyArrays ; } ; virtual void CopyArraysOn ( ) { this -> SetCopyArrays ( static_cast < bool > ( 1 ) ) ; } virtual void CopyArraysOff ( ) { this -> SetCopyArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkProgrammableFilter ( ) ; ~ vtkProgrammableFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; ProgrammableMethodCallbackType ExecuteMethod ;  function to invoke ProgrammableMethodCallbackType ExecuteMethodArgDelete ; void * ExecuteMethodArg ; bool CopyArrays ; private : vtkProgrammableFilter ( const vtkProgrammableFilter & ) = delete ; void operator = ( const vtkProgrammableFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

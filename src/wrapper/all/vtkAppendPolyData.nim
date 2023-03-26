## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAppendPolyData.h
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
##  @class   vtkAppendPolyData
##  @brief   appends one or more polygonal datasets together
##
##
##  vtkAppendPolyData is a filter that appends one of more polygonal datasets
##  into a single polygonal dataset. All geometry is extracted and appended,
##  but point and cell attributes (i.e., scalars, vectors, normals) are
##  extracted and appended only if all datasets have the point and/or cell
##  attributes available.  (For example, if one dataset has point scalars but
##  another does not, point scalars will not be appended.)
##
##  @warning
##  The related filter vtkRemovePolyData enables the subtraction, or removal
##  of the cells of a vtkPolyData. Hence vtkRemovePolyData functions like the
##  inverse operation to vtkAppendPolyData.
##
##  @sa
##  vtkAppendFilter vtkRemovePolyData
##

## !!!Ignored construct:  # vtkAppendPolyData_h [NewLine] # vtkAppendPolyData_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkAppendPolyData : public vtkPolyDataAlgorithm { public : static vtkAppendPolyData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAppendPolyData :: IsTypeOf ( type ) ; } static vtkAppendPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAppendPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAppendPolyData * NewInstance ( ) const { return vtkAppendPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAppendPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAppendPolyData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  UserManagedInputs allows the user to set inputs by number instead of
##  using the AddInput/RemoveInput functions. Calls to
##  SetNumberOfInputs/SetInputConnectionByNumber should not be mixed with calls
##  to AddInput/RemoveInput. By default, UserManagedInputs is false.
##  virtual void SetUserManagedInputs ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UserManagedInputs  to  << _arg ) ; if ( this -> UserManagedInputs != _arg ) { this -> UserManagedInputs = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetUserManagedInputs ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UserManagedInputs  of  << this -> UserManagedInputs ) ; return this -> UserManagedInputs ; } ; virtual void UserManagedInputsOn ( ) { this -> SetUserManagedInputs ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UserManagedInputsOff ( ) { this -> SetUserManagedInputs ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Add a dataset to the list of data to append. Should not be
##  used when UserManagedInputs is true, use SetInputByNumber instead.
##  void AddInputData ( vtkPolyData * ) ; *
##  Remove a dataset from the list of data to append. Should not be
##  used when UserManagedInputs is true, use SetInputByNumber (nullptr) instead.
##  void RemoveInputData ( vtkPolyData * ) ; /@{ *
##  Get any input of this filter.
##  vtkPolyData * GetInput ( int idx ) ; vtkPolyData * GetInput ( ) { return this -> GetInput ( 0 ) ; } /@} *
##  Directly set(allocate) number of inputs, should only be used
##  when UserManagedInputs is true.
##  void SetNumberOfInputs ( int num ) ;  Set Nth input, should only be used when UserManagedInputs is true. void SetInputConnectionByNumber ( int num , vtkAlgorithmOutput * input ) ; void SetInputDataByNumber ( int num , vtkPolyData * ds ) ; /@{ *
##  ParallelStreaming is for a particular application.
##  It causes this filter to ask for a different piece
##  from each of its inputs.  If all the inputs are the same,
##  then the output of this append filter is the whole dataset
##  pieced back together.  Duplicate points are create
##  along the seams.  The purpose of this feature is to get
##  data parallelism at a course scale.  Each of the inputs
##  can be generated in a different process at the same time.
##  virtual void SetUserManagedInputsParallelStreaming ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ParallelStreaming  to  << _arg ) ; if ( this -> ParallelStreaming != _arg ) { this -> ParallelStreaming = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetUserManagedInputsParallelStreaming ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParallelStreaming  of  << this -> ParallelStreaming ) ; return this -> ParallelStreaming ; } ; virtual void ParallelStreamingOn ( ) { this -> SetUserManagedInputsParallelStreaming ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ParallelStreamingOff ( ) { this -> SetUserManagedInputsParallelStreaming ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetUserManagedInputsParallelStreamingOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetUserManagedInputsParallelStreamingOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} int ExecuteAppend ( vtkPolyData * output , vtkPolyData * inputs [ ] , int numInputs ) VTK_SIZEHINT ( inputs , numInputs ) ; protected : vtkAppendPolyData ( ) ; ~ vtkAppendPolyData ( ) override ;  Flag for selecting parallel streaming behavior vtkTypeBool ParallelStreaming ; int OutputPointsPrecision ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ;  An efficient templated way to append data. void AppendData ( vtkDataArray * dest , vtkDataArray * src , vtkIdType offset ) ;  An efficient way to append cells. void AppendCells ( vtkCellArray * dst , vtkCellArray * src , vtkIdType offset ) ; private :  hide the superclass' AddInput() from the user and the compiler void AddInputData ( vtkDataObject * ) { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << AddInput() must be called with a vtkPolyData not a vtkDataObject. ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayErrorText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; vtkObject :: BreakOnError ( ) ; } } while ( false ) ; } vtkTypeBool UserManagedInputs ; private : vtkAppendPolyData ( const vtkAppendPolyData & ) = delete ; void operator = ( const vtkAppendPolyData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCPExodusIIInSituReader.h
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
##  @class   vtkCPExodusIIInSituReader
##  @brief   Read an Exodus II file into data structures
##  that map the raw arrays returned by the Exodus II library into a multi-block
##  data set containing vtkUnstructuredGridBase subclasses.
##
##
##  This class can be used to import Exodus II files into VTK without repacking
##  the data into the standard VTK memory layout, avoiding the cost of a deep
##  copy.
##

## !!!Ignored construct:  # vtkCPExodusIIInSituReader_h [NewLine] # vtkCPExodusIIInSituReader_h [NewLine] # vtkIOExodusModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] # vtkNew.h  For vtkNew # < string >  For std::string # < vector >  For std::vector [NewLine] class vtkDataArrayCollection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKIOEXODUS_EXPORT vtkCPExodusIIInSituReader : public vtkMultiBlockDataSetAlgorithm { public : static vtkCPExodusIIInSituReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCPExodusIIInSituReader :: IsTypeOf ( type ) ; } static vtkCPExodusIIInSituReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCPExodusIIInSituReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCPExodusIIInSituReader * NewInstance ( ) const { return vtkCPExodusIIInSituReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCPExodusIIInSituReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCPExodusIIInSituReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the name of the Exodus file to read.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  Get/Set the current timestep to read as a zero-based index.
##  virtual int GetCurrentTimeStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentTimeStep  of  << this -> CurrentTimeStep ) ; return this -> CurrentTimeStep ; } ; virtual void SetCurrentTimeStep ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CurrentTimeStep  to  << _arg ) ; if ( this -> CurrentTimeStep != _arg ) { this -> CurrentTimeStep = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get the range of timesteps, represented as [0, numTimeSteps - 1]. Call
##  UpdateInformation first to set this without reading any timestep data.
##  virtual int * GetTimeStepRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TimeStepRange  pointer  << this -> TimeStepRange ) ; return this -> TimeStepRange ; } VTK_WRAPEXCLUDE virtual void GetTimeStepRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> TimeStepRange [ 0 ] ; _arg2 = this -> TimeStepRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TimeStepRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTimeStepRange ( int _arg [ 2 ] ) { this -> GetTimeStepRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} *
##  Get the floating point tag associated with the timestep at 'step'.
##  double GetTimeStepValue ( int step ) { return TimeSteps . at ( step ) ; } protected : vtkCPExodusIIInSituReader ( ) ; ~ vtkCPExodusIIInSituReader ( ) override ; vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkCPExodusIIInSituReader ( const vtkCPExodusIIInSituReader & ) = delete ; void operator = ( const vtkCPExodusIIInSituReader & ) = delete ; bool ExOpen ( ) ; char * FileName ; int FileId ; bool ExGetMetaData ( ) ; int NumberOfDimensions ; int NumberOfNodes ; int NumberOfElementBlocks ; std :: vector < std :: string > NodalVariableNames ; std :: vector < std :: string > ElementVariableNames ; std :: vector < int > ElementBlockIds ; std :: vector < double > TimeSteps ; int TimeStepRange [ 2 ] ; bool ExGetCoords ( ) ; vtkNew < vtkPoints > Points ; bool ExGetNodalVars ( ) ; vtkNew < vtkPointData > PointData ; bool ExGetElemBlocks ( ) ; vtkNew < vtkMultiBlockDataSet > ElementBlocks ; void ExClose ( ) ; int CurrentTimeStep ; } ;
## Error: token expected: ; but got: [identifier]!!!

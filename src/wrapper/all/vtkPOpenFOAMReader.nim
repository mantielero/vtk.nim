## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPOpenFOAMReader.h
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
##  @class   vtkPOpenFOAMReader
##  @brief   reads a decomposed dataset in OpenFOAM format
##
##  vtkPOpenFOAMReader creates a multiblock dataset. It reads
##  parallel-decomposed mesh information and time dependent data.  The
##  polyMesh folders contain mesh information. The time folders contain
##  transient data for the cells. Each folder can contain any number of
##  data files.
##
##  @par Thanks:
##  This class was developed by Takuya Oshima at Niigata University,
##  Japan (oshima@eng.niigata-u.ac.jp).
##

## !!!Ignored construct:  # vtkPOpenFOAMReader_h [NewLine] # vtkPOpenFOAMReader_h [NewLine] # vtkIOParallelModule.h  For export macro # vtkOpenFOAMReader.h [NewLine] class vtkDataArraySelection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKIOPARALLEL_EXPORT vtkPOpenFOAMReader : public vtkOpenFOAMReader { public : enum caseType { DECOMPOSED_CASE = 0 , RECONSTRUCTED_CASE = 1 } ; static vtkPOpenFOAMReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkOpenFOAMReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkOpenFOAMReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPOpenFOAMReader :: IsTypeOf ( type ) ; } static vtkPOpenFOAMReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPOpenFOAMReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPOpenFOAMReader * NewInstance ( ) const { return vtkPOpenFOAMReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenFOAMReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPOpenFOAMReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPOpenFOAMReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set and get case type. 0 = decomposed case, 1 = reconstructed case.
##  void SetCaseType ( const int t ) ; virtual caseType GetCaseType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CaseType  of  << this -> CaseType ) ; return this -> CaseType ; } ; /@}
## /@{ *
##  Set and get the controller.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkPOpenFOAMReader ( ) ; ~ vtkPOpenFOAMReader ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkMultiProcessController * Controller ; caseType CaseType ; vtkMTimeType MTimeOld ; int NumProcesses ; int ProcessId ; vtkPOpenFOAMReader ( const vtkPOpenFOAMReader & ) = delete ; void operator = ( const vtkPOpenFOAMReader & ) = delete ; void GatherMetaData ( ) ; void BroadcastStatus ( int & ) ; void Broadcast ( vtkStringArray * ) ; void AllGather ( vtkStringArray * ) ; void AllGather ( vtkDataArraySelection * ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

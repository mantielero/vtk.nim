## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationExecutivePortVectorKey.h
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
##  @class   vtkInformationExecutivePortVectorKey
##  @brief   Key for vtkExecutive/Port value pair vectors.
##
##  vtkInformationExecutivePortVectorKey is used to represent keys in
##  vtkInformation for values that are vectors of vtkExecutive
##  instances paired with port numbers.
##

## !!!Ignored construct:  # vtkInformationExecutivePortVectorKey_h [NewLine] # vtkInformationExecutivePortVectorKey_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkInformationKey.h [NewLine] # vtkFilteringInformationKeyManager.h  Manage instances of this type. [NewLine] class vtkExecutive ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkInformationExecutivePortVectorKey : public vtkInformationKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationExecutivePortVectorKey :: IsTypeOf ( type ) ; } static vtkInformationExecutivePortVectorKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationExecutivePortVectorKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationExecutivePortVectorKey * NewInstance ( ) const { return vtkInformationExecutivePortVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationExecutivePortVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationExecutivePortVectorKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkInformationExecutivePortVectorKey ( const char * name , const char * location ) ; ~ vtkInformationExecutivePortVectorKey ( ) override ; *
##  This method simply returns a new vtkInformationExecutivePortVectorKey,
##  given a name and a location. This method is provided for wrappers. Use
##  the constructor directly from C++ instead.
##  static VTK_NEWINSTANCE vtkInformationExecutivePortVectorKey * MakeKey ( const char * name , const char * location ) { return new vtkInformationExecutivePortVectorKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Append ( vtkInformation * info , vtkExecutive * executive , int port ) ; void Remove ( vtkInformation * info , vtkExecutive * executive , int port ) ; void Set ( vtkInformation * info , vtkExecutive * * executives , int * ports , int length ) ; vtkExecutive * * GetExecutives ( vtkInformation * info ) ; int * GetPorts ( vtkInformation * info ) ; void Get ( vtkInformation * info , vtkExecutive * * executives , int * ports ) ; int Length ( vtkInformation * info ) ; /@} *
##  Copy the entry associated with this key from one information
##  object to another.  If there is no entry in the first information
##  object for this key, the value is removed from the second.
##  void ShallowCopy ( vtkInformation * from , vtkInformation * to ) override ; *
##  Remove this key from the given information object.
##  void Remove ( vtkInformation * info ) override ; *
##  Report a reference this key has in the given information object.
##  void Report ( vtkInformation * info , vtkGarbageCollector * collector ) override ; *
##  Print the key's value in an information object to a stream.
##  void Print ( ostream & os , vtkInformation * info ) override ; protected : /@{ *
##  Get the address at which the actual value is stored.  This is
##  meant for use from a debugger to add watches and is therefore not
##  a public method.
##  vtkExecutive * * GetExecutivesWatchAddress ( vtkInformation * info ) ; int * GetPortsWatchAddress ( vtkInformation * info ) ; /@} private : vtkInformationExecutivePortVectorKey ( const vtkInformationExecutivePortVectorKey & ) = delete ; void operator = ( const vtkInformationExecutivePortVectorKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

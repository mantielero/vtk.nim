## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationIntegerRequestKey.h
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
##  @class   vtkInformationIntegerRequestKey
##  @brief   key that can used to request integer values from the pipeline
##  vtkInformationIntegerRequestKey is a vtkInformationIntegerKey that can
##  used to request integer values from upstream. A good example of this is
##  UPDATE_NUMBER_OF_PIECES where downstream can request that upstream provides
##  data partitioned into a certain number of pieces. There are several components
##  that make this work. First, the key will copy itself upstream during
##  REQUEST_UPDATE_EXTENT. Second, after a successful execution, it will stor
##  its value into a data object's information using a specific key defined by
##  its data member DataKey. Third, before execution, it will check if the requested
##  value matched the value in the data object's information. If not, it will ask
##  the pipeline to execute.
##
##  The best way to use this class is to subclass it to set the DataKey data member.
##  This is usually done in the subclass' constructor.
##

## !!!Ignored construct:  # vtkInformationIntegerRequestKey_h [NewLine] # vtkInformationIntegerRequestKey_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkInformationIntegerKey.h [NewLine] # vtkCommonInformationKeyManager.h  Manage instances of this type. [NewLine] class VTKCOMMONEXECUTIONMODEL_EXPORT vtkInformationIntegerRequestKey : public vtkInformationIntegerKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationIntegerKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationIntegerKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationIntegerRequestKey :: IsTypeOf ( type ) ; } static vtkInformationIntegerRequestKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationIntegerRequestKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationIntegerRequestKey * NewInstance ( ) const { return vtkInformationIntegerRequestKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationIntegerKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationIntegerRequestKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationIntegerRequestKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkInformationIntegerRequestKey ( const char * name , const char * location ) ; ~ vtkInformationIntegerRequestKey ( ) override ; *
##  This method simply returns a new vtkInformationIntegerRequestKey,
##  given a name and a location. This method is provided for wrappers. Use
##  the constructor directly from C++ instead.
##  static VTK_NEWINSTANCE vtkInformationIntegerRequestKey * MakeKey ( const char * name , const char * location ) { return new vtkInformationIntegerRequestKey ( name , location ) ; } *
##  Returns true if a value of type DataKey does not exist in dobjInfo
##  or if it is different that the value stored in pipelineInfo using
##  this key.
##  bool NeedToExecute ( vtkInformation * pipelineInfo , vtkInformation * dobjInfo ) override ; *
##  Copies the value stored in pipelineInfo using this key into
##  dobjInfo.
##  void StoreMetaData ( vtkInformation * request , vtkInformation * pipelineInfo , vtkInformation * dobjInfo ) override ; *
##  Copies the value stored in fromInfo using this key into toInfo
##  if request has the REQUEST_UPDATE_EXTENT key.
##  void CopyDefaultInformation ( vtkInformation * request , vtkInformation * fromInfo , vtkInformation * toInfo ) override ; protected : vtkInformationIntegerKey * DataKey ; private : vtkInformationIntegerRequestKey ( const vtkInformationIntegerRequestKey & ) = delete ; void operator = ( const vtkInformationIntegerRequestKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

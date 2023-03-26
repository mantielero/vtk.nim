## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMaskFields.h
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
##  @class   vtkMaskFields
##  @brief   Allow control of which fields get passed
##  to the output
##
##  vtkMaskFields is used to mark which fields in the input dataset
##  get copied to the output.  The output will contain only those fields
##  marked as on by the filter.
##
##  @sa
##  vtkFieldData vtkDataSet vtkDataObjectToDataSetFilter
##  vtkDataSetAttributes vtkDataArray vtkRearrangeFields
##  vtkSplitField vtkMergeFields vtkAssignAttribute
##

## !!!Ignored construct:  # vtkMaskFields_h [NewLine] # vtkMaskFields_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] # vtkDataSetAttributes.h  Needed for NUM_ATTRIBUTES [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkMaskFields : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMaskFields :: IsTypeOf ( type ) ; } static vtkMaskFields * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMaskFields * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMaskFields * NewInstance ( ) const { return vtkMaskFields :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMaskFields :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMaskFields :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Create a new vtkMaskFields.
##  static vtkMaskFields * New ( ) ; *
##  Turn on/off the copying of the field or specified by name.
##  During the copying/passing, the following rules are followed for each
##  array:
##  1. If the copy flag for an array is set (on or off), it is applied
##  This overrides rule 2.
##  2. If CopyAllOn is set, copy the array.
##  If CopyAllOff is set, do not copy the array
##  A field name and a location must be specified. For example:
##  @verbatim
##  maskFields->CopyFieldOff(vtkMaskFields::CELL_DATA, "foo");
##  @endverbatim
##  causes the field "foo" on the input cell data to not get copied
##  to the output.
##  void CopyFieldOn ( int fieldLocation , const char * name ) { this -> CopyFieldOnOff ( fieldLocation , name , 1 ) ; } void CopyFieldOff ( int fieldLocation , const char * name ) { this -> CopyFieldOnOff ( fieldLocation , name , 0 ) ; } *
##  Turn on/off the copying of the attribute or specified by vtkDataSetAttributes:AttributeTypes.
##  During the copying/passing, the following rules are followed for each
##  array:
##  1. If the copy flag for an array is set (on or off), it is applied
##  This overrides rule 2.
##  2. If CopyAllOn is set, copy the array.
##  If CopyAllOff is set, do not copy the array
##  An attribute type and a location must be specified. For example:
##  @verbatim
##  maskFields->CopyAttributeOff(vtkMaskFields::POINT_DATA, vtkDataSetAttributes::SCALARS);
##  @endverbatim
##  causes the scalars on the input point data to not get copied
##  to the output.
##  void CopyAttributeOn ( int attributeLocation , int attributeType ) { this -> CopyAttributeOnOff ( attributeLocation , attributeType , 1 ) ; } void CopyAttributeOff ( int attributeLocation , int attributeType ) { this -> CopyAttributeOnOff ( attributeLocation , attributeType , 0 ) ; } *
##  Convenience methods which operate on all field data or
##  attribute data.  More specific than CopyAllOn or CopyAllOff
##  void CopyFieldsOff ( ) { this -> CopyFields = 0 ; } void CopyAttributesOff ( ) { this -> CopyAttributes = 0 ; } void CopyFieldsOn ( ) { this -> CopyFields = 1 ; } void CopyAttributesOn ( ) { this -> CopyAttributes = 1 ; } /@{ *
##  Helper methods used by other language bindings. Allows the caller to
##  specify arguments as strings instead of enums.
##  void CopyAttributeOn ( const char * attributeLoc , const char * attributeType ) ; void CopyAttributeOff ( const char * attributeLoc , const char * attributeType ) ; void CopyFieldOn ( const char * fieldLoc , const char * name ) ; void CopyFieldOff ( const char * fieldLoc , const char * name ) ; /@} *
##  Turn on copying of all data.
##  During the copying/passing, the following rules are followed for each
##  array:
##  1. If the copy flag for an array is set (on or off), it is applied
##  This overrides rule 2.
##  2. If CopyAllOn is set, copy the array.
##  If CopyAllOff is set, do not copy the array
##  virtual void CopyAllOn ( ) ; *
##  Turn off copying of all data.
##  During the copying/passing, the following rules are followed for each
##  array:
##  1. If the copy flag for an array is set (on or off), it is applied
##  This overrides rule 2.
##  2. If CopyAllOn is set, copy the array.
##  If CopyAllOff is set, do not copy the array
##  virtual void CopyAllOff ( ) ; enum FieldLocation { OBJECT_DATA = 0 , POINT_DATA = 1 , CELL_DATA = 2 } ; protected : vtkMaskFields ( ) ; ~ vtkMaskFields ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; struct CopyFieldFlag { char * Name ; int Type ; int Location ; int IsCopied ; } ; CopyFieldFlag * CopyFieldFlags ;  the names of fields not to be copied int NumberOfFieldFlags ;  the number of fields not to be copied void CopyFieldOnOff ( int fieldLocation , const char * name , int onOff ) ; void CopyAttributeOnOff ( int attributeLocation , int attributeType , int onOff ) ; void ClearFieldFlags ( ) ; int FindFlag ( const char * field , int location ) ; int FindFlag ( int arrayType , int location ) ; int GetFlag ( const char * field , int location ) ; int GetFlag ( int arrayType , int location ) ; int GetAttributeLocation ( const char * loc ) ; int GetAttributeType ( const char * type ) ; int CopyFields ; int CopyAttributes ; static char FieldLocationNames [ 3 ] [ 12 ] ; static char AttributeNames [ vtkDataSetAttributes :: NUM_ATTRIBUTES ] [ 10 ] ; private : vtkMaskFields ( const vtkMaskFields & ) = delete ; void operator = ( const vtkMaskFields & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

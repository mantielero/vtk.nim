## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeVectorComponents.h
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
##  @class   vtkMergeVectorComponents
##  @brief   merge components of many single-component arrays into one vector
##
##  vtkMergeVectorComponents is a filter that merges three single-component arrays
##  into one vector. This is accomplished by creating one output vector with
##  3 components. The type of the output vector is vtkDoubleArray. The user
##  needs to define the names of the single-component arrays and the attribute-type
##  of the arrays, i.e. point-data or cell-data.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##

## !!!Ignored construct:  # vtkMergeVectorComponents_h [NewLine] # vtkMergeVectorComponents_h [NewLine] # vtkDataObject.h  For attribute types # vtkFiltersGeneralModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkMergeVectorComponents : public vtkPassInputTypeAlgorithm { public : static vtkMergeVectorComponents * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMergeVectorComponents :: IsTypeOf ( type ) ; } static vtkMergeVectorComponents * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMergeVectorComponents * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMergeVectorComponents * NewInstance ( ) const { return vtkMergeVectorComponents :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeVectorComponents :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeVectorComponents :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the name of the array to use as the X component of the combination vector
##  virtual void SetXArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << XArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> XArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> XArrayName && _arg && ( ! strcmp ( this -> XArrayName , _arg ) ) ) { return ; } delete [ ] this -> XArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> XArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> XArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetXArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << XArrayName  of  << ( this -> XArrayName ? this -> XArrayName : (null) ) ) ; return this -> XArrayName ; } ; /@} /@{ *
##  Set the name of the array to use as the Y component of the combination vector
##  virtual void SetXArrayNameYArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << YArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> YArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> YArrayName && _arg && ( ! strcmp ( this -> YArrayName , _arg ) ) ) { return ; } delete [ ] this -> YArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> YArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> YArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetXArrayNameYArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << YArrayName  of  << ( this -> YArrayName ? this -> YArrayName : (null) ) ) ; return this -> YArrayName ; } ; /@} /@{ *
##  Set the name of the array to use as the Z attribute of the combination vector
##  virtual void SetXArrayNameYArrayNameZArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ZArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ZArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ZArrayName && _arg && ( ! strcmp ( this -> ZArrayName , _arg ) ) ) { return ; } delete [ ] this -> ZArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ZArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ZArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetXArrayNameYArrayNameZArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZArrayName  of  << ( this -> ZArrayName ? this -> ZArrayName : (null) ) ) ; return this -> ZArrayName ; } ; /@} /@{ *
##  Set the name of the output combination vector. If name is undefined, the output vector will
##  be named, "combinationVector".
##  virtual void SetXArrayNameYArrayNameZArrayNameOutputVectorName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputVectorName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OutputVectorName == nullptr && _arg == nullptr ) { return ; } if ( this -> OutputVectorName && _arg && ( ! strcmp ( this -> OutputVectorName , _arg ) ) ) { return ; } delete [ ] this -> OutputVectorName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OutputVectorName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OutputVectorName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetXArrayNameYArrayNameZArrayNameOutputVectorName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputVectorName  of  << ( this -> OutputVectorName ? this -> OutputVectorName : (null) ) ) ; return this -> OutputVectorName ; } ; /@} /@{ *
##  Control which AttributeType the filter operates on (point data or cell data
##  for vtkDataSets). The default value is vtkDataObject::POINT. The input value for
##  this function should be either vtkDataObject::POINT or vtkDataObject::CELL.
##  virtual void SetAttributeType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AttributeType  to  << _arg ) ; if ( this -> AttributeType != _arg ) { this -> AttributeType = _arg ; this -> Modified ( ) ; } } ; virtual int GetAttributeType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributeType  of  << this -> AttributeType ) ; return this -> AttributeType ; } ; void SetAttributeTypeToPointData ( ) { this -> SetAttributeType ( vtkDataObject :: POINT ) ; } void SetAttributeTypeToCellData ( ) { this -> SetAttributeType ( vtkDataObject :: CELL ) ; } /@} protected : vtkMergeVectorComponents ( ) ; ~ vtkMergeVectorComponents ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * XArrayName ; char * YArrayName ; char * ZArrayName ; char * OutputVectorName ; int AttributeType ; private : vtkMergeVectorComponents ( const vtkMergeVectorComponents & ) = delete ; void operator = ( const vtkMergeVectorComponents & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

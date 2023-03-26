## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAttributeDataToFieldDataFilter.h
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
##  @class   vtkAttributeDataToFieldDataFilter
##  @brief   map attribute data to field data
##
##  vtkAttributeDataToFieldDataFilter is a class that maps attribute data into
##  field data. Since this filter is a subclass of vtkDataSetAlgorithm,
##  the output dataset (whose structure is the same as the input dataset),
##  will contain the field data that is generated. The filter will convert
##  point and cell attribute data to field data and assign it as point and
##  cell field data, replacing any point or field data that was there
##  previously. By default, the original non-field point and cell attribute
##  data will be passed to the output of the filter, although you can shut
##  this behavior down.
##
##  @warning
##  Reference counting the underlying data arrays is used to create the field
##  data.  Therefore, no extra memory is utilized.
##
##  @warning
##  The original field data (if any) associated with the point and cell
##  attribute data is placed into the generated fields along with the scalars,
##  vectors, etc.
##
##  @sa
##  vtkFieldData vtkDataObject vtkDataSet vtkFieldDataToAttributeDataFilter
##

## !!!Ignored construct:  # vtkAttributeDataToFieldDataFilter_h [NewLine] # vtkAttributeDataToFieldDataFilter_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class VTKFILTERSCORE_EXPORT vtkAttributeDataToFieldDataFilter : public vtkDataSetAlgorithm { public : void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAttributeDataToFieldDataFilter :: IsTypeOf ( type ) ; } static vtkAttributeDataToFieldDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAttributeDataToFieldDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAttributeDataToFieldDataFilter * NewInstance ( ) const { return vtkAttributeDataToFieldDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAttributeDataToFieldDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAttributeDataToFieldDataFilter :: New ( ) ; } public : ; *
##  Construct this object.
##  static vtkAttributeDataToFieldDataFilter * New ( ) ; /@{ *
##  Turn on/off the passing of point and cell non-field attribute data to the
##  output of the filter.
##  virtual void SetPassAttributeData ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassAttributeData  to  << _arg ) ; if ( this -> PassAttributeData != _arg ) { this -> PassAttributeData = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPassAttributeData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassAttributeData  of  << this -> PassAttributeData ) ; return this -> PassAttributeData ; } ; virtual void PassAttributeDataOn ( ) { this -> SetPassAttributeData ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassAttributeDataOff ( ) { this -> SetPassAttributeData ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkAttributeDataToFieldDataFilter ( ) ; ~ vtkAttributeDataToFieldDataFilter ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  generate output data vtkTypeBool PassAttributeData ; private : vtkAttributeDataToFieldDataFilter ( const vtkAttributeDataToFieldDataFilter & ) = delete ; void operator = ( const vtkAttributeDataToFieldDataFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractVectorComponents.h
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
##  @class   vtkExtractVectorComponents
##  @brief   extract components of vector as separate scalars
##
##  vtkExtractVectorComponents is a filter that extracts vector components as
##  separate scalars. This is accomplished by creating three different outputs.
##  Each output is the same as the input, except that the scalar values will be
##  one of the three components of the vector. These can be found in the
##  VxComponent, VyComponent, and VzComponent.
##  Alternatively, if the ExtractToFieldData flag is set, the filter will
##  put all the components in the field data. The first component will be
##  the scalar and the others will be non-attribute arrays.
##
##  @warning
##  This filter is unusual in that it creates multiple outputs.
##  If you use the GetOutput() method, you will be retrieving the x vector
##  component.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##

## !!!Ignored construct:  # vtkExtractVectorComponents_h [NewLine] # vtkExtractVectorComponents_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersExtractionModule.h  For export macro [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSEXTRACTION_EXPORT vtkExtractVectorComponents : public vtkDataSetAlgorithm { public : static vtkExtractVectorComponents * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractVectorComponents :: IsTypeOf ( type ) ; } static vtkExtractVectorComponents * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractVectorComponents * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractVectorComponents * NewInstance ( ) const { return vtkExtractVectorComponents :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractVectorComponents :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractVectorComponents :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Specify the input data or filter.
##  virtual void SetInputData ( vtkDataSet * input ) ; *
##  Get the output dataset representing velocity x-component. If output is
##  nullptr then input hasn't been set, which is necessary for abstract
##  objects. (Note: this method returns the same information as the
##  GetOutput() method with an index of 0.)
##  vtkDataSet * GetVxComponent ( ) ; *
##  Get the output dataset representing velocity y-component. If output is
##  nullptr then input hasn't been set, which is necessary for abstract
##  objects. (Note: this method returns the same information as the
##  GetOutput() method with an index of 1.)
##  Note that if ExtractToFieldData is true, this output will be empty.
##  vtkDataSet * GetVyComponent ( ) ; *
##  Get the output dataset representing velocity z-component. If output is
##  nullptr then input hasn't been set, which is necessary for abstract
##  objects. (Note: this method returns the same information as the
##  GetOutput() method with an index of 2.)
##  Note that if ExtractToFieldData is true, this output will be empty.
##  vtkDataSet * GetVzComponent ( ) ; /@{ *
##  Determines whether the vector components will be put
##  in separate outputs or in the first output's field data
##  virtual void SetExtractToFieldData ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtractToFieldData  to  << _arg ) ; if ( this -> ExtractToFieldData != _arg ) { this -> ExtractToFieldData = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetExtractToFieldData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractToFieldData  of  << this -> ExtractToFieldData ) ; return this -> ExtractToFieldData ; } ; virtual void ExtractToFieldDataOn ( ) { this -> SetExtractToFieldData ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ExtractToFieldDataOff ( ) { this -> SetExtractToFieldData ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkExtractVectorComponents ( ) ; ~ vtkExtractVectorComponents ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool ExtractToFieldData ; int OutputsInitialized ; private : vtkExtractVectorComponents ( const vtkExtractVectorComponents & ) = delete ; void operator = ( const vtkExtractVectorComponents & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

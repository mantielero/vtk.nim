## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConvertSelection.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkConvertSelection
##  @brief   Convert a selection from one type to another
##
##
##  vtkConvertSelection converts an input selection from one type to another
##  in the context of a data object being selected. The first input is the
##  selection, while the second input is the data object that the selection
##  relates to.
##
##  @sa
##  vtkSelection vtkSelectionNode vtkExtractSelection vtkExtractSelectedGraph
##

## !!!Ignored construct:  # vtkConvertSelection_h [NewLine] # vtkConvertSelection_h [NewLine] # vtkFiltersExtractionModule.h  For export macro # vtkSelectionAlgorithm.h [NewLine] class vtkCompositeDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkGraph"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkSelection"
discard "forward decl of vtkSelectionNode"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTable"
discard "forward decl of vtkExtractSelection"
## !!!Ignored construct:  class VTKFILTERSEXTRACTION_EXPORT vtkConvertSelection : public vtkSelectionAlgorithm { public : static vtkConvertSelection * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSelectionAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSelectionAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConvertSelection :: IsTypeOf ( type ) ; } static vtkConvertSelection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConvertSelection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConvertSelection * NewInstance ( ) const { return vtkConvertSelection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSelectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConvertSelection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConvertSelection :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  A convenience method for setting the second input (i.e. the data object).
##  void SetDataObjectConnection ( vtkAlgorithmOutput * in ) ; /@{ *
##  The input field type.
##  If this is set to a number other than -1, ignores the input selection
##  field type and instead assumes that all selection nodes have the
##  field type specified.
##  This should be one of the constants defined in vtkSelectionNode.h.
##  Default is -1.
##  virtual void SetInputFieldType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InputFieldType  to  << _arg ) ; if ( this -> InputFieldType != _arg ) { this -> InputFieldType = _arg ; this -> Modified ( ) ; } } ; virtual int GetInputFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputFieldType  of  << this -> InputFieldType ) ; return this -> InputFieldType ; } ; /@} /@{ *
##  The output selection content type.
##  This should be one of the constants defined in vtkSelectionNode.h.
##  virtual void SetInputFieldTypeOutputType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputType  to  << _arg ) ; if ( this -> OutputType != _arg ) { this -> OutputType = _arg ; this -> Modified ( ) ; } } ; virtual int GetInputFieldTypeOutputType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputType  of  << this -> OutputType ) ; return this -> OutputType ; } ; /@} /@{ *
##  The output array name for value or threshold selections.
##  virtual void SetArrayName ( const char * ) ; virtual const char * GetArrayName ( ) ; /@} /@{ *
##  The output array names for value selection.
##  virtual void SetArrayNames ( vtkStringArray * ) ; virtual vtkStringArray * GetnameArrayNames ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ArrayNames  address  << static_cast < vtkStringArray * > ( this -> ArrayNames ) ) ; return this -> ArrayNames ; } ; /@} /@{ *
##  Convenience methods used by UI
##  void AddArrayName ( const char * ) ; void ClearArrayNames ( ) ; /@} /@{ *
##  When on, creates a separate selection node for each array.
##  Defaults to OFF.
##  virtual void SetInputFieldTypeOutputTypeMatchAnyValues ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MatchAnyValues  to  << _arg ) ; if ( this -> MatchAnyValues != _arg ) { this -> MatchAnyValues = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputFieldTypeOutputTypeMatchAnyValues ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MatchAnyValues  of  << this -> MatchAnyValues ) ; return this -> MatchAnyValues ; } ; virtual void MatchAnyValuesOn ( ) { this -> SetMatchAnyValues ( static_cast < bool > ( 1 ) ) ; } virtual void MatchAnyValuesOff ( ) { this -> SetMatchAnyValues ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When enabled, not finding expected array will not return an error.
##  Defaults to OFF.
##  virtual void SetInputFieldTypeOutputTypeMatchAnyValuesAllowMissingArray ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AllowMissingArray  to  << _arg ) ; if ( this -> AllowMissingArray != _arg ) { this -> AllowMissingArray = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputFieldTypeOutputTypeMatchAnyValuesAllowMissingArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllowMissingArray  of  << this -> AllowMissingArray ) ; return this -> AllowMissingArray ; } ; virtual void AllowMissingArrayOn ( ) { this -> SetMatchAnyValuesAllowMissingArray ( static_cast < bool > ( 1 ) ) ; } virtual void AllowMissingArrayOff ( ) { this -> SetMatchAnyValuesAllowMissingArray ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get a selection extractor used in some conversions to
##  obtain IDs.
##  virtual void SetSelectionExtractor ( vtkExtractSelection * ) ; virtual vtkExtractSelection * GetnameArrayNamesSelectionExtractor ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectionExtractor  address  << static_cast < vtkExtractSelection * > ( this -> SelectionExtractor ) ) ; return this -> SelectionExtractor ; } ; /@} /@{ *
##  Static methods for easily converting between selection types.
##  NOTE: The returned selection pointer IS reference counted,
##  so be sure to Delete() it when you are done with it.
##  static vtkSelection * ToIndexSelection ( vtkSelection * input , vtkDataObject * data ) ; static vtkSelection * ToGlobalIdSelection ( vtkSelection * input , vtkDataObject * data ) ; static vtkSelection * ToPedigreeIdSelection ( vtkSelection * input , vtkDataObject * data ) ; static vtkSelection * ToValueSelection ( vtkSelection * input , vtkDataObject * data , const char * arrayName ) ; static vtkSelection * ToValueSelection ( vtkSelection * input , vtkDataObject * data , vtkStringArray * arrayNames ) ; /@} *
##  Static generic method for obtaining selected items from a data object.
##  Other static methods (e.g. GetSelectedVertices) call this one.
##  static void GetSelectedItems ( vtkSelection * input , vtkDataObject * data , int fieldType , vtkIdTypeArray * indices ) ; /@{ *
##  Static methods for easily obtaining selected items from a data object.
##  The array argument will be filled with the selected items.
##  static void GetSelectedVertices ( vtkSelection * input , vtkGraph * data , vtkIdTypeArray * indices ) ; static void GetSelectedEdges ( vtkSelection * input , vtkGraph * data , vtkIdTypeArray * indices ) ; static void GetSelectedPoints ( vtkSelection * input , vtkDataSet * data , vtkIdTypeArray * indices ) ; static void GetSelectedCells ( vtkSelection * input , vtkDataSet * data , vtkIdTypeArray * indices ) ; static void GetSelectedRows ( vtkSelection * input , vtkTable * data , vtkIdTypeArray * indices ) ; /@} *
##  A generic static method for converting selection types.
##  The type should be an integer constant defined in vtkSelectionNode.h.
##  static vtkSelection * ToSelectionType ( vtkSelection * input , vtkDataObject * data , int type , vtkStringArray * arrayNames = nullptr , int inputFieldType = - 1 , bool allowMissingArray = false ) ; protected : vtkConvertSelection ( ) ; ~ vtkConvertSelection ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int Convert ( vtkSelection * input , vtkDataObject * data , vtkSelection * output ) ; int ConvertCompositeDataSet ( vtkSelection * input , vtkCompositeDataSet * data , vtkSelection * output ) ; int ConvertFromQueryAndBlockSelectionNodeCompositeDataSet ( vtkSelectionNode * input , vtkCompositeDataSet * data , vtkSelection * output ) ; int ConvertToIndexSelection ( vtkSelectionNode * input , vtkDataSet * data , vtkSelectionNode * output ) ; int SelectTableFromTable ( vtkTable * selTable , vtkTable * dataTable , vtkIdTypeArray * indices ) ; int ConvertToBlockSelection ( vtkSelection * input , vtkCompositeDataSet * data , vtkSelection * output ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int OutputType ; int InputFieldType ; vtkStringArray * ArrayNames ; bool MatchAnyValues ; bool AllowMissingArray ; vtkExtractSelection * SelectionExtractor ; private : vtkConvertSelection ( const vtkConvertSelection & ) = delete ; void operator = ( const vtkConvertSelection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

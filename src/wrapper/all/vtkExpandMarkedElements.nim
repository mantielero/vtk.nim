## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExpandMarkedElements.h
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
##  @class vtkExpandMarkedElements
##  @brief expands marked elements to including adjacent elements.
##
##  vtkExpandMarkedElements is intended to expand selected cells to
##  grow to include adjacent cells. The filter works across all blocks in a
##  composite dataset and across all ranks. Besides cells, the filter can be used
##  to expand selected points instead in which case adjacent points are defined
##  as points on any cell that has the source point as one of its points.
##
##  The selected cells (or points) are indicated by a `vtkSignedCharArray` on
##  cell-data (or point-data). The array can be selected by using
##  `SetInputArrayToProcess(0, 0, 0,...)` (see
##  vtkAlgorithm::SetInputArrayToProcess).
##
##  Currently, the filter only supports expanding marked elements for cells and
##  points.
##

## !!!Ignored construct:  # vtkExpandMarkedElements_h [NewLine] # vtkExpandMarkedElements_h [NewLine] # vtkFiltersExtractionModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSEXTRACTION_EXPORT vtkExpandMarkedElements : public vtkPassInputTypeAlgorithm { public : static vtkExpandMarkedElements * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExpandMarkedElements :: IsTypeOf ( type ) ; } static vtkExpandMarkedElements * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExpandMarkedElements * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExpandMarkedElements * NewInstance ( ) const { return vtkExpandMarkedElements :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExpandMarkedElements :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExpandMarkedElements :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the controller to use. By default, is initialized to
##  `vtkMultiProcessController::GetGlobalController` in the constructor.
##  void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  Get/Set the number of layers to expand by.
##  virtual void SetNumberOfLayers ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfLayers  to  << _arg ) ; if ( this -> NumberOfLayers != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfLayers = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNumberOfLayersMinValue ( ) { return 1 ; } virtual int GetNumberOfLayersMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetNumberOfLayers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfLayers  of  << this -> NumberOfLayers ) ; return this -> NumberOfLayers ; } ; /@} protected : vtkExpandMarkedElements ( ) ; ~ vtkExpandMarkedElements ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkExpandMarkedElements ( const vtkExpandMarkedElements & ) = delete ; void operator = ( const vtkExpandMarkedElements & ) = delete ; vtkMultiProcessController * Controller = nullptr ; int NumberOfLayers = 2 ; } ;
## Error: token expected: ; but got: [identifier]!!!

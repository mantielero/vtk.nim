## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMaskPolyData.h
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
##  @class   vtkMaskPolyData
##  @brief   sample subset of input polygonal data cells
##
##  vtkMaskPolyData is a filter that sub-samples the cells of input polygonal
##  data. The user specifies every nth item, with an initial offset to begin
##  sampling.
##
##  @sa
##  vtkMaskPoints
##

## !!!Ignored construct:  # vtkMaskPolyData_h [NewLine] # vtkMaskPolyData_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkMaskPolyData : public vtkPolyDataAlgorithm { public : static vtkMaskPolyData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMaskPolyData :: IsTypeOf ( type ) ; } static vtkMaskPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMaskPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMaskPolyData * NewInstance ( ) const { return vtkMaskPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMaskPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMaskPolyData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Turn on every nth entity (cell).
##  virtual void SetOnRatio ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OnRatio  to  << _arg ) ; if ( this -> OnRatio != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> OnRatio = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOnRatioMinValue ( ) { return 1 ; } virtual int GetOnRatioMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetOnRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OnRatio  of  << this -> OnRatio ) ; return this -> OnRatio ; } ; /@} /@{ *
##  Start with this entity (cell).
##  virtual void SetOnRatioOffset ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Offset  to  << _arg ) ; if ( this -> Offset != ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> Offset = ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetOnRatioMinValueOffsetMinValue ( ) { return 0 ; } virtual vtkIdType GetOnRatioMaxValueOffsetMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetOnRatioOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Offset  of  << this -> Offset ) ; return this -> Offset ; } ; /@} protected : vtkMaskPolyData ( ) ; ~ vtkMaskPolyData ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int OnRatio ;  every OnRatio entity is on; all others are off. vtkIdType Offset ;  offset (or starting point id) private : vtkMaskPolyData ( const vtkMaskPolyData & ) = delete ; void operator = ( const vtkMaskPolyData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

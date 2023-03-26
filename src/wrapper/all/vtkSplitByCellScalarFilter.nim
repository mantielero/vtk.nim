## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSplitByCellScalarFilter.h
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
##  @class   vtkSplitByCellScalarFilter
##  @brief   splits input dataset according an integer cell scalar array.
##
##  vtkSplitByCellScalarFilter is a filter that splits any dataset type
##  according an integer cell scalar value (typically a material identifier) to
##  a multiblock. Each block of the output contains cells that have the same
##  scalar value. Output blocks will be of type vtkUnstructuredGrid except if
##  input is of type vtkPolyData. In that case output blocks are of type
##  vtkPolyData.
##
##  @sa
##  vtkThreshold
##
##  @par Thanks:
##  This class was written by Joachim Pouderoux, Kitware 2016.
##

## !!!Ignored construct:  # vtkSplitByCellScalarFilter_h [NewLine] # vtkSplitByCellScalarFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkSplitByCellScalarFilter : public vtkMultiBlockDataSetAlgorithm { public : static vtkSplitByCellScalarFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSplitByCellScalarFilter :: IsTypeOf ( type ) ; } static vtkSplitByCellScalarFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSplitByCellScalarFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSplitByCellScalarFilter * NewInstance ( ) const { return vtkSplitByCellScalarFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSplitByCellScalarFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSplitByCellScalarFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify if input points array must be passed to output blocks. If so,
##  filter processing is faster but outblocks will contains more points than
##  what is needed by the cells it owns. If not, a new points array is created
##  for every block and it will only contains points for copied cells.
##  Note that this function is only possible for PointSet datasets.
##  The default is true.
##  virtual bool GetPassAllPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassAllPoints  of  << this -> PassAllPoints ) ; return this -> PassAllPoints ; } ; virtual void SetPassAllPoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassAllPoints  to  << _arg ) ; if ( this -> PassAllPoints != _arg ) { this -> PassAllPoints = _arg ; this -> Modified ( ) ; } } ; virtual void PassAllPointsOn ( ) { this -> SetPassAllPoints ( static_cast < bool > ( 1 ) ) ; } virtual void PassAllPointsOff ( ) { this -> SetPassAllPoints ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkSplitByCellScalarFilter ( ) ; ~ vtkSplitByCellScalarFilter ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; bool PassAllPoints ; private : vtkSplitByCellScalarFilter ( const vtkSplitByCellScalarFilter & ) = delete ; void operator = ( const vtkSplitByCellScalarFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

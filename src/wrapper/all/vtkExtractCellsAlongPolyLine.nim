## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractCellsAlongPolyLine.h
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
##  @class   vtkExtractCellsAlongPolyLine
##  @brief   Extracts input cells that are intersected by a list of input lines or poly lines
##
##  This filter extracts input cells that are intersected by a list of input lines or poly lines.
##  The lines / poly lines input is set on input port 1, as a source connection, while the input data
##  set on which cells are extracted is to be set on input port 0. The produced output is a
##  `vtkUnstructuredGrid`. Input lines can be either set inside a `vtkPolyData` or a
##  `vtkUnstructuredGrid`. If the input type has an explicit geometry, i.e. the input is not a
##  `vtkPointSet`, then the user can set the output
##  points precision using `OutputPointsPrecisions`. Otherwise, the point precision is set to be the
##  same as the input.
##
##  This filter uses multi-threading if available.
##

## !!!Ignored construct:  # vtkExtractCellsAlongPolyLine_h [NewLine] # vtkExtractCellsAlongPolyLine_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkExtractCellsAlongPolyLine : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractCellsAlongPolyLine :: IsTypeOf ( type ) ; } static vtkExtractCellsAlongPolyLine * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractCellsAlongPolyLine * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractCellsAlongPolyLine * NewInstance ( ) const { return vtkExtractCellsAlongPolyLine :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractCellsAlongPolyLine :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractCellsAlongPolyLine :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkExtractCellsAlongPolyLine * New ( ) ; *
##  Set the source for creating the lines to probe from. Only cells of type VTK_LINE or
##  VTK_POLY_LINE will be processed.
##  virtual void SetSourceConnection ( vtkAlgorithmOutput * input ) ; /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings. OutputPointsPrecision is DEFAULT_PRECISION
##  by default. However, if the input is polymorphic to `vtkPointSet`, then
##  the points precision of the input's points is used instead.
##  virtual void SetOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkExtractCellsAlongPolyLine ( ) ; ~ vtkExtractCellsAlongPolyLine ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int OutputPointsPrecision ; private : vtkExtractCellsAlongPolyLine ( const vtkExtractCellsAlongPolyLine & ) = delete ; void operator = ( const vtkExtractCellsAlongPolyLine & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

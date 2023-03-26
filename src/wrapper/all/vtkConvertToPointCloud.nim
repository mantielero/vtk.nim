## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConvertToPointCloud.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkConvertToPointCloud
##  @brief   Convert any dataset to a point cloud
##
##  This class convert any input dataset into a polydata point cloud
##  containing the same points and point data and either no cells, a single poly vertex cell
##  or as many vertex cell as they are points.
##
##

## !!!Ignored construct:  # vtkConvertToPointCloud_h [NewLine] # vtkConvertToPointCloud_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSPOINTS_EXPORT vtkConvertToPointCloud : public vtkPolyDataAlgorithm { public : static vtkConvertToPointCloud * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConvertToPointCloud :: IsTypeOf ( type ) ; } static vtkConvertToPointCloud * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConvertToPointCloud * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConvertToPointCloud * NewInstance ( ) const { return vtkConvertToPointCloud :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConvertToPointCloud :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConvertToPointCloud :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; typedef enum CellGeneration { NO_CELLS = 0 , POLYVERTEX_CELL = 1 , VERTEX_CELLS = 2 } CellGeneration ; /@{ *
##  Set/Get the cell generation mode.
##  Available modes are:
##  - NO_CELLS:
##  No cells are generated
##  - POLYVERTEX_CELL:
##  A single polyvertex cell is generated (default)
##  - VERTEX_CELLS:
##  One vertex cell by point, not efficient to generate
##  virtual void SetCellGenerationMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CellGenerationMode  to  << _arg ) ; if ( this -> CellGenerationMode != _arg ) { this -> CellGenerationMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetCellGenerationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellGenerationMode  of  << this -> CellGenerationMode ) ; return this -> CellGenerationMode ; } ; /@} protected : vtkConvertToPointCloud ( ) = default ; ~ vtkConvertToPointCloud ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int CellGenerationMode = POLYVERTEX_CELL ; private : vtkConvertToPointCloud ( const vtkConvertToPointCloud & ) = delete ; void operator = ( const vtkConvertToPointCloud & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

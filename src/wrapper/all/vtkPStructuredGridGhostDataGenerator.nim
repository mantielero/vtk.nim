## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkPStructuredGridGhostDataGenerator.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkPStructuredGridGhostDataGenerator
##   structured grids.
##
##
##   A concrete implementation of vtkPDataSEtGhostGenerator for generating ghost
##   data on a partitioned and distributed domain of structured grids.
##
##  @warning
##   <ol>
##    <li>
##     The input multi-block dataset must:
##     <ul>
##       <li> Have the whole-extent set </li>
##       <li> Each block must be an instance of vtkStructuredGrid </li>
##       <li> Each block must have its corresponding global extent set in the
##            meta-data using the PIECE_EXTENT() key </li>
##       <li> All blocks must have the same fields loaded </li>
##       <li> The multi-block structure is consistent on all processes </li>
##     </ul>
##    </li>
##    <li>
##     The code currently does not handle the following cases:
##     <ul>
##       <li>Periodic boundaries</li>
##       <li>Growing ghost layers beyond the extents of the neighboring grid</li>
##     </ul>
##    </li>
##   </ol>
##
##  @sa
##  vtkDataSetGhostGenerator, vtkStructuredGridGhostDataGenerator,
##  vtkPDataSetGhostGenerator, vtkPUniformGridGhostDataGenerator
##

## !!!Ignored construct:  # vtkPStructuredGridGhostDataGenerator_h [NewLine] # vtkPStructuredGridGhostDataGenerator_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkFiltersParallelGeometryModule.h  For export macro # vtkPDataSetGhostGenerator.h [NewLine] class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIndent"
discard "forward decl of vtkPStructuredGridConnectivity"
## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_1_0 ( Use vtkGhostCellsGenerator instead ) VTKFILTERSPARALLELGEOMETRY_EXPORT vtkPStructuredGridGhostDataGenerator : public vtkPDataSetGhostGenerator { public : static vtkPStructuredGridGhostDataGenerator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPDataSetGhostGenerator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPDataSetGhostGenerator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPStructuredGridGhostDataGenerator :: IsTypeOf ( type ) ; } static vtkPStructuredGridGhostDataGenerator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPStructuredGridGhostDataGenerator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPStructuredGridGhostDataGenerator * NewInstance ( ) const { return vtkPStructuredGridGhostDataGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPDataSetGhostGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPStructuredGridGhostDataGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPStructuredGridGhostDataGenerator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkPStructuredGridGhostDataGenerator ( ) ; ~ vtkPStructuredGridGhostDataGenerator ( ) override ; *
##  Registers the grid associated with this instance of multi-block.
##  void RegisterGrids ( vtkMultiBlockDataSet * in ) ; *
##  Creates the output.
##  void CreateGhostedDataSet ( vtkMultiBlockDataSet * in , vtkMultiBlockDataSet * out ) ; *
##  Generates ghost layers.
##  void GenerateGhostLayers ( vtkMultiBlockDataSet * in , vtkMultiBlockDataSet * out ) override ; vtkPStructuredGridConnectivity * GridConnectivity ; private : vtkPStructuredGridGhostDataGenerator ( const vtkPStructuredGridGhostDataGenerator & ) = delete ; void operator = ( const vtkPStructuredGridGhostDataGenerator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkPStructuredGridGhostDataGenerator.h

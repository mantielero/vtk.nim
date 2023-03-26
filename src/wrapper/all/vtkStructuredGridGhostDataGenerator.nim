## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkStructuredGridGhostDataGenerator.h
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
##  @class   vtkStructuredGridGhostDataGenerator
##
##
##   A concrete implementation of vtkDataSetGhostGenerator for generating ghost
##   data on partitioned structured grids on a singled process. For a distributed
##   data-set see vtkPStructuredGridGhostDataGenerator.
##
##  @warning
##  <ol>
##    <li>
##     The input multi-block dataset must:
##     <ul>
##       <li> Have the whole-extent set </li>
##       <li> Each block must be an instance of vtkStructuredGrid </li>
##       <li> Each block must have its corresponding global extent set in the
##            meta-data using the PIECE_EXTENT() key </li>
##       <li> All blocks must have the same fields loaded </li>
##     </ul>
##    </li>
##    <li>
##     The code currently does not handle the following cases:
##     <ul>
##       <li>Ghost cells along Periodic boundaries</li>
##       <li>Growing ghost layers beyond the extents of the neighboring grid</li>
##     </ul>
##    </li>
##  </ol>
##
##  @sa
##  vtkDataSetGhostGenerator, vtkPStructuredGridGhostDataGenerator
##

## !!!Ignored construct:  # vtkStructuredGridGhostDataGenerator_h [NewLine] # vtkStructuredGridGhostDataGenerator_h [NewLine] # vtkDataSetGhostGenerator.h [NewLine] # vtkFiltersGeometryModule.h  For export macro [NewLine]  Forward declarations class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIndent"
discard "forward decl of vtkStructuredGridConnectivity"
## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_1_0 ( Use vtkGhostCellsGenerator instead ) vtkStructuredGridGhostDataGenerator : public vtkDataSetGhostGenerator { public : static vtkStructuredGridGhostDataGenerator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetGhostGenerator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetGhostGenerator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkStructuredGridGhostDataGenerator :: IsTypeOf ( type ) ; } static vtkStructuredGridGhostDataGenerator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkStructuredGridGhostDataGenerator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkStructuredGridGhostDataGenerator * NewInstance ( ) const { return vtkStructuredGridGhostDataGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetGhostGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredGridGhostDataGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredGridGhostDataGenerator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkStructuredGridGhostDataGenerator ( ) ; ~ vtkStructuredGridGhostDataGenerator ( ) override ; *
##  Registers the grid associated with this instance of multi-block.
##  void RegisterGrids ( vtkMultiBlockDataSet * in ) ; *
##  Creates the output.
##  void CreateGhostedDataSet ( vtkMultiBlockDataSet * in , vtkMultiBlockDataSet * out ) ; *
##  Generates ghost layers.
##  void GenerateGhostLayers ( vtkMultiBlockDataSet * in , vtkMultiBlockDataSet * out ) override ; vtkStructuredGridConnectivity * GridConnectivity ; private : vtkStructuredGridGhostDataGenerator ( const vtkStructuredGridGhostDataGenerator & ) = delete ; void operator = ( const vtkStructuredGridGhostDataGenerator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkStructuredGridGhostDataGenerator.h

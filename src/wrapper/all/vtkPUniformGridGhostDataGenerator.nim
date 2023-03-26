## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkPUniformGridGhostDataGenerator.h
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
##  @class   vtkPUniformGridGhostDataGenerator
##   uniform grids.
##
##
##   A concrete implementation of vtkPDataSetGhostGenerator for generating ghost
##   data on a partitioned and distributed domain of uniform grids.
##
##  @warning
##   <ol>
##    <li>
##     The input multi-block dataset must:
##     <ul>
##       <li> Have the whole-extent set </li>
##       <li> Each block must be an instance of vtkUniformGrid </li>
##       <li> Each block must have its corresponding global extent set in the
##            meta-data using the PIECE_EXTENT() key </li>
##       <li> The spacing of each block is the same </li>
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
##  vtkDataSetGhostGenerator,vtkUniformGhostDataGenerator,
##  vtkPDataSetGhostGenerator
##

## !!!Ignored construct:  # vtkPUniformGridGhostDataGenerator_h [NewLine] # vtkPUniformGridGhostDataGenerator_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkFiltersParallelGeometryModule.h  For export macro # vtkPDataSetGhostGenerator.h [NewLine] class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIndent"
discard "forward decl of vtkPStructuredGridConnectivity"
## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_1_0 ( Use vtkGhostCellsGenerator instead ) VTKFILTERSPARALLELGEOMETRY_EXPORT vtkPUniformGridGhostDataGenerator : public vtkPDataSetGhostGenerator { public : static vtkPUniformGridGhostDataGenerator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPDataSetGhostGenerator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPDataSetGhostGenerator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPUniformGridGhostDataGenerator :: IsTypeOf ( type ) ; } static vtkPUniformGridGhostDataGenerator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPUniformGridGhostDataGenerator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPUniformGridGhostDataGenerator * NewInstance ( ) const { return vtkPUniformGridGhostDataGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPDataSetGhostGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPUniformGridGhostDataGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPUniformGridGhostDataGenerator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkPUniformGridGhostDataGenerator ( ) ; ~ vtkPUniformGridGhostDataGenerator ( ) override ; *
##  Registers grids associated with this object instance on this process.
##  void RegisterGrids ( vtkMultiBlockDataSet * in ) ; *
##  A collective operation that computes the global origin of the domain.
##  void ComputeOrigin ( vtkMultiBlockDataSet * in ) ; *
##  A collective operations that computes the global spacing.
##  void ComputeGlobalSpacing ( vtkMultiBlockDataSet * in ) ; *
##  Create ghosted data-set.
##  void CreateGhostedDataSet ( vtkMultiBlockDataSet * in , vtkMultiBlockDataSet * out ) ; *
##  Generates ghost-layers
##  void GenerateGhostLayers ( vtkMultiBlockDataSet * in , vtkMultiBlockDataSet * out ) override ; double GlobalSpacing [ 3 ] ; double GlobalOrigin [ 3 ] ; vtkPStructuredGridConnectivity * GridConnectivity ; private : vtkPUniformGridGhostDataGenerator ( const vtkPUniformGridGhostDataGenerator & ) = delete ; void operator = ( const vtkPUniformGridGhostDataGenerator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkPUniformGridGhostDataGenerator.h

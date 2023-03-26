## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPCellSizeFilter.h
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
##  @class   vtkPCellSizeFilter
##  @brief   Computes cell sizes in parallel.
##
##  Computes the cell sizes for all types of cells in parallel in VTK. For triangles,
##  quads, tets and hexes the static methods in vtkMeshQuality are used.
##  This is done through Verdict for higher accuracy.
##  Other cell types are individually done analytically where possible
##  and breaking into triangles or tets when not possible. When cells are
##  broken into triangles or tets the accuracy may be diminished. By default
##  all sizes are computed but vertex count, length, area and volumetric cells
##  can each be optionally ignored. Individual arrays are used for each
##  requested size (e.g. if length and volume are requested there will be
##  two arrays outputted from this filter). The 4 arrays can be individually
##  named with defaults of VertexCount, Length, Area and Volme. For dimensions
##  of cells that do not have their size computed, a value of 0 will be given.
##  For cells that should have their size computed but can't, the filter will return -1.
##  The ComputeSum option will sum the cell sizes (excluding ghost cells)
##  and put the value into vtkFieldData arrays named with the corresponding cell
##  data array name. For composite datasets the total sum over all blocks will
##  also be added to the top-level block's field data for the summation.
##

## !!!Ignored construct:  # vtkPCellSizeFilter_h [NewLine] # vtkPCellSizeFilter_h [NewLine] # vtkCellSizeFilter.h [NewLine] # vtkFiltersParallelVerdictModule.h  For export macro [NewLine] class VTKFILTERSPARALLELVERDICT_EXPORT vtkPCellSizeFilter : public vtkCellSizeFilter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCellSizeFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCellSizeFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPCellSizeFilter :: IsTypeOf ( type ) ; } static vtkPCellSizeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPCellSizeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPCellSizeFilter * NewInstance ( ) const { return vtkPCellSizeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCellSizeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPCellSizeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPCellSizeFilter :: New ( ) ; } public : ; static vtkPCellSizeFilter * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkPCellSizeFilter ( ) ; ~ vtkPCellSizeFilter ( ) override ; /@{ *
##  Method to compute the global sum information.
##  void ComputeGlobalSum ( double sum [ 4 ] ) override ; /@} private : vtkPCellSizeFilter ( const vtkPCellSizeFilter & ) = delete ; void operator = ( const vtkPCellSizeFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

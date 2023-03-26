## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericDataSetTessellator.h
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
##  @class   vtkGenericDataSetTessellator
##  @brief   tessellates generic, higher-order datasets into linear cells
##
##
##  vtkGenericDataSetTessellator is a filter that subdivides a
##  vtkGenericDataSet into linear elements (i.e., linear VTK
##  cells). Tetrahedras are produced from 3D cells; triangles from 2D cells;
##  and lines from 1D cells. The subdivision process depends on the cell
##  tessellator associated with the input generic dataset, and its associated
##  error metric. (These can be specified by the user if necessary.)
##
##  This filter is typically used to convert a higher-order, complex dataset
##  represented by a vtkGenericDataSet into a conventional vtkDataSet that can
##  be operated on by linear VTK graphics filters (end of pipeline for
##  rendering).
##
##  @sa
##  vtkGenericCellTessellator vtkGenericSubdivisionErrorMetric
##

## !!!Ignored construct:  # vtkGenericDataSetTessellator_h [NewLine] # vtkGenericDataSetTessellator_h [NewLine] # vtkFiltersGenericModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkPointData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKFILTERSGENERIC_EXPORT vtkGenericDataSetTessellator : public vtkUnstructuredGridAlgorithm { public : /@{ *
##  Standard VTK methods.
##  static vtkGenericDataSetTessellator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGenericDataSetTessellator :: IsTypeOf ( type ) ; } static vtkGenericDataSetTessellator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGenericDataSetTessellator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGenericDataSetTessellator * NewInstance ( ) const { return vtkGenericDataSetTessellator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericDataSetTessellator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericDataSetTessellator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Turn on/off generation of a cell centered attribute with ids of the
##  original cells (as an input cell is tessellated into several linear
##  cells).
##  The name of the data array is "OriginalIds". It is true by default.
##  virtual void SetKeepCellIds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  KeepCellIds  to  << _arg ) ; if ( this -> KeepCellIds != _arg ) { this -> KeepCellIds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetKeepCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeepCellIds  of  << this -> KeepCellIds ) ; return this -> KeepCellIds ; } ; virtual void KeepCellIdsOn ( ) { this -> SetKeepCellIds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void KeepCellIdsOff ( ) { this -> SetKeepCellIds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off merging of coincident points. Note that is merging is
##  on, points with different point attributes (e.g., normals) are merged,
##  which may cause rendering artifacts.
##  virtual void SetKeepCellIdsMerging ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Merging  to  << _arg ) ; if ( this -> Merging != _arg ) { this -> Merging = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetKeepCellIdsMerging ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Merging  of  << this -> Merging ) ; return this -> Merging ; } ; virtual void MergingOn ( ) { this -> SetKeepCellIdsMerging ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MergingOff ( ) { this -> SetKeepCellIdsMerging ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set / get a spatial locator for merging points. By
##  default an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified.
##  void CreateDefaultLocator ( ) ; *
##  Return the MTime also considering the locator.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkGenericDataSetTessellator ( ) ; ~ vtkGenericDataSetTessellator ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ;  See Set/Get KeepCellIds() for explanations. vtkTypeBool KeepCellIds ;  Used internal by vtkGenericAdaptorCell::Tessellate() vtkPointData * InternalPD ; vtkTypeBool Merging ; vtkIncrementalPointLocator * Locator ; private : vtkGenericDataSetTessellator ( const vtkGenericDataSetTessellator & ) = delete ; void operator = ( const vtkGenericDataSetTessellator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

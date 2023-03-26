## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSpatialRepresentationFilter.h
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
##  @class   vtkSpatialRepresentationFilter
##  @brief   generate polygonal model of spatial search object (i.e., a vtkLocator)
##
##  vtkSpatialRepresentationFilter generates an polygonal representation of a
##  spatial search (vtkLocator) object. The representation varies depending
##  upon the nature of the spatial search object. For example, the
##  representation for vtkOBBTree is a collection of oriented bounding
##  boxes. This input to this filter is a dataset of any type, and the output
##  is polygonal data. You must also specify the spatial search object to
##  use.
##
##  Generally spatial search objects are used for collision detection and
##  other geometric operations, but in this filter one or more levels of
##  spatial searchers can be generated to form a geometric approximation to
##  the input data. This is a form of data simplification, generally used to
##  accelerate the rendering process. Or, this filter can be used as a
##  debugging/ visualization aid for spatial search objects.
##
##  This filter can generate one or more  vtkPolyData blocks corresponding to
##  different levels in the spatial search tree. The block ids range from 0
##  (root level) to MaximumLevel. Note that the block for level "id" is not computed
##  unless a AddLevel(id) method is issued. Thus, if you desire three levels of output
##  (say 2,4,7), you would have to invoke AddLevel(2), AddLevel(4), and
##  AddLevel(7). If GenerateLeaves is set to true (off by default), all leaf nodes
##  of the locator (which may be at different levels) are computed and stored in
##  block with id MaximumLevel + 1.
##
##  @sa
##  vtkLocator vtkPointLocator vtkCellLocator vtkOBBTree
##

## !!!Ignored construct:  # vtkSpatialRepresentationFilter_h [NewLine] # vtkSpatialRepresentationFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] class vtkLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataSet"
discard "forward decl of vtkSpatialRepresentationFilterInternal"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkSpatialRepresentationFilter : public vtkMultiBlockDataSetAlgorithm { public : static vtkSpatialRepresentationFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSpatialRepresentationFilter :: IsTypeOf ( type ) ; } static vtkSpatialRepresentationFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSpatialRepresentationFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSpatialRepresentationFilter * NewInstance ( ) const { return vtkSpatialRepresentationFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSpatialRepresentationFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSpatialRepresentationFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the locator that will be used to generate the representation.
##  virtual void SetSpatialRepresentation ( vtkLocator * ) ; virtual vtkLocator * GetnameSpatialRepresentation ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SpatialRepresentation  address  << static_cast < vtkLocator * > ( this -> SpatialRepresentation ) ) ; return this -> SpatialRepresentation ; } ; /@} /@{ *
##  Get the maximum level that is available. Populated during
##  RequestData().
##  virtual int GetMaximumLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumLevel  of  << this -> MaximumLevel ) ; return this -> MaximumLevel ; } ; /@} *
##  Add a level to be computed.
##  void AddLevel ( int level ) ; *
##  Remove all levels.
##  void ResetLevels ( ) ; /@{ *
##  Turn on/off the generation of leaf nodes. Off by default.
##  virtual void SetGenerateLeaves ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateLeaves  to  << _arg ) ; if ( this -> GenerateLeaves != _arg ) { this -> GenerateLeaves = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMaximumLevelGenerateLeaves ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateLeaves  of  << this -> GenerateLeaves ) ; return this -> GenerateLeaves ; } ; virtual void GenerateLeavesOn ( ) { this -> SetGenerateLeaves ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateLeavesOff ( ) { this -> SetGenerateLeaves ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkSpatialRepresentationFilter ( ) ; ~ vtkSpatialRepresentationFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int MaximumLevel ; bool GenerateLeaves ; vtkLocator * SpatialRepresentation ; void ReportReferences ( vtkGarbageCollector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkSpatialRepresentationFilter ( const vtkSpatialRepresentationFilter & ) = delete ; void operator = ( const vtkSpatialRepresentationFilter & ) = delete ; vtkSpatialRepresentationFilterInternal * Internal ; } ;
## Error: token expected: ; but got: [identifier]!!!

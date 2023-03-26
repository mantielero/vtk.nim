## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFeatureEdges.h
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
##  @class   vtkFeatureEdges
##  @brief   extract interior, boundary, non-manifold, and/or
##           sharp edges from polygonal data
##
##  vtkFeatureEdges is a filter to extract special types of edges from
##  input polygonal data. These edges are either 1) boundary (used by
##  one polygon) or a line cell; 2) non-manifold (used by three or more
##  polygons); 3) feature edges (edges used by two triangles and whose
##  dihedral angle > FeatureAngle); or 4) manifold edges (edges used by
##  exactly two polygons). These edges may be extracted in any
##  combination. Edges may also be "colored" (i.e., scalar values assigned)
##  based on edge type. The cell coloring is assigned to the cell data of
##  the extracted edges.
##
##  @warning
##  To see the coloring of the lines you may have to set the ScalarMode
##  instance variable of the mapper to SetScalarModeToUseCellData(). (This
##  is only a problem if there are point data scalars.)
##
##  @sa
##  vtkExtractEdges
##

## !!!Ignored construct:  # vtkFeatureEdges_h [NewLine] # vtkFeatureEdges_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkIncrementalPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkFeatureEdges : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFeatureEdges :: IsTypeOf ( type ) ; } static vtkFeatureEdges * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFeatureEdges * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFeatureEdges * NewInstance ( ) const { return vtkFeatureEdges :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFeatureEdges :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFeatureEdges :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Construct an instance with feature angle = 30; all types of edges
##  (except manifold edges) are extracted and colored.
##  static vtkFeatureEdges * New ( ) ; /@{ *
##  Methods for turning the extraction of all types of edges on;
##  and turning the extraction of all types of edges off.
##  void ExtractAllEdgeTypesOn ( ) ; void ExtractAllEdgeTypesOff ( ) ; /@} /@{ *
##  Turn on/off the extraction of boundary edges.
##  virtual void SetBoundaryEdges ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BoundaryEdges  to  << _arg ) ; if ( this -> BoundaryEdges != _arg ) { this -> BoundaryEdges = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBoundaryEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoundaryEdges  of  << this -> BoundaryEdges ) ; return this -> BoundaryEdges ; } ; virtual void BoundaryEdgesOn ( ) { this -> SetBoundaryEdges ( static_cast < bool > ( 1 ) ) ; } virtual void BoundaryEdgesOff ( ) { this -> SetBoundaryEdges ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the extraction of feature edges.
##  virtual void SetBoundaryEdgesFeatureEdges ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FeatureEdges  to  << _arg ) ; if ( this -> FeatureEdges != _arg ) { this -> FeatureEdges = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBoundaryEdgesFeatureEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeatureEdges  of  << this -> FeatureEdges ) ; return this -> FeatureEdges ; } ; virtual void FeatureEdgesOn ( ) { this -> SetBoundaryEdgesFeatureEdges ( static_cast < bool > ( 1 ) ) ; } virtual void FeatureEdgesOff ( ) { this -> SetBoundaryEdgesFeatureEdges ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the feature angle for extracting feature edges.
##  virtual void SetFeatureAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FeatureAngle  to  << _arg ) ; if ( this -> FeatureAngle != ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ) { this -> FeatureAngle = ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetFeatureAngleMinValue ( ) { return 0.0 ; } virtual double GetFeatureAngleMaxValue ( ) { return 180.0 ; } ; virtual double GetBoundaryEdgesFeatureEdgesFeatureAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeatureAngle  of  << this -> FeatureAngle ) ; return this -> FeatureAngle ; } ; /@} /@{ *
##  Turn on/off the extraction of non-manifold edges.
##  virtual void SetBoundaryEdgesFeatureEdgesNonManifoldEdges ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NonManifoldEdges  to  << _arg ) ; if ( this -> NonManifoldEdges != _arg ) { this -> NonManifoldEdges = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBoundaryEdgesFeatureEdgesFeatureAngleNonManifoldEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NonManifoldEdges  of  << this -> NonManifoldEdges ) ; return this -> NonManifoldEdges ; } ; virtual void NonManifoldEdgesOn ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdges ( static_cast < bool > ( 1 ) ) ; } virtual void NonManifoldEdgesOff ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdges ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the extraction of manifold edges. This typically
##  correspond to interior edges.
##  virtual void SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdges ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ManifoldEdges  to  << _arg ) ; if ( this -> ManifoldEdges != _arg ) { this -> ManifoldEdges = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBoundaryEdgesFeatureEdgesFeatureAngleNonManifoldEdgesManifoldEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ManifoldEdges  of  << this -> ManifoldEdges ) ; return this -> ManifoldEdges ; } ; virtual void ManifoldEdgesOn ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdges ( static_cast < bool > ( 1 ) ) ; } virtual void ManifoldEdgesOff ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdges ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off passing input lines. If this flag is on, then all cells living inside the `Lines`
##  cell array of the input are copied into the output.
##
##  @note Input poly lines are split into separate lines in the output.
##  virtual void SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLines ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassLines  to  << _arg ) ; if ( this -> PassLines != _arg ) { this -> PassLines = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBoundaryEdgesFeatureEdgesFeatureAngleNonManifoldEdgesManifoldEdgesPassLines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassLines  of  << this -> PassLines ) ; return this -> PassLines ; } ; virtual void PassLinesOn ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLines ( static_cast < bool > ( 1 ) ) ; } virtual void PassLinesOff ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLines ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the coloring of edges by type.
##  virtual void SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLinesColoring ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Coloring  to  << _arg ) ; if ( this -> Coloring != _arg ) { this -> Coloring = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBoundaryEdgesFeatureEdgesFeatureAngleNonManifoldEdgesManifoldEdgesPassLinesColoring ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Coloring  of  << this -> Coloring ) ; return this -> Coloring ; } ; virtual void ColoringOn ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLinesColoring ( static_cast < bool > ( 1 ) ) ; } virtual void ColoringOff ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLinesColoring ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off creating edges at ghost interfaces. An edge is at a ghost interface
##  if it belongs to at least one ghost cell. This is turned on by default.
##  When turned off, only edges that solely belong to ghost cells are discarded from the output.
##  When turned on, edges are discarded if the belong to at least one ghost cell.
##
##  @note In order for the interfaces between ranks to be removed, ghost cells must be first
##  generated.
##  @sa vtkGhostCellsGenerator
##  virtual void SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLinesColoringRemoveGhostInterfaces ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RemoveGhostInterfaces  to  << _arg ) ; if ( this -> RemoveGhostInterfaces != _arg ) { this -> RemoveGhostInterfaces = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBoundaryEdgesFeatureEdgesFeatureAngleNonManifoldEdgesManifoldEdgesPassLinesColoringRemoveGhostInterfaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RemoveGhostInterfaces  of  << this -> RemoveGhostInterfaces ) ; return this -> RemoveGhostInterfaces ; } ; virtual void RemoveGhostInterfacesOn ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLinesColoringRemoveGhostInterfaces ( static_cast < bool > ( 1 ) ) ; } virtual void RemoveGhostInterfacesOff ( ) { this -> SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLinesColoringRemoveGhostInterfaces ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set / get a spatial locator for merging points. By
##  default an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified.
##  void CreateDefaultLocator ( ) ; *
##  Return MTime also considering the locator.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set/get the desired precision for the output point type. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetBoundaryEdgesFeatureEdgesNonManifoldEdgesManifoldEdgesPassLinesColoringRemoveGhostInterfacesOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetBoundaryEdgesFeatureEdgesFeatureAngleNonManifoldEdgesManifoldEdgesPassLinesColoringRemoveGhostInterfacesOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkFeatureEdges ( ) ; ~ vtkFeatureEdges ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double FeatureAngle ; bool BoundaryEdges ; bool FeatureEdges ; bool NonManifoldEdges ; bool ManifoldEdges ; bool PassLines ; bool Coloring ; bool PassGlobalIds ; bool RemoveGhostInterfaces ; int OutputPointsPrecision ; vtkIncrementalPointLocator * Locator ; private : vtkFeatureEdges ( const vtkFeatureEdges & ) = delete ; void operator = ( const vtkFeatureEdges & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

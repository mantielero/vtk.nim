## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXdmfHeavyData.h
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

## !!!Ignored construct:  # vtkXdmfHeavyData_h [NewLine] # vtkXdmfHeavyData_h [NewLine] # vtk_xdmf2.h [NewLine] # VTKXDMF2_HEADER ( XdmfDataItem . h ) [NewLine] # VTKXDMF2_HEADER ( XdmfGrid . h ) won't compile without it # vtkIOXdmf2Module.h  For export macro [NewLine] class vtkAlgorithm ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkPoints"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkXdmfDomain"
## !!!Ignored construct:  class VTKIOXDMF2_EXPORT vtkXdmfHeavyData { vtkXdmfDomain * Domain ; xdmf2 :: XdmfDataItem DataItem ; vtkAlgorithm * Reader ; public :  These must be set before using this class. int Piece ; int NumberOfPieces ; int GhostLevels ; int Extents [ 6 ] ;  < these are original extents without the stride taken in
##    consideration int Stride [ 3 ] ; XdmfFloat64 Time ; public : vtkXdmfHeavyData ( vtkXdmfDomain * domain , vtkAlgorithm * reader ) ; ~ vtkXdmfHeavyData ( ) ;  Description: vtkDataObject * ReadData ( xdmf2 :: XdmfGrid * xmfGrid , int blockId = - 1 ) ;  Description: vtkDataObject * ReadData ( ) ;  Description:
##  Returns the VTKCellType for the given xdmf topology. Returns VTK_EMPTY_CELL
##  on error and VTK_NUMBER_OF_CELL_TYPES for XDMF_MIXED. static int GetVTKCellType ( XdmfInt32 topologyType ) ;  Description:
##  Returns the number of points per cell. -1 for error. 0 when no fixed number
##  of points possible. static int GetNumberOfPointsPerCell ( int vtk_cell_type ) ; private :  Description:
##  Read a temporal collection. vtkDataObject * ReadTemporalCollection ( xdmf2 :: XdmfGrid * xmfTemporalCollection , int blockId ) ;  Description:
##  Read a spatial-collection or a tree. vtkDataObject * ReadComposite ( xdmf2 :: XdmfGrid * xmfColOrTree ) ;  Description:
##  Read a non-composite grid. Note here uniform has nothing to do with
##  vtkUniformGrid but to what Xdmf's GridType="Uniform". vtkDataObject * ReadUniformData ( xdmf2 :: XdmfGrid * xmfGrid , int blockId ) ;  Description:
##  Reads the topology and geometry for an unstructured grid. Does not read any
##  data attributes or geometry. vtkDataObject * ReadUnstructuredGrid ( xdmf2 :: XdmfGrid * xmfGrid ) ;  Description:
##  Read the image data. Simply initializes the extents and origin and spacing
##  for the image, doesn't really read any attributes including the active
##  point attributes. vtkImageData * RequestImageData ( xdmf2 :: XdmfGrid * xmfGrid , bool use_uniform_grid ) ;  Description:
##  Reads the geometry and topology for a vtkStructuredGrid. vtkStructuredGrid * RequestStructuredGrid ( xdmf2 :: XdmfGrid * xmfGrid ) ;  Description:
##  Reads the geometry and topology for a vtkRectilinearGrid. vtkRectilinearGrid * RequestRectilinearGrid ( xdmf2 :: XdmfGrid * xmfGrid ) ;  Description:
##  Reads geometry for vtkUnstructuredGrid or vtkStructuredGrid i.e. of
##  vtkPointSet subclasses. The extents only make sense when reading
##  vtkStructuredGrid. If non-null, then the only the points for the sub-grid
##  are read. vtkPoints * ReadPoints ( xdmf2 :: XdmfGeometry * xmfGeometry , int * update_extents = nullptr , int * whole_extents = nullptr ) ;  Description:
##  Read attributes. bool ReadAttributes ( vtkDataSet * dataSet , xdmf2 :: XdmfGrid * xmfGrid , int * update_extents = 0 ) ;  Description:
##  Reads an attribute.
##  If update_extents are non-null, then we are reading structured attributes
##  and we read only the sub-set specified by update_extents. vtkDataArray * ReadAttribute ( xdmf2 :: XdmfAttribute * xmfAttribute , int data_dimensionality , int * update_extents = 0 ) ;  Description:
##  Read sets that mark ghost cells/nodes and then create attribute arrays for
##  marking the cells as such. bool ReadGhostSets ( vtkDataSet * ds , xdmf2 :: XdmfGrid * xmfGrid , int * update_extents = 0 ) ; vtkMultiBlockDataSet * ReadSets ( vtkDataSet * dataSet , xdmf2 :: XdmfGrid * xmfGrid , int * update_extents = 0 ) ;  Description:
##  Used when reading node-sets.
##  Creates a new dataset with points with given ids extracted from the input
##  dataset. vtkDataSet * ExtractPoints ( xdmf2 :: XdmfSet * xmfSet , vtkDataSet * dataSet ) ;  Description:
##  Used when reading cell-sets.
##  Creates a new dataset with cells with the given ids extracted from the
##  input dataset. vtkDataSet * ExtractCells ( xdmf2 :: XdmfSet * xmfSet , vtkDataSet * dataSet ) ;  Description:
##  Used when reading face-sets.
##  Creates a new dataset with faces selected by the set, extracting them from
##  the input dataset. vtkDataSet * ExtractFaces ( xdmf2 :: XdmfSet * xmfSet , vtkDataSet * dataSet ) ;  Description:
##  Used when reading edge-sets.
##  Creates a new dataset with edges selected by the set, extracting them from
##  the input dataset. vtkDataSet * ExtractEdges ( xdmf2 :: XdmfSet * xmfSet , vtkDataSet * dataSet ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkXdmfHeavyData.h

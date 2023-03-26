## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkModifiedBSPTree.h
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
## =========================================================================
##   This code is derived from an earlier work and is distributed
##   with permission from, and thanks to
##
##   ------------------------------------------
##   Copyright (C) 1997-2000 John Biddiscombe
##   Rutherford Appleton Laboratory,
##   Chilton, Oxon, England
##   ------------------------------------------
##   Copyright (C) 2000-2004 John Biddiscombe
##   Skipping Mouse Software Ltd,
##   Blewbury, England
##   ------------------------------------------
##   Copyright (C) 2004-2009 John Biddiscombe
##   CSCS - Swiss National Supercomputing Centre
##   Galleria 2 - Via Cantonale
##   CH-6928 Manno, Switzerland
##   ------------------------------------
## =========================================================================
## *
##  @class   vtkModifiedBSPTree
##  @brief   Generate axis aligned BBox tree for ray-casting and other Locator based searches
##
##
##  vtkModifiedBSPTree creates an evenly balanced BSP tree using a top down
##  implementation. Axis aligned split planes are found which evenly divide
##  cells into two buckets. Generally a split plane will intersect some cells
##  and these are usually stored in both child nodes of the current parent.
##  (Or split into separate cells which we cannot consider in this case).
##  Storing cells in multiple buckets creates problems associated with multiple
##  tests against rays and increases the required storage as complex meshes
##  will have many cells straddling a split plane (and further splits may
##  cause multiple copies of these).
##
##  During a discussion with Arno Formella in 1998 he suggested using
##  a third child node to store objects which straddle split planes. I've not
##  seen this published (Yes! - see below), but thought it worth trying. This
##  implementation of the BSP tree creates a third child node for storing cells
##  laying across split planes, the third cell may overlap the other two, but the
##  two 'proper' nodes otherwise conform to usual BSP rules.
##
##  The advantage of this implementation is cells only ever lie in one node
##  and mailbox testing is avoided. All BBoxes are axis aligned and a ray cast
##  uses an efficient search strategy based on near/far nodes and rejects
##  all BBoxes using simple tests.
##
##  For fast raytracing, 6 copies of cell lists are stored in each leaf node
##  each list is in axis sorted order +/- x,y,z and cells are always tested
##  in the direction of the ray dominant axis. Once an intersection is found
##  any cell or BBox with a closest point further than the I-point can be
##  instantly rejected and raytracing stops as soon as no nodes can be closer
##  than the current best intersection point.
##
##  The addition of the 'middle' node upsets the optimal balance of the tree,
##  but is a minor overhead during the raytrace. Each child node is contracted
##  such that it tightly fits all cells inside it, enabling further ray/box
##  rejections.
##
##  This class is intended for persons requiring many ray tests and is optimized
##  for this purpose. As no cell ever lies in more than one leaf node, and parent
##  nodes do not maintain cell lists, the memory overhead of the sorted cell
##  lists is 6*num_cells*4 for 6 lists of ints, each num_cells in length.
##  The memory requirement of the nodes themselves is usually of minor
##  significance.
##
##  Subdivision is controlled by MaxCellsPerNode - any node with more than
##  this number will be subdivided providing a good split plane can be found and
##  the max depth is not exceeded.
##
##  The average cells per leaf will usually be around half the MaxCellsPerNode,
##  though the middle node is usually sparsely populated and lowers the average
##  slightly. The middle node will not be created when not needed.
##  Subdividing down to very small cells per node is not generally suggested
##  as then the 6 stored cell lists are effectively redundant.
##
##  Values of MaxCellsPerNode of around 16->128 depending on dataset size will
##  usually give good results.
##
##  Cells are only sorted into 6 lists once - before tree creation, each node
##  segments the lists and passes them down to the new child nodes whilst
##  maintaining sorted order. This makes for an efficient subdivision strategy.
##
##  @warning
##  vtkModifiedBSPTree utilizes the following parent class parameters:
##  - Level                       (default 8)
##  - MaxLevel                    (default 8)
##  - NumberOfCellsPerNode        (default 32)
##  - UseExistingSearchStructure  (default false)
##  - CacheCellBounds             (default true)
##
##  vtkModifiedBSPTree does NOT utilize the following parameters:
##  - Automatic
##  - Tolerance
##  - RetainCellLists
##
##  NB. The following reference has been sent to me
##  \code
##    @Article{formella-1995-ray,
##      author =     "Arno Formella and Christian Gill",
##      title =      "{Ray Tracing: A Quantitative Analysis and a New
##                    Practical Algorithm}",
##      journal =    "{The Visual Computer}",
##      year =       "{1995}",
##      month =       dec,
##      pages =      "{465--476}",
##      volume =     "{11}",
##      number =     "{9}",
##      publisher =  "{Springer}",
##      keywords =   "{ray tracing, space subdivision, plane traversal,
##                     octree, clustering, benchmark scenes}",
##      annote =     "{We present a new method to accelerate the process of
##                     finding nearest ray--object intersections in ray
##                     tracing. The algorithm consumes an amount of memory
##                     more or less linear in the number of objects. The basic
##                     ideas can be characterized with a modified BSP--tree
##                     and plane traversal. Plane traversal is a fast linear
##                     time algorithm to find the closest intersection point
##                     in a list of bounding volumes hit by a ray. We use
##                     plane traversal at every node of the high outdegree
##                     BSP--tree. Our implementation is competitive to fast
##                     ray tracing programs. We present a benchmark suite
##                     which allows for an extensive comparison of ray tracing
##                     algorithms.}",
##    }
##  \endcode
##
##  @par Thanks:
##   John Biddiscombe for developing and contributing this class
##
##  @todo
##  -------------
##  Implement intersection heap for testing rays against transparent objects
##
##  @par Style:
##  --------------
##  This class is currently maintained by J. Biddiscombe who has specially
##  requested that the code style not be modified to the Kitware standard.
##  Please respect the contribution of this class by keeping the style
##  as close as possible to the author's original.
##
##  @sa
##  vtkAbstractCellLocator vtkCellLocator vtkStaticCellLocator vtkCellTreeLocator vtkOBBTree
##

## !!!Ignored construct:  # vtkModifiedBSPTree_h [NewLine] # vtkModifiedBSPTree_h [NewLine] # vtkAbstractCellLocator.h [NewLine] # vtkFiltersFlowPathsModule.h  For export macro # vtkSmartPointer.h  required because it is nice [NewLine] class Sorted_cell_extents_Lists ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of BSPNode"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdListCollection"
## !!!Ignored construct:  class VTKFILTERSFLOWPATHS_EXPORT vtkModifiedBSPTree : public vtkAbstractCellLocator { public : /@{ *
##  Standard methods to print and obtain type-related information.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractCellLocator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractCellLocator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkModifiedBSPTree :: IsTypeOf ( type ) ; } static vtkModifiedBSPTree * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkModifiedBSPTree * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkModifiedBSPTree * NewInstance ( ) const { return vtkModifiedBSPTree :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractCellLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkModifiedBSPTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkModifiedBSPTree :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Construct with maximum 32 cells per node. (average 16->31)
##  static vtkModifiedBSPTree * New ( ) ;  Re-use any superclass signatures that we don't override. using vtkAbstractCellLocator :: FindCell ; using vtkAbstractCellLocator :: IntersectWithLine ; *
##  Return intersection point (if any) AND the cell which was intersected by
##  the finite line. The cell is returned as a cell id and as a generic cell.
##
##  For other IntersectWithLine signatures, see vtkAbstractCellLocator.
##  int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId , vtkIdType & cellId , vtkGenericCell * cell ) override ; *
##  Take the passed line segment and intersect it with the data set.
##  The return value of the function is 0 if no intersections were found.
##  For each intersection with the bounds of a cell or with a cell (if a cell is provided),
##  the points and cellIds have the relevant information added sorted by t.
##  If points or cellIds are nullptr pointers, then no information is generated for that list.
##
##  For other IntersectWithLine signatures, see vtkAbstractCellLocator.
##  int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , const double tol , vtkPoints * points , vtkIdList * cellIds , vtkGenericCell * cell ) override ; *
##  Take the passed line segment and intersect it with the data set.
##  For each intersection with the bounds of a cell, the cellIds
##  have the relevant information added sort by t. If cellIds is nullptr
##  pointer, then no information is generated for that list.
##
##  Reimplemented from vtkAbstractCellLocator to showcase that it's a supported function.
##  void FindCellsAlongLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tolerance , vtkIdList * cellsIds ) override { this -> Superclass :: FindCellsAlongLine ( p1 , p2 , tolerance , cellsIds ) ; } *
##  Find the cell containing a given point. returns -1 if no cell found
##  the cell parameters are copied into the supplied variables, a cell must
##  be provided to store the information.
##
##  For other FindCell signatures, see vtkAbstractCellLocator.
##  vtkIdType FindCell ( double x [ 3 ] , double vtkNotUsed ( tol2 ) , vtkGenericCell * GenCell , int & subId , double pcoords [ 3 ] , double * weights ) override ; *
##  After subdivision has completed, one may wish to query the tree to find
##  which cells are in which leaf nodes. This function returns a list
##  which holds a cell Id list for each leaf node.
##  vtkIdListCollection * GetLeafNodeCellInformation ( ) ; *
##  Generate BBox representation of all leaf nodes
##  virtual void GenerateRepresentationLeafs ( vtkPolyData * pd ) ; /@{ *
##  Satisfy vtkLocator abstract interface.
##  void GenerateRepresentation ( int level , vtkPolyData * pd ) override ; void FreeSearchStructure ( ) override ; void BuildLocator ( ) override ; void ForceBuildLocator ( ) override ; /@} *
##  Shallow copy of a vtkModifiedBSPTree.
##  void ShallowCopy ( vtkAbstractCellLocator * locator ) override ; protected : vtkModifiedBSPTree ( ) ; ~ vtkModifiedBSPTree ( ) override ; void BuildLocatorInternal ( ) override ; std :: shared_ptr < BSPNode > mRoot ;  bounding box root node int npn ; int nln ; int tot_depth ;  The main subdivision routine void Subdivide ( BSPNode * node , Sorted_cell_extents_Lists * lists , vtkDataSet * dataSet , vtkIdType nCells , int depth , int maxlevel , vtkIdType maxCells , int & MaxDepth ) ; private : vtkModifiedBSPTree ( const vtkModifiedBSPTree & ) = delete ; void operator = ( const vtkModifiedBSPTree & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## /////////////////////////////////////////////////////////////////////////////
##  BSP Node
##  A BSP Node is a BBox - axis aligned etc etc
## /////////////////////////////////////////////////////////////////////////////

when not defined(DOXYGEN_SHOULD_SKIP_THIS):
  type
    VTKFILTERSFLOWPATHS_EXPORTVTKFILTERSFLOWPATHS_EXPORTBSPNode* {.importcpp: "VTKFILTERSFLOWPATHS_EXPORT::VTKFILTERSFLOWPATHS_EXPORT::BSPNode",
        header: "vtkModifiedBSPTree.h", bycopy.} = object ##  Constructor
                                                     ##  The child nodes of this one (if present - nullptr otherwise)
      Bounds* {.importc: "Bounds".}: array[6, cdouble]
      ##  The axis we subdivide this voxel along
      ##  Just for reference
      ##  the number of cells in this node
      ##  6 lists, sorted after the 6 dominant axes
      ##  Order nodes as near/mid far relative to ray

  proc constructVTKFILTERSFLOWPATHS_EXPORTVTKFILTERSFLOWPATHS_EXPORTBSPNode*(): VTKFILTERSFLOWPATHS_EXPORTVTKFILTERSFLOWPATHS_EXPORTBSPNode {.
      constructor, importcpp: "VTKFILTERSFLOWPATHS_EXPORT::VTKFILTERSFLOWPATHS_EXPORT::BSPNode(@)",
      header: "vtkModifiedBSPTree.h".}
  proc destroyVTKFILTERSFLOWPATHS_EXPORTVTKFILTERSFLOWPATHS_EXPORTBSPNode*(
      this: var VTKFILTERSFLOWPATHS_EXPORTVTKFILTERSFLOWPATHS_EXPORTBSPNode) {.
      importcpp: "#.~BSPNode()", header: "vtkModifiedBSPTree.h".}
  proc setMin*(this: var VTKFILTERSFLOWPATHS_EXPORTVTKFILTERSFLOWPATHS_EXPORTBSPNode;
              minx: cdouble; miny: cdouble; minz: cdouble) {.importcpp: "setMin",
      header: "vtkModifiedBSPTree.h".}
  proc setMax*(this: var VTKFILTERSFLOWPATHS_EXPORTVTKFILTERSFLOWPATHS_EXPORTBSPNode;
              maxx: cdouble; maxy: cdouble; maxz: cdouble) {.importcpp: "setMax",
      header: "vtkModifiedBSPTree.h".}
  proc Inside*(this: VTKFILTERSFLOWPATHS_EXPORTVTKFILTERSFLOWPATHS_EXPORTBSPNode;
              point: array[3, cdouble]): bool {.noSideEffect, importcpp: "Inside",
      header: "vtkModifiedBSPTree.h".}
  ## !!!Ignored construct:  getDominantAxis ( const double dir [ 3 ] ) ;
  ## Error: token expected: ) but got: [identifier]!!!
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDendrogramItem.h
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
##  @class   vtkDendrogramItem
##  @brief   A 2D graphics item for rendering a tree as
##  a dendrogram
##
##
##  Draw a tree as a dendrogram
##  The input tree's vertex data must contain at least two arrays.
##  The first required array is a vtkStringArray called "node name".
##  This array is used to label the leaf nodes of the tree.
##  The second required array is a scalar array called "node weight".
##  This array is used by vtkTreeLayoutStrategy to set any particular
##  node's distance from the root of the tree.
##
##  The vtkNewickTreeReader automatically initializes both of these
##  required arrays in its output tree.
##
##  .SEE ALSO
##  vtkTree vtkNewickTreeReader
##

## !!!Ignored construct:  # vtkDendrogramItem_h [NewLine] # vtkDendrogramItem_h [NewLine] # vtkContextItem.h [NewLine] # vtkViewsInfovisModule.h  For export macro [NewLine] # vtkNew.h  For vtkNew ivars # vtkSmartPointer.h  For vtkSmartPointer ivars # vtkStdString.h  For SetGet ivars # vtkVector.h  For vtkVector2f ivar [NewLine] class vtkColorLegend ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkGraphLayout"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkPruneTreeFilter"
discard "forward decl of vtkTree"
## !!!Ignored construct:  class VTKVIEWSINFOVIS_EXPORT vtkDendrogramItem : public vtkContextItem { public : static vtkDendrogramItem * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkContextItem Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkContextItem :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDendrogramItem :: IsTypeOf ( type ) ; } static vtkDendrogramItem * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDendrogramItem * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDendrogramItem * NewInstance ( ) const { return vtkDendrogramItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDendrogramItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDendrogramItem :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set the tree that this item draws.  Note that this tree's vertex data
##  must contain a vtkStringArray called "node name".  The vtkNewickTreeReader
##  automatically creates this required array for you.
##  virtual void SetTree ( vtkTree * tree ) ; *
##  Get the tree that this item draws.
##  vtkTree * GetTree ( ) ; *
##  Collapse subtrees until there are only n leaf nodes left in the tree.
##  The leaf nodes that remain are those that are closest to the root.
##  Any subtrees that were collapsed prior to this function being called
##  may be re-expanded.
##  void CollapseToNumberOfLeafNodes ( unsigned int n ) ; *
##  Get the collapsed tree
##  vtkTree * GetPrunedTree ( ) ; *
##  Indicate which array within the Tree's VertexData should be used to
##  color the tree.  The specified array must be a vtkDoubleArray.
##  By default, the tree will be drawn in black.
##  void SetColorArray ( const char * arrayName ) ; /@{ *
##  Get/set whether or not leaf nodes should be extended so that they all line
##  up vertically.  The default is to NOT extend leaf nodes.  When extending
##  leaf nodes, the extra length is drawn in grey so as to distinguish it from
##  the actual length of the leaf node.
##  virtual void SetExtendLeafNodes ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtendLeafNodes  to  << _arg ) ; if ( this -> ExtendLeafNodes != _arg ) { this -> ExtendLeafNodes = _arg ; this -> Modified ( ) ; } } ; virtual bool GetExtendLeafNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtendLeafNodes  of  << this -> ExtendLeafNodes ) ; return this -> ExtendLeafNodes ; } ; virtual void ExtendLeafNodesOn ( ) { this -> SetExtendLeafNodes ( static_cast < bool > ( 1 ) ) ; } virtual void ExtendLeafNodesOff ( ) { this -> SetExtendLeafNodes ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Set which way the tree should face within the visualization.  The default
##  is for the tree to be drawn left to right.
##  void SetOrientation ( int orientation ) ; *
##  Get the current tree orientation.
##  int GetOrientation ( ) ; *
##  Get the rotation angle (in degrees) that corresponds to the given
##  tree orientation.  For the default orientation (LEFT_TO_RIGHT), this
##  is 90 degrees.
##  double GetAngleForOrientation ( int orientation ) ; *
##  Get the angle that vertex labels should be rotated for the corresponding
##  tree orientation.  For the default orientation (LEFT_TO_RIGHT), this
##  is 0 degrees.
##  double GetTextAngleForOrientation ( int orientation ) ; /@{ *
##  Get/Set whether or not leaf nodes should be labeled by this class.
##  Default is true.
##  virtual void SetExtendLeafNodesDrawLabels ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DrawLabels  to  << _arg ) ; if ( this -> DrawLabels != _arg ) { this -> DrawLabels = _arg ; this -> Modified ( ) ; } } ; virtual bool GetExtendLeafNodesDrawLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawLabels  of  << this -> DrawLabels ) ; return this -> DrawLabels ; } ; virtual void DrawLabelsOn ( ) { this -> SetExtendLeafNodesDrawLabels ( static_cast < bool > ( 1 ) ) ; } virtual void DrawLabelsOff ( ) { this -> SetExtendLeafNodesDrawLabels ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the position of the dendrogram.
##  virtual void SetPosition ( float _arg1 , float _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Position  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> Position [ 0 ] != _arg1 ) || ( this -> Position [ 1 ] != _arg2 ) ) { this -> Position [ 0 ] = _arg1 ; this -> Position [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetPosition ( const float _arg [ 2 ] ) { this -> SetPosition ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; void SetPosition ( const vtkVector2f & pos ) ; /@} /@{ *
##  Get position of the dendrogram.
##  virtual float * GetPosition ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetPosition ( float & _arg1 , float & _arg2 ) { _arg1 = this -> Position [ 0 ] ; _arg2 = this -> Position [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Position  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPosition ( float _arg [ 2 ] ) { this -> GetPosition ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; vtkVector2f GetPositionVector ( ) ; /@} /@{ *
##  Get/Set the spacing between the leaf nodes in our dendrogram.
##  Default is 18 pixels.
##  virtual double GetExtendLeafNodesDrawLabelsLeafSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeafSpacing  of  << this -> LeafSpacing ) ; return this -> LeafSpacing ; } ; virtual void SetExtendLeafNodesDrawLabelsLeafSpacing ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LeafSpacing  to  << _arg ) ; if ( this -> LeafSpacing != _arg ) { this -> LeafSpacing = _arg ; this -> Modified ( ) ; } } ; /@} *
##  This function calls RebuildBuffers() if necessary.
##  Once PrepareToPaint() has been called, GetBounds() is guaranteed
##  to provide useful information.
##  void PrepareToPaint ( vtkContext2D * painter ) ; *
##  Get the bounds for this item as (Xmin,Xmax,Ymin,Ymax).
##  These bounds are only guaranteed to be accurate after Paint() or
##  PrepareToPaint() has been called.
##  virtual void GetBounds ( double bounds [ 4 ] ) ; *
##  Compute the width of the longest leaf node label.
##  void ComputeLabelWidth ( vtkContext2D * painter ) ; *
##  Get the width of the longest leaf node label.
##  float GetLabelWidth ( ) ; *
##  Find the position of the vertex with the specified name.  Store
##  this information in the passed array.  Returns true if the vertex
##  was found, false otherwise.
##  bool GetPositionOfVertex ( const std :: string & vertexName , double position [ 2 ] ) ; *
##  Paints the input tree as a dendrogram.
##  bool Paint ( vtkContext2D * painter ) override ; /@{ *
##  Get/Set how wide the edges of this dendrogram should be.  Default is one pixel.
##  virtual float GetExtendLeafNodesDrawLabelsLeafSpacingLineWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineWidth  of  << this -> LineWidth ) ; return this -> LineWidth ; } ; virtual void SetExtendLeafNodesDrawLabelsLeafSpacingLineWidth ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LineWidth  to  << _arg ) ; if ( this -> LineWidth != _arg ) { this -> LineWidth = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get/set whether or not the number of collapsed leaf nodes should be written
##  inside the triangle representing a collapsed subtree.  Default is true.
##  virtual void SetExtendLeafNodesDrawLabelsLeafSpacingLineWidthDisplayNumberOfCollapsedLeafNodes ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisplayNumberOfCollapsedLeafNodes  to  << _arg ) ; if ( this -> DisplayNumberOfCollapsedLeafNodes != _arg ) { this -> DisplayNumberOfCollapsedLeafNodes = _arg ; this -> Modified ( ) ; } } ; virtual bool GetExtendLeafNodesDrawLabelsLeafSpacingLineWidthDisplayNumberOfCollapsedLeafNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplayNumberOfCollapsedLeafNodes  of  << this -> DisplayNumberOfCollapsedLeafNodes ) ; return this -> DisplayNumberOfCollapsedLeafNodes ; } ; virtual void DisplayNumberOfCollapsedLeafNodesOn ( ) { this -> SetExtendLeafNodesDrawLabelsDisplayNumberOfCollapsedLeafNodes ( static_cast < bool > ( 1 ) ) ; } virtual void DisplayNumberOfCollapsedLeafNodesOff ( ) { this -> SetExtendLeafNodesDrawLabelsDisplayNumberOfCollapsedLeafNodes ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set the name of the array that specifies the distance of each vertex
##  from the root (NOT the vertex's parent).  This array should be a part of
##  the input tree's VertexData.  By default, this value is "node weight",
##  which is the name of the array created by vtkNewickTreeReader.
##  virtual vtkStdString GetExtendLeafNodesDrawLabelsLeafSpacingLineWidthDisplayNumberOfCollapsedLeafNodesDistanceArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DistanceArrayName  of  << this -> DistanceArrayName ) ; return this -> DistanceArrayName ; } ; virtual void SetExtendLeafNodesDrawLabelsLeafSpacingLineWidthDisplayNumberOfCollapsedLeafNodesDistanceArrayName ( vtkStdString _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DistanceArrayName  to  << _arg ) ; if ( this -> DistanceArrayName != _arg ) { this -> DistanceArrayName = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get/Set the name of a vtkStringArray that specifies the names of the
##  vertices of the input tree.  This array should be a part of the input
##  tree's VertexData.  By default, this value is "node name", which is the
##  name of the array created by vtkNewickTreeReader.
##  virtual vtkStdString GetExtendLeafNodesDrawLabelsLeafSpacingLineWidthDisplayNumberOfCollapsedLeafNodesDistanceArrayNameVertexNameArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VertexNameArrayName  of  << this -> VertexNameArrayName ) ; return this -> VertexNameArrayName ; } ; virtual void SetExtendLeafNodesDrawLabelsLeafSpacingLineWidthDisplayNumberOfCollapsedLeafNodesDistanceArrayNameVertexNameArrayName ( vtkStdString _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VertexNameArrayName  to  << _arg ) ; if ( this -> VertexNameArrayName != _arg ) { this -> VertexNameArrayName = _arg ; this -> Modified ( ) ; } } ; /@}  this struct & class allow us to generate a priority queue of vertices. struct WeightedVertex { vtkIdType ID ; double weight ; } ; class CompareWeightedVertices { public :  Returns true if v2 is higher priority than v1 bool operator ( ) ( WeightedVertex & v1 , WeightedVertex & v2 ) { if ( v1 . weight <= v2 . weight ) { return false ; } return true ; } } ; *
##  Enum for Orientation.
##  enum { LEFT_TO_RIGHT , UP_TO_DOWN , RIGHT_TO_LEFT , DOWN_TO_UP } ; *
##  Returns true if the transform is interactive, false otherwise.
##  bool Hit ( const vtkContextMouseEvent & mouse ) override ; *
##  Collapse or expand a subtree when the user double clicks on an
##  internal node.
##  bool MouseDoubleClickEvent ( const vtkContextMouseEvent & event ) override ; protected : vtkDendrogramItem ( ) ; ~ vtkDendrogramItem ( ) override ; vtkVector2f PositionVector ; float * Position ; *
##  Generate some data needed for painting.  We cache this information as
##  it only needs to be generated when the input data changes.
##  virtual void RebuildBuffers ( ) ; *
##  This function does the bulk of the actual work in rendering our dendrogram
##  virtual void PaintBuffers ( vtkContext2D * painter ) ; *
##  This function returns a bool indicating whether or not we need to rebuild
##  our cached data before painting.
##  virtual bool IsDirty ( ) ; *
##  Compute how to scale our data so that text labels will fit within the
##  bounds determined by the spacing between the leaf nodes of the tree.
##  void ComputeMultipliers ( ) ; *
##  Compute the bounds of our tree in pixel coordinates.
##  void ComputeBounds ( ) ; *
##  Count the number of leaf nodes in the tree
##  void CountLeafNodes ( ) ; *
##  Count the number of leaf nodes that descend from a given vertex.
##  int CountLeafNodes ( vtkIdType vertex ) ; *
##  Get the tree vertex closest to the specified coordinates.
##  vtkIdType GetClosestVertex ( double x , double y ) ; *
##  Collapse the subtree rooted at vertex.
##  void CollapseSubTree ( vtkIdType vertex ) ; *
##  Expand the previously collapsed subtree rooted at vertex.
##  void ExpandSubTree ( vtkIdType vertex ) ; *
##  Look up the original ID of a vertex in the pruned tree.
##  vtkIdType GetOriginalId ( vtkIdType vertex ) ; *
##  Look up the ID of a vertex in the pruned tree from a vertex ID
##  of the input tree.
##  vtkIdType GetPrunedIdForOriginalId ( vtkIdType originalId ) ; *
##  Check if the click at (x, y) should be considered as a click on
##  a collapsed subtree.  Returns the vtkIdType of the pruned subtree
##  if so, -1 otherwise.
##  vtkIdType GetClickedCollapsedSubTree ( double x , double y ) ; *
##  Calculate the extent of the data that is visible within the window.
##  This information is used to ensure that we only draw details that
##  will be seen by the user.  This improves rendering speed, particularly
##  for larger data.
##  void UpdateVisibleSceneExtent ( vtkContext2D * painter ) ; *
##  Returns true if any part of the line segment defined by endpoints
##  (x0, y0), (x1, y1) falls within the extent of the currently
##  visible scene.  Returns false otherwise.
##  bool LineIsVisible ( double x0 , double y0 , double x1 , double y1 ) ; *
##  Internal function.  Use SetOrientation(int orientation) instead.
##  void SetOrientation ( vtkTree * tree , int orientation ) ;  Setup the position, size, and orientation of this dendrogram's color
##  legend based on the dendrogram's current orientation. void PositionColorLegend ( ) ; vtkSmartPointer < vtkTree > Tree ; vtkSmartPointer < vtkTree > LayoutTree ; private : vtkDendrogramItem ( const vtkDendrogramItem & ) = delete ; void operator = ( const vtkDendrogramItem & ) = delete ; vtkSmartPointer < vtkTree > PrunedTree ; vtkMTimeType DendrogramBuildTime ; vtkNew < vtkGraphLayout > Layout ; vtkNew < vtkPruneTreeFilter > PruneFilter ; vtkNew < vtkLookupTable > TriangleLookupTable ; vtkNew < vtkLookupTable > TreeLookupTable ; vtkNew < vtkColorLegend > ColorLegend ; vtkDoubleArray * ColorArray ; double MultiplierX ; double MultiplierY ; int NumberOfLeafNodes ; double LeafSpacing ; double MinX ; double MinY ; double MaxX ; double MaxY ; double SceneBottomLeft [ 3 ] ; double SceneTopRight [ 3 ] ; float LabelWidth ; float LineWidth ; bool ColorTree ; bool ExtendLeafNodes ; bool DrawLabels ; bool DisplayNumberOfCollapsedLeafNodes ; bool LegendPositionSet ; vtkStdString DistanceArrayName ; vtkStdString VertexNameArrayName ; } ;
## Error: token expected: ; but got: [identifier]!!!

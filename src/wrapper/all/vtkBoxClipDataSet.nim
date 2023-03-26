## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoxClipDataSet.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkBoxClipDataSet
##  @brief   clip an unstructured grid
##
##
##  Clipping means that is actually 'cuts' through the cells of the dataset,
##  returning tetrahedral cells inside of the box.
##  The output of this filter is an unstructured grid.
##
##  This filter can be configured to compute a second output. The
##  second output is the part of the cell that is clipped away. Set the
##  GenerateClippedData boolean on if you wish to access this output data.
##
##  The vtkBoxClipDataSet will triangulate all types of 3D cells (i.e, create tetrahedra).
##  This is necessary to preserve compatibility across face neighbors.
##
##  To use this filter,you can decide if you will be clipping with a box or a hexahedral box.
##  1) Set orientation
##     if(SetOrientation(0)): box (parallel with coordinate axis)
##        SetBoxClip(xmin,xmax,ymin,ymax,zmin,zmax)
##     if(SetOrientation(1)): hexahedral box (Default)
##        SetBoxClip(n[0],o[0],n[1],o[1],n[2],o[2],n[3],o[3],n[4],o[4],n[5],o[5])
##        PlaneNormal[] normal of each plane
##        PlanePoint[] point on the plane
##  2) Apply the GenerateClipScalarsOn()
##  3) Execute clipping  Update();
##

## !!!Ignored construct:  # vtkBoxClipDataSet_h [NewLine] # vtkBoxClipDataSet_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkCell3D ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellArray"
discard "forward decl of vtkCellData"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkIdList"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkPointData"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkBoxClipDataSet : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBoxClipDataSet :: IsTypeOf ( type ) ; } static vtkBoxClipDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBoxClipDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBoxClipDataSet * NewInstance ( ) const { return vtkBoxClipDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoxClipDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoxClipDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Constructor of the clipping box. The initial box is (0,1,0,1,0,1).
##  The hexahedral box and the parallel box parameters are set to match this
##  box.
##  static vtkBoxClipDataSet * New ( ) ; /@{ *
##  Specify the Box with which to perform the clipping.
##  If the box is not parallel to axis, you need to especify
##  normal vector of each plane and a point on the plane.
##  void SetBoxClip ( double xmin , double xmax , double ymin , double ymax , double zmin , double zmax ) ; void SetBoxClip ( const double * n0 , const double * o0 , const double * n1 , const double * o1 , const double * n2 , const double * o2 , const double * n3 , const double * o3 , const double * n4 , const double * o4 , const double * n5 , const double * o5 ) ; /@} /@{ *
##  If this flag is enabled, then the output scalar values will be
##  interpolated, and not the input scalar data.
##  virtual void SetGenerateClipScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClipScalars  to  << _arg ) ; if ( this -> GenerateClipScalars != _arg ) { this -> GenerateClipScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGenerateClipScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClipScalars  of  << this -> GenerateClipScalars ) ; return this -> GenerateClipScalars ; } ; virtual void GenerateClipScalarsOn ( ) { this -> SetGenerateClipScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClipScalarsOff ( ) { this -> SetGenerateClipScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control whether a second output is generated. The second output
##  contains the polygonal data that's been clipped away.
##  virtual void SetGenerateClipScalarsGenerateClippedOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClippedOutput  to  << _arg ) ; if ( this -> GenerateClippedOutput != _arg ) { this -> GenerateClippedOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGenerateClipScalarsGenerateClippedOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClippedOutput  of  << this -> GenerateClippedOutput ) ; return this -> GenerateClippedOutput ; } ; virtual void GenerateClippedOutputOn ( ) { this -> SetGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClippedOutputOff ( ) { this -> SetGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Set the tolerance for merging clip intersection points that are near
##  the vertices of cells. This tolerance is used to prevent the generation
##  of degenerate primitives. Note that only 3D cells actually use this
##  instance variable.
##  vtkSetClampMacro(MergeTolerance,double,0.0001,0.25);
##  vtkGetMacro(MergeTolerance,double);
##  /@{ *
##  Return the Clipped output.
##  vtkUnstructuredGrid * GetClippedOutput ( ) ; virtual int GetNumberOfOutputs ( ) ; /@} /@{ *
##  Specify a spatial locator for merging points. By default, an
##  instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified. The
##  locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; *
##  Return the mtime also considering the locator.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Tells if clipping happens with a box parallel with coordinate axis
##  (0) or with an hexahedral box (1). Initial value is 1.
##  virtual unsigned int GetGenerateClipScalarsGenerateClippedOutputOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  of  << this -> Orientation ) ; return this -> Orientation ; } ; virtual void SetGenerateClipScalarsGenerateClippedOutputOrientation ( unsigned int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Orientation  to  << _arg ) ; if ( this -> Orientation != _arg ) { this -> Orientation = _arg ; this -> Modified ( ) ; } } ; /@} static void InterpolateEdge ( vtkDataSetAttributes * attributes , vtkIdType toId , vtkIdType fromId1 , vtkIdType fromId2 , double t ) ; void MinEdgeF ( const unsigned int * id_v , const vtkIdType * cellIds , unsigned int * edgF ) ; void PyramidToTetra ( const vtkIdType * pyramId , const vtkIdType * cellIds , vtkCellArray * newCellArray ) ; void WedgeToTetra ( const vtkIdType * wedgeId , const vtkIdType * cellIds , vtkCellArray * newCellArray ) ; void CellGrid ( vtkIdType typeobj , vtkIdType npts , const vtkIdType * cellIds , vtkCellArray * newCellArray ) ; void CreateTetra ( vtkIdType npts , const vtkIdType * cellIds , vtkCellArray * newCellArray ) ; void ClipBox ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * tets , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD ) ; void ClipHexahedron ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * tets , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD ) ; void ClipBoxInOut ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * * tets , vtkPointData * inPD , vtkPointData * * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * * outCD ) ; void ClipHexahedronInOut ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * * tets , vtkPointData * inPD , vtkPointData * * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * * outCD ) ; void ClipBox2D ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * tets , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD ) ; void ClipBoxInOut2D ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * * tets , vtkPointData * inPD , vtkPointData * * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * * outCD ) ; void ClipHexahedron2D ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * tets , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD ) ; void ClipHexahedronInOut2D ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * * tets , vtkPointData * inPD , vtkPointData * * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * * outCD ) ; void ClipBox1D ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * lines , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD ) ; void ClipBoxInOut1D ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * * lines , vtkPointData * inPD , vtkPointData * * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * * outCD ) ; void ClipHexahedron1D ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * lines , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD ) ; void ClipHexahedronInOut1D ( vtkPoints * newPoints , vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * * lines , vtkPointData * inPD , vtkPointData * * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * * outCD ) ; void ClipBox0D ( vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD ) ; void ClipBoxInOut0D ( vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * * verts , vtkPointData * inPD , vtkPointData * * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * * outCD ) ; void ClipHexahedron0D ( vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD ) ; void ClipHexahedronInOut0D ( vtkGenericCell * cell , vtkIncrementalPointLocator * locator , vtkCellArray * * verts , vtkPointData * inPD , vtkPointData * * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * * outCD ) ; protected : vtkBoxClipDataSet ( ) ; ~ vtkBoxClipDataSet ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkIncrementalPointLocator * Locator ; vtkTypeBool GenerateClipScalars ; vtkTypeBool GenerateClippedOutput ;  double MergeTolerance; double BoundBoxClip [ 3 ] [ 2 ] ; unsigned int Orientation ; double PlaneNormal [ 6 ] [ 3 ] ;  normal of each plane double PlanePoint [ 6 ] [ 3 ] ;  point on the plane private : vtkBoxClipDataSet ( const vtkBoxClipDataSet & ) = delete ; void operator = ( const vtkBoxClipDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIntersectionPolyDataFilter.h
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
##  @class   vtkIntersectionPolyDataFilter
##
##
##  vtkIntersectionPolyDataFilter computes the intersection between two
##  vtkPolyData objects. The first output is a set of lines that marks
##  the intersection of the input vtkPolyData objects. This contains five
##  different attached data arrays:
##
##  SurfaceID: Point data array that contains information about the origin
##  surface of each point
##
##  Input0CellID: Cell data array that contains the original
##  cell ID number on the first input mesh
##
##  Input1CellID: Cell data array that contains the original
##  cell ID number on the second input mesh
##
##  NewCell0ID: Cell data array that contains information about which cells
##  of the remeshed first input surface it touches (If split)
##
##  NewCell1ID: Cell data array that contains information about which cells
##  on the remeshed second input surface it touches (If split)
##
##  The second and third outputs are the first and second input vtkPolyData,
##  respectively. Optionally, the two output vtkPolyData can be split
##  along the intersection lines by remeshing. Optionally, the surface
##  can be cleaned and checked at the end of the remeshing.
##  If the meshes are split, The output vtkPolyDatas contain three possible
##  data arrays:
##
##  IntersectionPoint: This is a boolean indicating whether or not the point is
##  on the boundary of the two input objects
##
##  BadTriangle: If the surface is cleaned and checked, this is a cell data array
##  indicating whether or not the cell has edges with multiple neighbors
##  A manifold surface will have 0 everywhere for this array!
##
##  FreeEdge: If the surface is cleaned and checked, this is a cell data array
##  indicating if the cell has any free edges. A watertight surface will have
##  0 everywhere for this array!
##
##  @author Adam Updegrove updega2@gmail.com
##
##  @warning This filter is not designed to perform 2D boolean operations,
##  and in fact relies on the inputs having no co-planar, overlapping cells.
##

## !!!Ignored construct:  # vtkIntersectionPolyDataFilter_h [NewLine] # vtkIntersectionPolyDataFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkIntersectionPolyDataFilter : public vtkPolyDataAlgorithm { public : static vtkIntersectionPolyDataFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIntersectionPolyDataFilter :: IsTypeOf ( type ) ; } static vtkIntersectionPolyDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIntersectionPolyDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIntersectionPolyDataFilter * NewInstance ( ) const { return vtkIntersectionPolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIntersectionPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIntersectionPolyDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Integer describing the number of intersection points and lines
##  virtual int GetNumberOfIntersectionPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIntersectionPoints  of  << this -> NumberOfIntersectionPoints ) ; return this -> NumberOfIntersectionPoints ; } ; virtual int GetNumberOfIntersectionPointsNumberOfIntersectionLines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIntersectionLines  of  << this -> NumberOfIntersectionLines ) ; return this -> NumberOfIntersectionLines ; } ; /@} /@{ *
##  If on, the second output will be the first input mesh split by the
##  intersection with the second input mesh. Defaults to on.
##  virtual vtkTypeBool GetNumberOfIntersectionPointsNumberOfIntersectionLinesSplitFirstOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SplitFirstOutput  of  << this -> SplitFirstOutput ) ; return this -> SplitFirstOutput ; } ; virtual void SetSplitFirstOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SplitFirstOutput  to  << _arg ) ; if ( this -> SplitFirstOutput != _arg ) { this -> SplitFirstOutput = _arg ; this -> Modified ( ) ; } } ; virtual void SplitFirstOutputOn ( ) { this -> SetSplitFirstOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SplitFirstOutputOff ( ) { this -> SetSplitFirstOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, the third output will be the second input mesh split by the
##  intersection with the first input mesh. Defaults to on.
##  virtual vtkTypeBool GetNumberOfIntersectionPointsNumberOfIntersectionLinesSplitFirstOutputSplitSecondOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SplitSecondOutput  of  << this -> SplitSecondOutput ) ; return this -> SplitSecondOutput ; } ; virtual void SetSplitFirstOutputSplitSecondOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SplitSecondOutput  to  << _arg ) ; if ( this -> SplitSecondOutput != _arg ) { this -> SplitSecondOutput = _arg ; this -> Modified ( ) ; } } ; virtual void SplitSecondOutputOn ( ) { this -> SetSplitFirstOutputSplitSecondOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SplitSecondOutputOff ( ) { this -> SetSplitFirstOutputSplitSecondOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, the output split surfaces will contain information about which
##  points are on the intersection of the two inputs. Default: ON
##  virtual vtkTypeBool GetNumberOfIntersectionPointsNumberOfIntersectionLinesSplitFirstOutputSplitSecondOutputComputeIntersectionPointArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeIntersectionPointArray  of  << this -> ComputeIntersectionPointArray ) ; return this -> ComputeIntersectionPointArray ; } ; virtual void SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArray ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeIntersectionPointArray  to  << _arg ) ; if ( this -> ComputeIntersectionPointArray != _arg ) { this -> ComputeIntersectionPointArray = _arg ; this -> Modified ( ) ; } } ; virtual void ComputeIntersectionPointArrayOn ( ) { this -> SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArray ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeIntersectionPointArrayOff ( ) { this -> SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArray ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, the normals of the input will be checked. Default: OFF
##  virtual vtkTypeBool GetNumberOfIntersectionPointsNumberOfIntersectionLinesSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CheckInput  of  << this -> CheckInput ) ; return this -> CheckInput ; } ; virtual void SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CheckInput  to  << _arg ) ; if ( this -> CheckInput != _arg ) { this -> CheckInput = _arg ; this -> Modified ( ) ; } } ; virtual void CheckInputOn ( ) { this -> SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CheckInputOff ( ) { this -> SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, the output remeshed surfaces will be checked for bad cells and
##  free edges. Default: ON
##  virtual vtkTypeBool GetNumberOfIntersectionPointsNumberOfIntersectionLinesSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMesh ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CheckMesh  of  << this -> CheckMesh ) ; return this -> CheckMesh ; } ; virtual void SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMesh ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CheckMesh  to  << _arg ) ; if ( this -> CheckMesh != _arg ) { this -> CheckMesh = _arg ; this -> Modified ( ) ; } } ; virtual void CheckMeshOn ( ) { this -> SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMesh ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CheckMeshOff ( ) { this -> SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMesh ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Check the status of the filter after update. If the status is zero,
##  there was an error in the operation. If status is one, everything
##  went smoothly
##  virtual int GetNumberOfIntersectionPointsNumberOfIntersectionLinesSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMeshStatus ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Status  of  << this -> Status ) ; return this -> Status ; } ; /@} /@{ *
##  The tolerance for geometric tests in the filter
##  virtual double GetNumberOfIntersectionPointsNumberOfIntersectionLinesSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMeshStatusTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; virtual void SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMeshTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  When discretizing polygons, the minimum ratio of the smallest acceptable
##  triangle area w.r.t. the area of the polygon
##
##  virtual double GetNumberOfIntersectionPointsNumberOfIntersectionLinesSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMeshStatusToleranceRelativeSubtriangleArea ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RelativeSubtriangleArea  of  << this -> RelativeSubtriangleArea ) ; return this -> RelativeSubtriangleArea ; } ; virtual void SetSplitFirstOutputSplitSecondOutputComputeIntersectionPointArrayCheckInputCheckMeshToleranceRelativeSubtriangleArea ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RelativeSubtriangleArea  to  << _arg ) ; if ( this -> RelativeSubtriangleArea != _arg ) { this -> RelativeSubtriangleArea = _arg ; this -> Modified ( ) ; } } ; /@} *
##  Given two triangles defined by points (p1, q1, r1) and (p2, q2,
##  r2), returns whether the two triangles intersect. If they do,
##  the endpoints of the line forming the intersection are returned
##  in pt1 and pt2. The parameter coplanar is set to 1 if the
##  triangles are coplanar and 0 otherwise. The surfaceid array
##  is filled with the surface on which the first and second
##  intersection points resides, respectively. A geometric tolerance
##  can be specified in the last argument.
##  static int TriangleTriangleIntersection ( double p1 [ 3 ] , double q1 [ 3 ] , double r1 [ 3 ] , double p2 [ 3 ] , double q2 [ 3 ] , double r2 [ 3 ] , int & coplanar , double pt1 [ 3 ] , double pt2 [ 3 ] , double surfaceid [ 2 ] , double tolerance ) ; *
##  Function to clean and check the output surfaces for bad triangles and
##  free edges
##  static void CleanAndCheckSurface ( vtkPolyData * pd , double stats [ 2 ] , double tolerance ) ; *
##  Function to clean and check the inputs
##  static void CleanAndCheckInput ( vtkPolyData * pd , double tolerance ) ; protected : vtkIntersectionPolyDataFilter ( ) ;  Constructor ~ vtkIntersectionPolyDataFilter ( ) override ;  Destructor int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  Update int FillInputPortInformation ( int , vtkInformation * ) override ;  Input,Output private : vtkIntersectionPolyDataFilter ( const vtkIntersectionPolyDataFilter & ) = delete ; void operator = ( const vtkIntersectionPolyDataFilter & ) = delete ; int NumberOfIntersectionPoints ; int NumberOfIntersectionLines ; vtkTypeBool SplitFirstOutput ; vtkTypeBool SplitSecondOutput ; vtkTypeBool ComputeIntersectionPointArray ; vtkTypeBool CheckMesh ; vtkTypeBool CheckInput ; int Status ; double Tolerance ; double RelativeSubtriangleArea ; class Impl ;  Implementation class } ;
## Error: token expected: ; but got: [identifier]!!!

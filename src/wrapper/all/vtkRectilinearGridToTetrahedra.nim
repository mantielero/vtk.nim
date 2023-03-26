## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGridToTetrahedra.h
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
##  @class   vtkRectilinearGridToTetrahedra
##  @brief   create a Tetrahedral mesh from a RectilinearGrid
##
##  vtkRectilinearGridToTetrahedra forms a mesh of Tetrahedra from a
##  vtkRectilinearGrid.  The tetrahedra can be 5 per cell, 6 per cell,
##  or a mixture of 5 or 12 per cell. The resulting mesh is consistent,
##  meaning that there are no edge crossings and that each tetrahedron
##  face is shared by two tetrahedra, except those tetrahedra on the
##  boundary. All tetrahedra are right handed.
##
##  Note that 12 tetrahedra per cell means adding a point in the
##  center of the cell.
##
##  In order to subdivide some cells into 5 and some cells into 12 tetrahedra:
##  SetTetraPerCellTo5And12();
##  Set the Scalars of the Input RectilinearGrid to be 5 or 12
##  depending on what you want per cell of the RectilinearGrid.
##
##  If you set RememberVoxelId, the scalars of the tetrahedron
##  will be set to the Id of the Cell in the RectilinearGrid from which
##  the tetrahedron came.
##
##  @par Thanks:
##     This class was developed by Samson J. Timoner of the
##     MIT Artificial Intelligence Laboratory
##
##  @sa
##     vtkDelaunay3D
##

## !!!Ignored construct:  # vtkRectilinearGridToTetrahedra_h [NewLine] # vtkRectilinearGridToTetrahedra_h [NewLine]  ways to create the mesh from voxels # VTK_VOXEL_TO_12_TET 12 [NewLine] # VTK_VOXEL_TO_5_TET 5 [NewLine] # VTK_VOXEL_TO_6_TET 6 [NewLine] # VTK_VOXEL_TO_5_AND_12_TET - 1 [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkRectilinearGrid ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSignedCharArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkRectilinearGridToTetrahedra : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRectilinearGridToTetrahedra :: IsTypeOf ( type ) ; } static vtkRectilinearGridToTetrahedra * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRectilinearGridToTetrahedra * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRectilinearGridToTetrahedra * NewInstance ( ) const { return vtkRectilinearGridToTetrahedra :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGridToTetrahedra :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGridToTetrahedra :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Form 5 Tetrahedra per cube. Do not RememberVoxelId.
##  static vtkRectilinearGridToTetrahedra * New ( ) ; /@{ *
##  Set the method to divide each cell (voxel) in the RectilinearGrid
##  into tetrahedra.
##  void SetTetraPerCellTo5 ( ) { SetTetraPerCell ( VTK_VOXEL_TO_5_TET ) ; } void SetTetraPerCellTo6 ( ) { SetTetraPerCell ( VTK_VOXEL_TO_6_TET ) ; } void SetTetraPerCellTo12 ( ) { SetTetraPerCell ( VTK_VOXEL_TO_12_TET ) ; } void SetTetraPerCellTo5And12 ( ) { SetTetraPerCell ( VTK_VOXEL_TO_5_AND_12_TET ) ; } virtual void SetTetraPerCell ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TetraPerCell  to  << _arg ) ; if ( this -> TetraPerCell != _arg ) { this -> TetraPerCell = _arg ; this -> Modified ( ) ; } } ; virtual int GetTetraPerCell ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TetraPerCell  of  << this -> TetraPerCell ) ; return this -> TetraPerCell ; } ; /@} /@{ *
##  Should the tetrahedra have scalar data
##  indicating which Voxel they came from in the vtkRectilinearGrid?
##  virtual void SetTetraPerCellRememberVoxelId ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RememberVoxelId  to  << _arg ) ; if ( this -> RememberVoxelId != _arg ) { this -> RememberVoxelId = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTetraPerCellRememberVoxelId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RememberVoxelId  of  << this -> RememberVoxelId ) ; return this -> RememberVoxelId ; } ; virtual void RememberVoxelIdOn ( ) { this -> SetRememberVoxelId ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void RememberVoxelIdOff ( ) { this -> SetRememberVoxelId ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  This function for convenience for creating a Rectilinear Grid
##  If Spacing does not fit evenly into extent, the last cell will
##  have a different width (or height or depth).
##  If Extent[i]/Spacing[i] is within tol of an integer, then
##  assume the programmer meant an integer for direction i.
##  void SetInput ( const double Extent [ 3 ] , const double Spacing [ 3 ] , const double tol = 0.001 ) ; *
##  This version of the function for the wrappers
##  void SetInput ( const double ExtentX , const double ExtentY , const double ExtentZ , const double SpacingX , const double SpacingY , const double SpacingZ , const double tol = 0.001 ) ; protected : vtkRectilinearGridToTetrahedra ( ) ; ~ vtkRectilinearGridToTetrahedra ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool RememberVoxelId ; int TetraPerCell ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkRectilinearGridToTetrahedra ( const vtkRectilinearGridToTetrahedra & ) = delete ; void operator = ( const vtkRectilinearGridToTetrahedra & ) = delete ; *
##  Determine how to Divide each cell (voxel) in the RectilinearGrid
##  Overwrites VoxelSubdivisionType with flipping information for forming the mesh
##  static void DetermineGridDivisionTypes ( vtkRectilinearGrid * RectGrid , vtkSignedCharArray * VoxelSubdivisionType , const int & TetraPerCell ) ; *
##  Take the grid and make it into a tetrahedral mesh.
##  static void GridToTetMesh ( vtkRectilinearGrid * RectGrid , vtkSignedCharArray * VoxelSubdivisionType , const int & TetraPerCell , const int & RememberVoxelId , vtkUnstructuredGrid * TetMesh ) ; *
##  Take a voxel and make tetrahedra out of it.
##  Add the resulting tetrahedra to TetraMesh. Also, should new
##  points need to be created, add them to NodeList.
##  Note that vtkIdList may be changed during this process (a point added).
##  static int TetrahedralizeVoxel ( vtkIdList * VoxelCorners , const int & DivisionType , vtkPoints * NodeList , vtkCellArray * TetList ) ; *
##  Helper Function for TetrahedraizeVoxel
##  Adds a center point in the middle of the voxel
##  static inline void TetrahedralizeAddCenterPoint ( vtkIdList * VoxelCorners , vtkPoints * NodeList ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

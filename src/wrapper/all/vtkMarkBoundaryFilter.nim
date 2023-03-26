## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMarkBoundaryFilter.h
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
##  @class   vtkMarkBoundaryFilter
##  @brief   mark points and cells that lie on the boundary of a dataset
##
##  vtkMarkBoundaryFilter is a general-purpose filter to mark those cells and
##  points on the boundary of a dataset. The output of the filter is identical
##  to the input, with the exception that two, new data arrays are added to
##  the output that indicate which input points, and input cells, are on the
##  boundary. (Cells and points on the boundary are indicated by a non-zero
##  value, accessed in the appropriate data array by cell id or point id.)
##
##  In general, n-dimensional faces are on the boundary of a (n+1)-dataset if
##  used by a single (n+1)-dimensional cell. So for example the boundary cells
##  of a volumetric dataset are those with quad faces used by only one
##  voxel. Boundary points are those points used by the boundary faces. A cell
##  may have multiple boundary faces.
##
##  An optional array can be produced that encodes the boundary faces of each
##  cell. For each cell cellId that is on the boundary, the nth bit of the
##  value of the faces tuple at location cellId is set.
##
##  @warning
##  This filter is similar to vtkGeometryFilter in that it identifies boundary
##  cells and points. However, vtkGeometryFilter produces output boundary faces
##  and points as output. vtkMarkBoundaryFilter simply identifies which cells
##  and points are on the boundary. (This filter is often used in parallel
##  computing applications to help distrbute data across multiple processes.)
##
##  @warning
##  The points and cells boundary arrays are of type unsigned char.  The
##  optional boundary faces array is of type of vtkIdType (either a 32-bit or
##  64-but integral value depending on compilation flags). Hence if the number
##  of cell faces exceeds the number of bits in a face array value, then the
##  faces array cannot properly encode the boundary faces for that cell. This
##  may be a problem for cell types with an arbitrary number of faces such as
##  vtkPolyhedron and vtkPolygon.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkGeometryFilter vtkDataSetSurfaceFilter
##

## !!!Ignored construct:  # vtkMarkBoundaryFilter_h [NewLine] # vtkMarkBoundaryFilter_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersGeometryModule.h  For export macro [NewLine] class VTKFILTERSGEOMETRY_EXPORT vtkMarkBoundaryFilter : public vtkDataSetAlgorithm { public : /@{ *
##  Standard methods for instantiation, type information, and printing.
##  static vtkMarkBoundaryFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMarkBoundaryFilter :: IsTypeOf ( type ) ; } static vtkMarkBoundaryFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMarkBoundaryFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMarkBoundaryFilter * NewInstance ( ) const { return vtkMarkBoundaryFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMarkBoundaryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMarkBoundaryFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Enable the creation of the boundary faces array. This array encodes
##  which faces are on the boundary of the ith cell. By default, this array
##  is not created. To use this array, bit masking is required to determine
##  if the jth face is on the boundary.
##  virtual void SetGenerateBoundaryFaces ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateBoundaryFaces  to  << _arg ) ; if ( this -> GenerateBoundaryFaces != _arg ) { this -> GenerateBoundaryFaces = _arg ; this -> Modified ( ) ; } } ; virtual bool GetGenerateBoundaryFaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateBoundaryFaces  of  << this -> GenerateBoundaryFaces ) ; return this -> GenerateBoundaryFaces ; } ; virtual void GenerateBoundaryFacesOn ( ) { this -> SetGenerateBoundaryFaces ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateBoundaryFacesOff ( ) { this -> SetGenerateBoundaryFaces ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the names of the two data arrays which indicate which cells and points
##  are on the boundary. By default, "BoundaryPoints", "BoundaryCells", and
##  "BoundaryFaces" are used.
##  virtual void SetBoundaryPointsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BoundaryPointsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> BoundaryPointsName == nullptr && _arg == nullptr ) { return ; } if ( this -> BoundaryPointsName && _arg && ( ! strcmp ( this -> BoundaryPointsName , _arg ) ) ) { return ; } delete [ ] this -> BoundaryPointsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> BoundaryPointsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> BoundaryPointsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetBoundaryPointsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << BoundaryPointsName  of  << ( this -> BoundaryPointsName ? this -> BoundaryPointsName : (null) ) ) ; return this -> BoundaryPointsName ; } ; virtual void SetBoundaryPointsNameBoundaryCellsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BoundaryCellsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> BoundaryCellsName == nullptr && _arg == nullptr ) { return ; } if ( this -> BoundaryCellsName && _arg && ( ! strcmp ( this -> BoundaryCellsName , _arg ) ) ) { return ; } delete [ ] this -> BoundaryCellsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> BoundaryCellsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> BoundaryCellsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetBoundaryPointsNameBoundaryCellsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << BoundaryCellsName  of  << ( this -> BoundaryCellsName ? this -> BoundaryCellsName : (null) ) ) ; return this -> BoundaryCellsName ; } ; virtual void SetBoundaryPointsNameBoundaryCellsNameBoundaryFacesName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BoundaryFacesName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> BoundaryFacesName == nullptr && _arg == nullptr ) { return ; } if ( this -> BoundaryFacesName && _arg && ( ! strcmp ( this -> BoundaryFacesName , _arg ) ) ) { return ; } delete [ ] this -> BoundaryFacesName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> BoundaryFacesName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> BoundaryFacesName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetBoundaryPointsNameBoundaryCellsNameBoundaryFacesName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << BoundaryFacesName  of  << ( this -> BoundaryFacesName ? this -> BoundaryFacesName : (null) ) ) ; return this -> BoundaryFacesName ; } ; /@} protected : vtkMarkBoundaryFilter ( ) ; ~ vtkMarkBoundaryFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; bool GenerateBoundaryFaces ; char * BoundaryPointsName ; char * BoundaryCellsName ; char * BoundaryFacesName ; private : vtkMarkBoundaryFilter ( const vtkMarkBoundaryFilter & ) = delete ; void operator = ( const vtkMarkBoundaryFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

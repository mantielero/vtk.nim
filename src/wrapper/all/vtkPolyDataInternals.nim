## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataInternals.h
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
##  @class vtkPolyDataInternals
##  @brief Store mapping from vtkPolyData cell ids to internal cell array ids.
##
##  Optimized data structure for storing internal cell ids and type information
##  for vtkPolyData datasets.
##
##  Since vtkPolyData only supports a handful of types, the type information
##  is compressed to four bits -- the first two indicate which internal
##  vtkCellArray object a cell is stored in (verts, lines, polys, strips), and
##  the second two bits indicate which type of cell (e.g. lines vs polylines,
##  triangles vs quads vs polygons, etc), as well as whether or not the cell
##  has been deleted from the vtkPolyData.
##
##  These four bits are stored at the top of a 64 bit index, and the remaining
##  60 bits store the cell id. This implies that the internal cell arrays cannot
##  store more than 2^60 cells each, a reasonable limit for modern hardware.
##
##  TaggedCellId structure:
##   66 66 555555555544444444443333333333222222222211111111110000000000
##   32 10 987654321098765432109876543210987654321098765432109876543210
##  +--+--+------------------------------------------------------------+
##  |00|00|000000000000000000000000000000000000000000000000000000000000|
##  +^-+^-+^-----------------------------------------------------------+
##   |  |  |
##   |  |  |> Bottom 60 bits of cellId
##   |  |> Type variant / deleted
##   |> Target cell array
##
##  The supported cell types are:
##
##  - VTK_VERTEX
##  - VTK_POLY_VERTEX
##  - VTK_LINE
##  - VTK_POLY_LINE
##  - VTK_TRIANGLE
##  - VTK_QUAD
##  - VTK_POLYGON
##  - VTK_TRIANGLE_STRIP
##

import
  vtkCommonDataModelModule, vtkCellType, vtkObject, vtkType

var CELLID_MASK* {.importcpp: "vtkPolyData_detail::CELLID_MASK",
                 header: "vtkPolyDataInternals.h".}: vtkTypeUInt64

var SHIFTED_TYPE_INDEX_MASK* {.importcpp: "vtkPolyData_detail::SHIFTED_TYPE_INDEX_MASK",
                             header: "vtkPolyDataInternals.h".}: vtkTypeUInt64

var TARGET_MASK* {.importcpp: "vtkPolyData_detail::TARGET_MASK",
                 header: "vtkPolyDataInternals.h".}: vtkTypeUInt64

var TYPE_VARIANT_MASK* {.importcpp: "vtkPolyData_detail::TYPE_VARIANT_MASK",
                       header: "vtkPolyDataInternals.h".}: vtkTypeUInt64

##  Enumeration of internal cell array targets.

## !!!Ignored construct:  enum class Target : vtkTypeUInt64 { Verts = 0x0 << 62 , Lines = 0x1 << 62 , Polys = 0x2 << 62 , Strips = 0x3 << 62 , } ;
## Error: token expected: ; but got: :!!!

##  Enumeration of type variants.

## !!!Ignored construct:  enum class TypeVariant : vtkTypeUInt64 { Dead = 0x0 << 60 , Var1 = 0x1 << 60 , Var2 = 0x2 << 60 , Var3 = 0x3 << 60 , } ;
## Error: token expected: ; but got: :!!!

##  Lookup table to convert a type index (TaggedCellId.GetTypeIndex()) into
##  a VTK cell type.
##  The type index is the highest four bits of the encoded value, eg. the
##  target and type variant information.

var TypeTable* {.importcpp: "vtkPolyData_detail::TypeTable",
               header: "vtkPolyDataInternals.h".}: array[16, cuchar]

##  Convenience method to concatenate a target and type variant into the low
##  four bits of a single byte. Used to build the TargetVarTable.

## !!!Ignored construct:  static constexpr unsigned char GenTargetVar ( Target target , TypeVariant var ) noexcept { return static_cast < unsigned char > ( ( static_cast < vtkTypeUInt64 > ( target ) | static_cast < vtkTypeUInt64 > ( var ) ) >> 60 ) ; }  Lookup table that maps a VTK cell type (eg. VTK_TRIANGLE) into a target +
##  type variant byte. static constexpr unsigned char TargetVarTable [ 10 ] = { GenTargetVar ( Target :: Verts , TypeVariant :: Dead ) ,  0 | VTK_EMPTY_CELL GenTargetVar ( Target :: Verts , TypeVariant :: Var1 ) ,  1 | VTK_VERTEX GenTargetVar ( Target :: Verts , TypeVariant :: Var2 ) ,  2 | VTK_POLY_VERTEX GenTargetVar ( Target :: Lines , TypeVariant :: Var1 ) ,  3 | VTK_LINE GenTargetVar ( Target :: Lines , TypeVariant :: Var2 ) ,  4 | VTK_POLY_LINE GenTargetVar ( Target :: Polys , TypeVariant :: Var1 ) ,  5 | VTK_TRIANGLE GenTargetVar ( Target :: Strips , TypeVariant :: Var1 ) ,  6 | VTK_TRIANGLE_STRIP GenTargetVar ( Target :: Polys , TypeVariant :: Var3 ) ,  7 | VTK_POLYGON GenTargetVar ( Target :: Polys , TypeVariant :: Var2 ) ,  8 | VTK_PIXEL (treat as quad) GenTargetVar ( Target :: Polys , TypeVariant :: Var2 ) ,  9 | VTK_QUAD } ;
## Error: expected ';'!!!

##  Thin wrapper around a vtkTypeUInt64 that encodes a target cell array,
##  cell type, deleted status, and 60-bit cell id.

## !!!Ignored construct:  struct VTKCOMMONDATAMODEL_EXPORT TaggedCellId {  Encode a cell id and a VTK cell type (eg. VTK_TRIANGLE) into a
##  vtkTypeUInt64. static vtkTypeUInt64 Encode ( vtkIdType cellId , VTKCellType type ) noexcept { const size_t typeIndex = static_cast < size_t > [end of template] ( type ) ; return ( ( static_cast < vtkTypeUInt64 > ( cellId ) & CELLID_MASK ) | ( static_cast < vtkTypeUInt64 > ( TargetVarTable [ typeIndex ] ) << 60 ) ) ; } TaggedCellId ( ) noexcept = default ;  Create a TaggedCellId from a cellId and cell type (e.g. VTK_TRIANGLE). TaggedCellId ( vtkIdType cellId , VTKCellType cellType ) noexcept : Value ( Encode ( cellId , cellType ) ) { } TaggedCellId ( const TaggedCellId & ) noexcept = default ; TaggedCellId ( TaggedCellId && ) noexcept = default ; TaggedCellId & operator = ( const TaggedCellId & ) noexcept = default ; TaggedCellId & operator = ( TaggedCellId && ) noexcept = default ;  Get an enum value describing the internal vtkCellArray target used to
##  store this cell. Target GetTarget ( ) const noexcept { return static_cast < Target > ( this -> Value & TARGET_MASK ) ; }  Get the VTK cell type value (eg. VTK_TRIANGLE) as a single byte. unsigned char GetCellType ( ) const noexcept { return TypeTable [ this -> GetTypeIndex ( ) ] ; }  Get the cell id used by the target vtkCellArray to store this cell. vtkIdType GetCellId ( ) const noexcept { return static_cast < vtkIdType > ( this -> Value & CELLID_MASK ) ; }  Update the cell id. Most useful with the CellMap::InsertNextCell(type)
##  signature. void SetCellId ( vtkIdType cellId ) noexcept { this -> Value &= SHIFTED_TYPE_INDEX_MASK ; this -> Value |= ( static_cast < vtkTypeUInt64 > ( cellId ) & CELLID_MASK ) ; }  Mark this cell as deleted. void MarkDeleted ( ) noexcept { this -> Value &= ~ TYPE_VARIANT_MASK ; }  Returns true if the cell has been deleted. bool IsDeleted ( ) const noexcept { return ( this -> Value & TYPE_VARIANT_MASK ) == 0 ; } private : vtkTypeUInt64 Value ;  These shouldn't be needed outside of this struct. You're probably looking
##  for GetCellType() instead. TypeVariant GetTypeVariant ( ) const noexcept { return static_cast < TypeVariant > ( this -> Value & TYPE_VARIANT_MASK ) ; } std :: size_t GetTypeIndex ( ) const noexcept { return static_cast < std :: size_t > ( this -> Value >> 60 ) ; } } ;
## Error: did not expect ;!!!

##  Thin wrapper around a std::vector<TaggedCellId> to allow shallow copying, etc

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT CellMap : public vtkObject { public : static CellMap * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> CellMap :: IsTypeOf ( type ) ; } static CellMap * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < CellMap * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE CellMap * NewInstance ( ) const { return CellMap :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> CellMap :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return CellMap :: New ( ) ; } public : ; static bool ValidateCellType ( VTKCellType cellType ) noexcept {  1-9 excluding 8 (VTK_PIXEL): return cellType > 0 && cellType <= 10 && cellType != VTK_PIXEL ; } static bool ValidateCellId ( vtkIdType cellId ) noexcept {  is positive, won't truncate: return ( ( static_cast < vtkTypeUInt64 > ( cellId ) & CELLID_MASK ) == static_cast < vtkTypeUInt64 > ( cellId ) ) ; } void DeepCopy ( CellMap * other ) { if ( other ) { this -> Map = other -> Map ; } else { this -> Map . clear ( ) ; } } void SetCapacity ( vtkIdType numCells ) { this -> Map . reserve ( static_cast < std :: size_t > ( numCells ) ) ; } TaggedCellId & GetTag ( vtkIdType cellId ) { return this -> Map [ static_cast < std :: size_t > ( cellId ) ] ; } const TaggedCellId & GetTag ( vtkIdType cellId ) const { return this -> Map [ static_cast < std :: size_t > ( cellId ) ] ; }  Caller must ValidateCellType first. void InsertNextCell ( vtkIdType cellId , VTKCellType cellType ) { this -> Map . emplace_back ( cellId , cellType ) ; }  Caller must ValidateCellType and ValidateCellId first.
##  useful for reusing the target lookup from cellType and then calling
##  TaggedCellId::SetCellId later. TaggedCellId & InsertNextCell ( VTKCellType cellType ) { this -> Map . emplace_back ( vtkIdType ( 0 ) , cellType ) ; return this -> Map . back ( ) ; } vtkIdType GetNumberOfCells ( ) const { return static_cast < vtkIdType > ( this -> Map . size ( ) ) ; } void Reset ( ) { this -> Map . clear ( ) ; } void Squeeze ( ) { this -> Map . shrink_to_fit ( ) ;  yaaaaay c++11 }  In rounded-up kibibytes, as is VTK's custom: unsigned long GetActualMemorySize ( ) const { return static_cast < unsigned long > ( sizeof ( TaggedCellId ) * this -> Map . capacity ( ) + 1023 ) / 1024 ; } protected : CellMap ( ) ; ~ CellMap ( ) override ; std :: vector < TaggedCellId > Map ; private : CellMap ( const CellMap & ) = delete ; CellMap & operator = ( const CellMap & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  end namespace vtkPolyData_detail

##  VTK-HeaderTest-Exclude: vtkPolyDataInternals.h

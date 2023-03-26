## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkType.h
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

## !!!Ignored construct:  # vtkType_h [NewLine] # vtkType_h [NewLine] # vtkCompiler.h  for VTK_USE_EXTERN_TEMPLATE # vtkLegacy.h  For VTK_LEGACY_REMOVE # vtkOptions.h  for VTK_USE_64BIT_IDS and VTK_USE_64BIT_TIMESTAMPS # vtk_kwiml.h [NewLine] # VTK_SIZEOF_CHAR KWIML_ABI_SIZEOF_CHAR [NewLine] # VTK_SIZEOF_SHORT KWIML_ABI_SIZEOF_SHORT [NewLine] # VTK_SIZEOF_INT KWIML_ABI_SIZEOF_INT [NewLine] # VTK_SIZEOF_LONG KWIML_ABI_SIZEOF_LONG [NewLine] # VTK_SIZEOF_LONG_LONG KWIML_ABI_SIZEOF_LONG_LONG [NewLine] # VTK_SIZEOF_FLOAT KWIML_ABI_SIZEOF_FLOAT [NewLine] # VTK_SIZEOF_DOUBLE KWIML_ABI_SIZEOF_DOUBLE [NewLine] # VTK_SIZEOF_VOID_P KWIML_ABI_SIZEOF_DATA_PTR [NewLine]  Whether type "char" is signed (it may be signed or unsigned). # defined ( KWIML_ABI_CHAR_IS_SIGNED ) [NewLine] # VTK_TYPE_CHAR_IS_SIGNED 1 [NewLine] # [NewLine] # VTK_TYPE_CHAR_IS_SIGNED 0 [NewLine] # [NewLine] --------------------------------------------------------------------------  Define a unique integer identifier for each native scalar type.  These types are returned by GetDataType to indicate pixel type. # VTK_VOID 0 [NewLine] # VTK_BIT 1 [NewLine] # VTK_CHAR 2 [NewLine] # VTK_SIGNED_CHAR 15 [NewLine] # VTK_UNSIGNED_CHAR 3 [NewLine] # VTK_SHORT 4 [NewLine] # VTK_UNSIGNED_SHORT 5 [NewLine] # VTK_INT 6 [NewLine] # VTK_UNSIGNED_INT 7 [NewLine] # VTK_LONG 8 [NewLine] # VTK_UNSIGNED_LONG 9 [NewLine] # VTK_FLOAT 10 [NewLine] # VTK_DOUBLE 11 [NewLine] # VTK_ID_TYPE 12 [NewLine]  These types are not currently supported by GetDataType, but are for
##    completeness. # VTK_STRING 13 [NewLine] # VTK_OPAQUE 14 [NewLine] # VTK_LONG_LONG 16 [NewLine] # VTK_UNSIGNED_LONG_LONG 17 [NewLine]  These types are required by vtkVariant and vtkVariantArray # VTK_VARIANT 20 [NewLine] # VTK_OBJECT 21 [NewLine]  deleted value
## const VTK_UNICODE_STRING 22 <==== do not use --------------------------------------------------------------------------  Define a unique integer identifier for each vtkDataObject type.  When adding a new data type here, make sure to update  vtkDataObjectTypes as well. # VTK_POLY_DATA 0 [NewLine] # VTK_STRUCTURED_POINTS 1 [NewLine] # VTK_STRUCTURED_GRID 2 [NewLine] # VTK_RECTILINEAR_GRID 3 [NewLine] # VTK_UNSTRUCTURED_GRID 4 [NewLine] # VTK_PIECEWISE_FUNCTION 5 [NewLine] # VTK_IMAGE_DATA 6 [NewLine] # VTK_DATA_OBJECT 7 [NewLine] # VTK_DATA_SET 8 [NewLine] # VTK_POINT_SET 9 [NewLine] # VTK_UNIFORM_GRID 10 [NewLine] # VTK_COMPOSITE_DATA_SET 11 [NewLine] # VTK_MULTIGROUP_DATA_SET 12 [NewLine] # VTK_MULTIBLOCK_DATA_SET 13 [NewLine] # VTK_HIERARCHICAL_DATA_SET 14 [NewLine] # VTK_HIERARCHICAL_BOX_DATA_SET 15 [NewLine] # VTK_GENERIC_DATA_SET 16 [NewLine] # VTK_HYPER_OCTREE 17 [NewLine] # VTK_TEMPORAL_DATA_SET 18 [NewLine] # VTK_TABLE 19 [NewLine] # VTK_GRAPH 20 [NewLine] # VTK_TREE 21 [NewLine] # VTK_SELECTION 22 [NewLine] # VTK_DIRECTED_GRAPH 23 [NewLine] # VTK_UNDIRECTED_GRAPH 24 [NewLine] # VTK_MULTIPIECE_DATA_SET 25 [NewLine] # VTK_DIRECTED_ACYCLIC_GRAPH 26 [NewLine] # VTK_ARRAY_DATA 27 [NewLine] # VTK_REEB_GRAPH 28 [NewLine] # VTK_UNIFORM_GRID_AMR 29 [NewLine] # VTK_NON_OVERLAPPING_AMR 30 [NewLine] # VTK_OVERLAPPING_AMR 31 [NewLine] # VTK_HYPER_TREE_GRID 32 [NewLine] # VTK_MOLECULE 33 [NewLine] # VTK_PISTON_DATA_OBJECT 34 [NewLine] # VTK_PATH 35 [NewLine] # VTK_UNSTRUCTURED_GRID_BASE 36 [NewLine] # VTK_PARTITIONED_DATA_SET 37 [NewLine] # VTK_PARTITIONED_DATA_SET_COLLECTION 38 [NewLine] # VTK_UNIFORM_HYPER_TREE_GRID 39 [NewLine] # VTK_EXPLICIT_STRUCTURED_GRID 40 [NewLine] # VTK_DATA_OBJECT_TREE 41 [NewLine] # VTK_ABSTRACT_ELECTRONIC_DATA 42 [NewLine] # VTK_OPEN_QUBE_ELECTRONIC_DATA 43 [NewLine] # VTK_ANNOTATION 44 [NewLine] # VTK_ANNOTATION_LAYERS 45 [NewLine] # VTK_BSP_CUTS 46 [NewLine] # VTK_GEO_JSON_FEATURE 47 [NewLine] # VTK_IMAGE_STENCIL_DATA 48 [NewLine] --------------------------------------------------------------------------  Define a casting macro for use by the constants below. # defined ( __cplusplus ) [NewLine] # VTK_TYPE_CAST ( T , V ) static_cast < T > ( V ) [NewLine] # [NewLine] # VTK_TYPE_CAST ( T , V ) ( ( T ) ( V ) ) [NewLine] # [NewLine] --------------------------------------------------------------------------  Define min/max constants for each type. # VTK_BIT_MIN 0 [NewLine] # VTK_BIT_MAX 1 [NewLine] # VTK_TYPE_CHAR_IS_SIGNED [NewLine] # VTK_CHAR_MIN VTK_TYPE_CAST ( char , 0x80 ) [NewLine] # VTK_CHAR_MAX VTK_TYPE_CAST ( char , 0x7f ) [NewLine] # [NewLine] # VTK_CHAR_MIN VTK_TYPE_CAST ( char , 0u ) [NewLine] # VTK_CHAR_MAX VTK_TYPE_CAST ( char , 0xff ) [NewLine] # [NewLine] # VTK_SIGNED_CHAR_MIN VTK_TYPE_CAST ( signed char , 0x80 ) [NewLine] # VTK_SIGNED_CHAR_MAX VTK_TYPE_CAST ( signed char , 0x7f ) [NewLine] # VTK_UNSIGNED_CHAR_MIN VTK_TYPE_CAST ( unsigned char , 0u ) [NewLine] # VTK_UNSIGNED_CHAR_MAX VTK_TYPE_CAST ( unsigned char , 0xff ) [NewLine] # VTK_SHORT_MIN VTK_TYPE_CAST ( short , 0x8000 ) [NewLine] # VTK_SHORT_MAX VTK_TYPE_CAST ( short , 0x7fff ) [NewLine] # VTK_UNSIGNED_SHORT_MIN VTK_TYPE_CAST ( unsigned short , 0u ) [NewLine] # VTK_UNSIGNED_SHORT_MAX VTK_TYPE_CAST ( unsigned short , 0xffff ) [NewLine] # VTK_INT_MIN VTK_TYPE_CAST ( int , ~ ( ~ 0u >> 1 ) ) [NewLine] # VTK_INT_MAX VTK_TYPE_CAST ( int , ~ 0u >> 1 ) [NewLine] # VTK_UNSIGNED_INT_MIN VTK_TYPE_CAST ( unsigned int , 0 ) [NewLine] # VTK_UNSIGNED_INT_MAX VTK_TYPE_CAST ( unsigned int , ~ 0u ) [NewLine] # VTK_LONG_MIN VTK_TYPE_CAST ( long , ~ ( ~ 0ul >> 1 ) ) [NewLine] # VTK_LONG_MAX VTK_TYPE_CAST ( long , ~ 0ul >> 1 ) [NewLine] # VTK_UNSIGNED_LONG_MIN VTK_TYPE_CAST ( unsigned long , 0ul ) [NewLine] # VTK_UNSIGNED_LONG_MAX VTK_TYPE_CAST ( unsigned long , ~ 0ul ) [NewLine] # VTK_FLOAT_MIN VTK_TYPE_CAST ( float , - 1.0e+38f ) [NewLine] # VTK_FLOAT_MAX VTK_TYPE_CAST ( float , 1.0e+38f ) [NewLine] # VTK_DOUBLE_MIN VTK_TYPE_CAST ( double , - 1.0e+299 ) [NewLine] # VTK_DOUBLE_MAX VTK_TYPE_CAST ( double , 1.0e+299 ) [NewLine] # VTK_LONG_LONG_MIN VTK_TYPE_CAST ( long long , ~ ( ~ 0ull >> 1 ) ) [NewLine] # VTK_LONG_LONG_MAX VTK_TYPE_CAST ( long long , ~ 0ull >> 1 ) [NewLine] # VTK_UNSIGNED_LONG_LONG_MIN VTK_TYPE_CAST ( unsigned long long , 0ull ) [NewLine] # VTK_UNSIGNED_LONG_LONG_MAX VTK_TYPE_CAST ( unsigned long long , ~ 0ull ) [NewLine] --------------------------------------------------------------------------  Define named types and constants corresponding to specific integer
##    and floating-point sizes and signedness.  Select an 8-bit integer type. # VTK_SIZEOF_CHAR == 1 [NewLine] typedef unsigned char vtkTypeUInt8 ;
## Error: identifier expected, but got: ;!!!

type
  vtkTypeInt8* = cchar
#proc getVersionMajor(): cint {.cdecl,
#    importcpp: "OCC_VERSION_MAJOR@", header: "Standard_Version.hxx".}
# {.push  cdecl, header: "vtkType.h".}
# proc VTK_VOID*():int {.importcpp: "VTK_VOID@".}
# proc VTK_BIT*():int {.importcpp: "VTK_BIT@".}
# {.pop.}
const VTK_VOID = 0
const VTK_BIT = 1
const VTK_CHAR = 2
const VTK_SIGNED_CHAR = 15
const VTK_UNSIGNED_CHAR = 3
const VTK_SHORT = 4
const VTK_UNSIGNED_SHORT = 5
const VTK_INT = 6
const VTK_UNSIGNED_INT = 7
const VTK_LONG = 8
const VTK_UNSIGNED_LONG = 9
const VTK_FLOAT = 10
const VTK_DOUBLE = 11
const VTK_ID_TYPE = 12

#  = These = types = are = not = currently = supported by GetDataType, but are for
#   completeness.  */
const VTK_STRING = 13
const VTK_OPAQUE = 14

const VTK_LONG_LONG = 16
const VTK_UNSIGNED_LONG_LONG = 17

#  These types are required by vtkVariant and vtkVariantArray */
const VTK_VARIANT = 20
const VTK_OBJECT = 21

#  = deleted = value
# const VTK_UNICODE_STRING = 22 <==== do not use

# --------------------------------------------------------------------------*/
#  Define a unique integer identifier for each vtkDataObject type.          */
#  When adding a new data type here, make sure to update                    */
#  vtkDataObjectTypes as well.                                              */
const VTK_POLY_DATA = 0
const VTK_STRUCTURED_POINTS = 1
const VTK_STRUCTURED_GRID = 2
const VTK_RECTILINEAR_GRID = 3
const VTK_UNSTRUCTURED_GRID = 4
const VTK_PIECEWISE_FUNCTION = 5
const VTK_IMAGE_DATA = 6
const VTK_DATA_OBJECT = 7
const VTK_DATA_SET = 8
const VTK_POINT_SET = 9
const VTK_UNIFORM_GRID = 10
const VTK_COMPOSITE_DATA_SET = 11
const VTK_MULTIGROUP_DATA_SET = 12
const VTK_MULTIBLOCK_DATA_SET = 13
const VTK_HIERARCHICAL_DATA_SET = 14
const VTK_HIERARCHICAL_BOX_DATA_SET = 15
const VTK_GENERIC_DATA_SET = 16
const VTK_HYPER_OCTREE = 17
const VTK_TEMPORAL_DATA_SET = 18
const VTK_TABLE = 19
const VTK_GRAPH = 20
const VTK_TREE = 21
const VTK_SELECTION = 22
const VTK_DIRECTED_GRAPH = 23
const VTK_UNDIRECTED_GRAPH = 24
const VTK_MULTIPIECE_DATA_SET = 25
const VTK_DIRECTED_ACYCLIC_GRAPH = 26
const VTK_ARRAY_DATA = 27
const VTK_REEB_GRAPH = 28
const VTK_UNIFORM_GRID_AMR = 29
const VTK_NON_OVERLAPPING_AMR = 30
const VTK_OVERLAPPING_AMR = 31
const VTK_HYPER_TREE_GRID = 32
const VTK_MOLECULE = 33
const VTK_PISTON_DATA_OBJECT = 34
const VTK_PATH = 35
const VTK_UNSTRUCTURED_GRID_BASE = 36
const VTK_PARTITIONED_DATA_SET = 37
const VTK_PARTITIONED_DATA_SET_COLLECTION = 38
const VTK_UNIFORM_HYPER_TREE_GRID = 39
const VTK_EXPLICIT_STRUCTURED_GRID = 40
const VTK_DATA_OBJECT_TREE = 41
const VTK_ABSTRACT_ELECTRONIC_DATA = 42
const VTK_OPEN_QUBE_ELECTRONIC_DATA = 43
const VTK_ANNOTATION = 44
const VTK_ANNOTATION_LAYERS = 45
const VTK_BSP_CUTS = 46
const VTK_GEO_JSON_FEATURE = 47
const VTK_IMAGE_STENCIL_DATA = 48

# --------------------------------------------------------------------------*/
#  = Define a casting macro for use by the constants below.  */
#if defined(__cplusplus)
#const VTK_TYPE_CAST(T, V) = static_cast<T>(V)
#else
#const VTK_TYPE_CAST(T, V) = ((T)(V))
#endif

# --------------------------------------------------------------------------*/
#  = Define = min/max = constants = for = each = type.  */
# const VTK_BIT_MIN = 0
# const VTK_BIT_MAX = 1
# #if = VTK_TYPE_CHAR_IS_SIGNED
# const VTK_CHAR_MIN = VTK_TYPE_CAST(char, = 0x80)
# const VTK_CHAR_MAX = VTK_TYPE_CAST(char, = 0x7f)
# #else
# const VTK_CHAR_MIN = VTK_TYPE_CAST(char, = 0u)
# const VTK_CHAR_MAX = VTK_TYPE_CAST(char, = 0xffu)
# #endif
{.push  cdecl, header: "vtkType.h".}
proc VTK_SIGNED_CHAR_MIN*():int {.importcpp: "VTK_UNSIGNED_CHAR_MIN@".}
proc VTK_SIGNED_CHAR_MAX*():int {.importcpp: "VTK_UNSIGNED_CHAR_MAX@".}
proc VTK_UNSIGNED_CHAR_MIN*():int {.importcpp: "VTK_UNSIGNED_CHAR_MIN@".}
proc VTK_UNSIGNED_CHAR_MAX*():int {.importcpp: "VTK_UNSIGNED_CHAR_MAX@".}

proc VTK_SHORT_MIN*():int {.importcpp: "VTK_SHORT_MIN@".}
proc VTK_SHORT_MAX*():int {.importcpp: "VTK_SHORT_MAX@".}

proc VTK_UNSIGNED_SHORT_MIN*():int {.importcpp: "VTK_UNSIGNED_SHORT_MIN@".}
proc VTK_UNSIGNED_SHORT_MAX*():int {.importcpp: "VTK_UNSIGNED_SHORT_MAX@".}

proc VTK_INT_MIN*():int {.importcpp: "VTK_INT_MIN@".}
proc VTK_INT_MAX*():int {.importcpp: "VTK_INT_MAX@".}

proc VTK_UNSIGNED_INT_MIN*():int {.importcpp: "VTK_UNSIGNED_INT_MIN@".}
proc VTK_UNSIGNED_INT_MAX*():int {.importcpp: "VTK_UNSIGNED_INT_MAX@".}

# proc VTK_INT_MIN*():int {.importcpp: "VTK_INT_MIN@".}
# proc VTK_INT_MAX*():int {.importcpp: "VTK_INT_MAX@".}

# proc VTK_UNSIGNED_INT_MIN*():int {.importcpp: "VTK_UNSIGNED_INT_MIN@".}
# proc VTK_UNSIGNED_INT_MAX*():int {.importcpp: "VTK_UNSIGNED_SHORT_MAX@".}

proc VTK_LONG_MIN*():int {.importcpp: "VTK_LONG_MIN@".}
proc VTK_LONG_MAX*():int {.importcpp: "VTK_LONG_MAX@".}

proc VTK_UNSIGNED_LONG_MIN*():int {.importcpp: "VTK_UNSIGNED_LONG_MIN@".}
proc VTK_UNSIGNED_LONG_MAX*():int {.importcpp: "VTK_UNSIGNED_LONG_MAX@".}

proc VTK_FLOAT_MIN*():int {.importcpp: "VTK_FLOAT_MIN@".}
proc VTK_FLOAT_MAX*():int {.importcpp: "VTK_FLOAT_MAX@".}

proc VTK_DOUBLE_MIN*():int {.importcpp: "VTK_DOUBLE_MIN@".}
proc VTK_DOUBLE_MAX*():int {.importcpp: "VTK_DOUBLE_MAX@".}

proc VTK_LONG_LONG_MIN*():int {.importcpp: "VTK_LONG_LONG_MIN@".}
proc VTK_LONG_LONG_MAX*():int {.importcpp: "VTK_LONG_LONG_MAX@".}

proc VTK_UNSIGNED_LONG_LONG_MIN*():int {.importcpp: "VTK_UNSIGNED_LONG_LONG_MIN@".}
proc VTK_UNSIGNED_LONG_LONG_MAX*():int {.importcpp: "VTK_UNSIGNED_LONG_LONG_MAX@".}

#proc VTK_SIZEOF_SHORT_Func*(): cint {.importcpp: "VTK_SIZEOF_SHORT@", compileTime.}
{.pop.}

const VTK_SIZEOF_SHORT = 2#VTK_SIZEOF_SHORT_Func()
const VTK_SIZEOF_INT   = 4

# const VTK_SIGNED_CHAR_MIN = VTK_TYPE_CAST(signed = char, = 0x80)
# const VTK_SIGNED_CHAR_MAX = VTK_TYPE_CAST(signed char, 0x7f)
# const VTK_UNSIGNED_CHAR_MIN VTK_TYPE_CAST(unsigned char, 0u)
# const VTK_UNSIGNED_CHAR_MAX VTK_TYPE_CAST(unsigned char, 0xffu)
# const VTK_SHORT_MIN VTK_TYPE_CAST(short, 0x8000)
# const VTK_SHORT_MAX VTK_TYPE_CAST(short, 0x7fff)
# const VTK_UNSIGNED_SHORT_MIN VTK_TYPE_CAST(unsigned short, 0u)
# const VTK_UNSIGNED_SHORT_MAX VTK_TYPE_CAST(unsigned short, 0xffffu)
# const VTK_INT_MIN VTK_TYPE_CAST(int, ~(~0u >> 1))
# const VTK_INT_MAX VTK_TYPE_CAST(int, ~0u >> 1)
# const VTK_UNSIGNED_INT_MIN VTK_TYPE_CAST(unsigned int, 0)
# const VTK_UNSIGNED_INT_MAX VTK_TYPE_CAST(unsigned int, ~0u)
# const VTK_LONG_MIN VTK_TYPE_CAST(long, ~(~0ul >> 1))
# const VTK_LONG_MAX VTK_TYPE_CAST(long, ~0ul >> 1)
# const VTK_UNSIGNED_LONG_MIN VTK_TYPE_CAST(unsigned long, 0ul)
# const VTK_UNSIGNED_LONG_MAX VTK_TYPE_CAST(unsigned long, ~0ul)
# const VTK_FLOAT_MIN VTK_TYPE_CAST(float, -1.0e+38f)
# const VTK_FLOAT_MAX VTK_TYPE_CAST(float, 1.0e+38f)
# const VTK_DOUBLE_MIN VTK_TYPE_CAST(double, -1.0e+299)
# const VTK_DOUBLE_MAX VTK_TYPE_CAST(double, 1.0e+299)
# const VTK_LONG_LONG_MIN VTK_TYPE_CAST(long long, ~(~0ull >> 1))
# const VTK_LONG_LONG_MAX VTK_TYPE_CAST(long long, ~0ull >> 1)


# const VTK_UNSIGNED_LONG_LONG_MIN VTK_TYPE_CAST(unsigned long long, 0ull)
# const VTK_UNSIGNED_LONG_LONG_MAX VTK_TYPE_CAST(unsigned long long, ~0ull)

const
  VTK_TYPE_UINT8* = VTK_UNSIGNED_CHAR
  VTK_TYPE_UINT8_MIN* = VTK_UNSIGNED_CHAR_MIN
  VTK_TYPE_UINT8_MAX* = VTK_UNSIGNED_CHAR_MAX
  VTK_TYPE_INT8* = VTK_SIGNED_CHAR
  VTK_TYPE_INT8_MIN* = VTK_SIGNED_CHAR_MIN
  VTK_TYPE_INT8_MAX* = VTK_SIGNED_CHAR_MAX

##  Select a 16-bit integer type.

when VTK_SIZEOF_SHORT == 2:
  type
    vtkTypeUInt16* = cushort
    vtkTypeInt16* = cshort
  const
    VTK_TYPE_UINT16* = VTK_UNSIGNED_SHORT
    VTK_TYPE_UINT16_MIN* = VTK_UNSIGNED_SHORT_MIN
    VTK_TYPE_UINT16_MAX* = VTK_UNSIGNED_SHORT_MAX
    VTK_TYPE_INT16* = VTK_SHORT
    VTK_TYPE_INT16_MIN* = VTK_SHORT_MIN
    VTK_TYPE_INT16_MAX* = VTK_SHORT_MAX
elif VTK_SIZEOF_INT == 2:
  type
    vtkTypeUInt16* = cuint
    vtkTypeInt16* = cint
  const
    VTK_TYPE_UINT16* = VTK_UNSIGNED_INT
    VTK_TYPE_UINT16_MIN* = VTK_UNSIGNED_INT_MIN
    VTK_TYPE_UINT16_MAX* = VTK_UNSIGNED_INT_MAX
    VTK_TYPE_INT16* = VTK_INT
    VTK_TYPE_INT16_MIN* = VTK_INT_MIN
    VTK_TYPE_INT16_MAX* = VTK_INT_MAX
else:
  discard
##  Select a 32-bit integer type.

when VTK_SIZEOF_INT == 4:
  type
    vtkTypeUInt32* = cuint
    vtkTypeInt32* = cint
  const
    VTK_TYPE_UINT32* = VTK_UNSIGNED_INT
    VTK_TYPE_UINT32_MIN* = VTK_UNSIGNED_INT_MIN
    VTK_TYPE_UINT32_MAX* = VTK_UNSIGNED_INT_MAX
    VTK_TYPE_INT32* = VTK_INT
    VTK_TYPE_INT32_MIN* = VTK_INT_MIN
    VTK_TYPE_INT32_MAX* = VTK_INT_MAX
elif VTK_SIZEOF_LONG == 4:
  type
    vtkTypeUInt32* = culong
    vtkTypeInt32* = clong
  const
    VTK_TYPE_UINT32* = VTK_UNSIGNED_LONG
    VTK_TYPE_UINT32_MIN* = VTK_UNSIGNED_LONG_MIN
    VTK_TYPE_UINT32_MAX* = VTK_UNSIGNED_LONG_MAX
    VTK_TYPE_INT32* = VTK_LONG
    VTK_TYPE_INT32_MIN* = VTK_LONG_MIN
    VTK_TYPE_INT32_MAX* = VTK_LONG_MAX
else:
  discard
##  Select a 64-bit integer type.

## !!!Ignored construct:  # VTK_SIZEOF_LONG_LONG == 8 [NewLine] typedef unsigned long long vtkTypeUInt64 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef signed long long vtkTypeInt64 ;
## Error: identifier expected, but got: ;!!!

const
  VTK_TYPE_UINT64* = VTK_UNSIGNED_LONG_LONG
  VTK_TYPE_UINT64_MIN* = VTK_UNSIGNED_LONG_LONG_MIN
  VTK_TYPE_UINT64_MAX* = VTK_UNSIGNED_LONG_LONG_MAX
  VTK_TYPE_INT64* = VTK_LONG_LONG
  VTK_TYPE_INT64_MIN* = VTK_LONG_LONG_MIN
  VTK_TYPE_INT64_MAX* = VTK_LONG_LONG_MAX

type
  vtkTypeUInt64* = culong
  vtkTypeInt64* = clong

# const
#   VTK_TYPE_UINT64* = VTK_UNSIGNED_LONG
#   VTK_TYPE_UINT64_MIN* = VTK_UNSIGNED_LONG_MIN
#   VTK_TYPE_UINT64_MAX* = VTK_UNSIGNED_LONG_MAX
#   VTK_TYPE_INT64* = VTK_LONG
#   VTK_TYPE_INT64_MIN* = VTK_LONG_MIN
#   VTK_TYPE_INT64_MAX* = VTK_LONG_MAX

when not defined(VTK_LEGACY_REMOVE):
  ##  Provide this define to facilitate apps that need to support older
  ##  versions that do not have vtkMTimeType
##  If this is a 64-bit platform, or the user has indicated that 64-bit
##  timestamps should be used, select an unsigned 64-bit integer type
##  for use in MTime values. If possible, use 'unsigned long' as we have
##  historically.

const VTK_SIZEOF_VOID_P = 8
const VTK_SIZEOF_LONG = 8
const VTK_SIZEOF_FLOAT = 4
const VTK_SIZEOF_DOUBLE = 8


when defined(VTK_USE_64BIT_TIMESTAMPS) or VTK_SIZEOF_VOID_P == 8:
  when VTK_SIZEOF_LONG == 8:
    type
      vtkMTimeType* = culong
    const
      VTK_MTIME_TYPE_IMPL* = VTK_UNSIGNED_LONG
      VTK_MTIME_MIN* = VTK_UNSIGNED_LONG_MIN
      VTK_MTIME_MAX* = VTK_UNSIGNED_LONG_MAX
  else:
    type
      vtkMTimeType* = vtkTypeUInt64
    const
      VTK_MTIME_TYPE_IMPL* = VTK_TYPE_UINT64
      VTK_MTIME_MIN* = VTK_TYPE_UINT64_MIN
      VTK_MTIME_MAX* = VTK_TYPE_UINT64_MAX
else:
  when VTK_SIZEOF_LONG == 4:
    type
      vtkMTimeType* = culong
    const
      VTK_MTIME_TYPE_IMPL* = VTK_UNSIGNED_LONG
      VTK_MTIME_MIN* = VTK_UNSIGNED_LONG_MIN
      VTK_MTIME_MAX* = VTK_UNSIGNED_LONG_MAX
  else:
    type
      vtkMTimeType* = vtkTypeUInt32
    const
      VTK_MTIME_TYPE_IMPL* = VTK_TYPE_UINT32
      VTK_MTIME_MIN* = VTK_TYPE_UINT32_MIN
      VTK_MTIME_MAX* = VTK_TYPE_UINT32_MAX
##  Select a 32-bit floating point type.

when VTK_SIZEOF_FLOAT == 4:
  type
    vtkTypeFloat32* = cfloat
  const
    VTK_TYPE_FLOAT32* = VTK_FLOAT
else:
  discard
##  Select a 64-bit floating point type.

when VTK_SIZEOF_DOUBLE == 8:
  type
    vtkTypeFloat64* = cdouble
  const
    VTK_TYPE_FLOAT64* = VTK_DOUBLE
else:
  discard
## --------------------------------------------------------------------------
##  Choose an implementation for vtkIdType.

when defined(VTK_USE_64BIT_IDS):
  when VTK_SIZEOF_LONG_LONG == 8:
    type
      vtkIdType* = clonglong
    const
      VTK_ID_TYPE_IMPL* = VTK_LONG_LONG
      VTK_SIZEOF_ID_TYPE* = VTK_SIZEOF_LONG_LONG
      VTK_ID_MIN* = VTK_LONG_LONG_MIN
      VTK_ID_MAX* = VTK_LONG_LONG_MAX
      VTK_ID_TYPE_PRId* = "lld"
  elif VTK_SIZEOF_LONG == 8:
    type
      vtkIdType* = clong
    const
      VTK_ID_TYPE_IMPL* = VTK_LONG
      VTK_SIZEOF_ID_TYPE* = VTK_SIZEOF_LONG
      VTK_ID_MIN* = VTK_LONG_MIN
      VTK_ID_MAX* = VTK_LONG_MAX
      VTK_ID_TYPE_PRId* = "ld"
  else:
    discard
else:
  type
    vtkIdType* = cint
  const
    VTK_ID_TYPE_IMPL* = VTK_INT
    VTK_SIZEOF_ID_TYPE* = VTK_SIZEOF_INT
    VTK_ID_MIN* = VTK_INT_MIN
    VTK_ID_MAX* = VTK_INT_MAX
    VTK_ID_TYPE_PRId* = "d"
##  Make sure that when VTK headers are used by the C compiler we make
##  sure to define the bool type. This is possible when using IO features
##  like vtkXMLWriterC.h

# import
#   stdbool

## --------------------------------------------------------------------------
##  If not already defined, define vtkTypeBool. When VTK was started, some
##  compilers did not yet support the bool type, and so VTK often used int,
##  or more rarely unsigned int, where it should have used bool.
##  Eventually vtkTypeBool will switch to real bool.

# when 1:
#   type
#     vtkTypeBool* = cint
#     vtkTypeUBool* = cuint
# else:
type
  vtkTypeBool* = bool
  vtkTypeUBool* = bool
## --------------------------------------------------------------------------
## * A macro to instantiate a template over all numerical types

template vtkInstantiateTemplateMacro*(decl: untyped): untyped =
  decl[cfloat]

## ignored statement

## !!!Ignored construct:  decl < double > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < char > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < signed char > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < unsigned char > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < short > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < unsigned short > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < int > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < unsigned int > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < long > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < unsigned long > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < long long > [end of template] ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  decl < unsigned long long > [end of template] [NewLine] * A macro to declare extern templates for all numerical types # VTK_USE_EXTERN_TEMPLATE [NewLine] # vtkExternTemplateMacro ( decl ) vtkInstantiateTemplateMacro ( decl ) [NewLine] # [NewLine] # vtkExternTemplateMacro ( decl ) [NewLine] # [NewLine] # [NewLine]  VTK-HeaderTest-Exclude: vtkType.h
## Error: identifier expected, but got: [NewLine]!!!

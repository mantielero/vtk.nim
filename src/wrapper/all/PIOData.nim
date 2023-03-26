when not defined(_PIODATA_H):
  type
    Cstring_less* {.importcpp: "Cstring_less", header: "PIOData.h", bycopy.} = object

  proc `()`*(this: Cstring_less; p: cstring; q: cstring): bool {.noSideEffect,
      importcpp: "#(@)", header: "PIOData.h".}
  ##  Class Declarations
  discard "forward decl of PIO_DATA"
  discard "forward decl of PIO_FIELD"
  type
    PIO_FIELD* {.importcpp: "PIO_FIELD", header: "PIOData.h", bycopy.} = object
      pio_name* {.importc: "pio_name".}: cstring
      index* {.importc: "index".}: cint
      length* {.importc: "length".}: int64_t
      position* {.importc: "position".}: int64_t
      chksum* {.importc: "chksum".}: int64_t
      cdata_len* {.importc: "cdata_len".}: csize_t
      read_field_data* {.importc: "read_field_data".}: bool

  ##  End class PIO_FIELD
  ##  Typedefs for the mapping between the names of the PIO blocks in the PIO file and
  ##  the PIO_FIELD's used to store the data values in the PIO blocks.
  type
    VAR_MAP* = multimap[cstring, ptr PIO_FIELD, Cstring_less]
    VMI* = `iterator`
    CVMI* = const_iterator
    VMP* = pair[VMI, VMI]
    CVMP* = pair[CVMI, CVMI]
  type
    PIO_DATA* {.importcpp: "PIO_DATA", header: "PIOData.h", bycopy.} = object
      VarMMap* {.importc: "VarMMap".}: VAR_MAP ##  Multimap from pio_name to a PIO_FIELD class
      verbose* {.importc: "verbose".}: bool
      ##  Date and Time

  proc constructPIO_DATA*(piofile: cstring = 0; fields_to_read: ptr list[string] = 0;
                         _defer_read_data: bool = true;
                         rdata: ptr set[cstring, Cstring_less] = 0;
                         cdata: ptr set[cstring, Cstring_less] = 0): PIO_DATA {.
      constructor, importcpp: "PIO_DATA(@)", header: "PIOData.h".}
  proc destroyPIO_DATA*(this: var PIO_DATA) {.importcpp: "#.~PIO_DATA()",
      header: "PIOData.h".}
  proc GetPIOfileTime*(this: var PIO_DATA; a2: cstring; a3: var cdouble): bool {.
      importcpp: "GetPIOfileTime", header: "PIOData.h".}
  proc print*(this: var PIO_DATA; a2: var ostream) {.importcpp: "print",
      header: "PIOData.h".}
  proc print*(this: var PIO_DATA; a2: cstring) {.importcpp: "print", header: "PIOData.h".}
  proc set_scalar_field*(this: var PIO_DATA; a2: var valarray[cint]; a3: cstring): bool {.
      importcpp: "set_scalar_field", header: "PIOData.h".}
  proc set_scalar_field*(this: var PIO_DATA; a2: var valarray[int64_t]; a3: cstring): bool {.
      importcpp: "set_scalar_field", header: "PIOData.h".}
  proc set_scalar_field*(this: var PIO_DATA; a2: var valarray[uint64_t]; a3: cstring): bool {.
      importcpp: "set_scalar_field", header: "PIOData.h".}
  proc set_scalar_field*(this: var PIO_DATA; a2: var valarray[cdouble]; a3: cstring): bool {.
      importcpp: "set_scalar_field", header: "PIOData.h".}
  proc set_vector_field*(this: var PIO_DATA; a2: var valarray[valarray[cdouble]];
                        a3: cstring): bool {.importcpp: "set_vector_field",
      header: "PIOData.h".}
  proc good_read*(this: var PIO_DATA): bool {.importcpp: "good_read",
      header: "PIOData.h".}
  proc get_name*(this: PIO_DATA): cstring {.noSideEffect, importcpp: "get_name",
                                        header: "PIOData.h".}
  proc get_reverse_endian*(this: PIO_DATA): bool {.noSideEffect,
      importcpp: "get_reverse_endian", header: "PIOData.h".}
  proc get_PIO_VERSION*(this: PIO_DATA): cint {.noSideEffect,
      importcpp: "get_PIO_VERSION", header: "PIOData.h".}
  proc get_PIO_NAME_LENGTH*(this: PIO_DATA): cint {.noSideEffect,
      importcpp: "get_PIO_NAME_LENGTH", header: "PIOData.h".}
  proc get_PIO_HEADER_LENGTH*(this: PIO_DATA): cint {.noSideEffect,
      importcpp: "get_PIO_HEADER_LENGTH", header: "PIOData.h".}
  proc get_PIO_INDEX_LENGTH*(this: PIO_DATA): cint {.noSideEffect,
      importcpp: "get_PIO_INDEX_LENGTH", header: "PIOData.h".}
  proc get_pio_dandt*(this: PIO_DATA): cstring {.noSideEffect,
      importcpp: "get_pio_dandt", header: "PIOData.h".}
  proc get_pio_num*(this: PIO_DATA): cint {.noSideEffect, importcpp: "get_pio_num",
                                        header: "PIOData.h".}
  proc get_pio_num_with_size*(this: PIO_DATA; n: int64_t): cint {.noSideEffect,
      importcpp: "get_pio_num_with_size", header: "PIOData.h".}
  proc get_pio_signature*(this: PIO_DATA): cint {.noSideEffect,
      importcpp: "get_pio_signature", header: "PIOData.h".}
  proc get_pio_field*(this: PIO_DATA): ptr PIO_FIELD {.noSideEffect,
      importcpp: "get_pio_field", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: var PIO_FIELD; a3: ptr cdouble; a4: cstring) {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: var PIO_FIELD; a3: ptr cdouble) {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: var PIO_FIELD; a3: cstring) {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: var PIO_FIELD): ptr cdouble {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: cstring; a3: ptr cdouble; a4: cstring) {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: cstring; a3: ptr cdouble) {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: cstring; a3: cstring) {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: cstring): ptr cdouble {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc GetPIOData*(this: var PIO_DATA; a2: cstring; a3: cint): cdouble {.
      importcpp: "GetPIOData", header: "PIOData.h".}
  proc reconstruct_chunk_field*(this: var PIO_DATA; numcell: int64_t;
                               va: var valarray[cdouble]; prefix: cstring;
                               `var`: cstring; materialId: cint): bool {.
      importcpp: "reconstruct_chunk_field", header: "PIOData.h".}
  proc AddRealData*(this: var PIO_DATA; _name: cstring) {.importcpp: "AddRealData",
      header: "PIOData.h".}
  proc AddCharData*(this: var PIO_DATA; _name: cstring) {.importcpp: "AddCharData",
      header: "PIOData.h".}
  proc FreePIOData*(this: var PIO_DATA; pio_field: var PIO_FIELD) {.
      importcpp: "FreePIOData", header: "PIOData.h".}
  ##  End class PIO_DATA
  ##  Locations of various data items from the input arrays, amhc_i, amhc_r8,
  ##  amch_l, and controller_r8
  const
    Ntime* = 0                  ##  time = controller_r8[Ntime];
    Nnumdim* = 42               ##  numdim = amhc_i[Nnumdim]
    Nmesh0* = 16                ##  N[0] = amhc_i[Nmesh0]
    Nmesh1* = 17                ##  N[1] = amhc_i[Nmesh1]
    Nmesh2* = 29                ##  N[2] = amhc_i[Nmesh2]
    Nd0* = 21                   ##  d[0] = amhc_r8[Nd0]
    Nd1* = 22                   ##  d[1] = amhc_r8[Nd1]
    Nd2* = 38                   ##  d[2] = amhc_r8[Nd2]
    NZero0* = 19                ##  Zero[0] = amhc_r8[NZero0]
    NZero1* = 20                ##  Zero[1] = amhc_r8[NZero1]
    NZero2* = 35                ##  Zero[2] = amhc_r8[NZero2]
    Ncylin* = 1                 ##  cylindrically (axisymmetric) symmetric
             ##  geometry if amhc_l[Ncylin]!=0
    Nsphere* = 8
  ##  Prototypes
  proc GetPIOfileTime*(a1: cstring; a2: var cdouble): bool {.
      importcpp: "GetPIOfileTime(@)", header: "PIOData.h".}
  proc IsPIOfile*(a1: cstring): bool {.importcpp: "IsPIOfile(@)", header: "PIOData.h".}
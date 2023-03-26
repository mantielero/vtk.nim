##  ============================================================================
##  The following classes define an LRU cache for data arrays
##  loaded by the Exodus reader. Here's how they work:
##
##  The actual cache consists of two STL containers: a set of
##  cache entries (vtkExodusIICacheEntry) and a list of
##  cache references (vtkExodusIICacheRef). The entries in
##  these containers are sorted for fast retrieval:
##  1. The cache entries are indexed by the timestep, the
##     object type (edge block, face set, ...), and the
##     object ID (if one exists). When you call Find() to
##     retrieve a cache entry, you provide a key containing
##     this information and the array is returned if it exists.
##  2. The list of cache references are stored in "least-recently-used"
##     order. The least recently referenced array is the first in
##     the list. Whenever you request an entry with Find(), it is
##     moved to the back of the list if it exists.
##  This makes retrieving arrays O(n log n) and popping LRU
##  entries O(1). Each cache entry stores an iterator into
##  the list of references so that it can be located quickly for
##  removal.

import
  vtkIOExodusModule, vtkObject

type
  vtkExodusIICacheKey* {.importcpp: "vtkExodusIICacheKey",
                        header: "vtkExodusIICache.h", bycopy.} = object
    Time* {.importc: "Time".}: cint
    ObjectType* {.importc: "ObjectType".}: cint
    ObjectId* {.importc: "ObjectId".}: cint
    ArrayId* {.importc: "ArrayId".}: cint


proc constructvtkExodusIICacheKey*(): vtkExodusIICacheKey {.constructor,
    importcpp: "vtkExodusIICacheKey(@)", header: "vtkExodusIICache.h".}
proc constructvtkExodusIICacheKey*(time: cint; objType: cint; objId: cint; arrId: cint): vtkExodusIICacheKey {.
    constructor, importcpp: "vtkExodusIICacheKey(@)", header: "vtkExodusIICache.h".}
proc constructvtkExodusIICacheKey*(src: vtkExodusIICacheKey): vtkExodusIICacheKey {.
    constructor, importcpp: "vtkExodusIICacheKey(@)", header: "vtkExodusIICache.h".}
## !!!Ignored construct:  vtkExodusIICacheKey & operator = ( const vtkExodusIICacheKey & src ) = default ;
## Error: token expected: [integer literal] but got: [identifier]!!!

proc match*(this: vtkExodusIICacheKey; other: vtkExodusIICacheKey;
           pattern: vtkExodusIICacheKey): bool {.noSideEffect, importcpp: "match",
    header: "vtkExodusIICache.h".}
proc `<`*(this: vtkExodusIICacheKey; other: vtkExodusIICacheKey): bool {.noSideEffect,
    importcpp: "(# < #)", header: "vtkExodusIICache.h".}
discard "forward decl of vtkExodusIICacheEntry"
discard "forward decl of vtkExodusIICache"
discard "forward decl of vtkDataArray"
type
  vtkExodusIICacheSet* = map[vtkExodusIICacheKey, ptr vtkExodusIICacheEntry]
  vtkExodusIICacheRef* = `iterator`[vtkExodusIICacheKey, ptr vtkExodusIICacheEntry]
  vtkExodusIICacheLRU* = list[vtkExodusIICacheRef]
  vtkExodusIICacheLRURef* = `iterator`[vtkExodusIICacheRef]
  vtkExodusIICacheEntry* {.importcpp: "vtkExodusIICacheEntry",
                          header: "vtkExodusIICache.h", bycopy.} = object


proc constructvtkExodusIICacheEntry*(): vtkExodusIICacheEntry {.constructor,
    importcpp: "vtkExodusIICacheEntry(@)", header: "vtkExodusIICache.h".}
proc constructvtkExodusIICacheEntry*(arr: ptr vtkDataArray): vtkExodusIICacheEntry {.
    constructor, importcpp: "vtkExodusIICacheEntry(@)",
    header: "vtkExodusIICache.h".}
proc constructvtkExodusIICacheEntry*(other: vtkExodusIICacheEntry): vtkExodusIICacheEntry {.
    constructor, importcpp: "vtkExodusIICacheEntry(@)",
    header: "vtkExodusIICache.h".}
proc destroyvtkExodusIICacheEntry*(this: var vtkExodusIICacheEntry) {.
    importcpp: "#.~vtkExodusIICacheEntry()", header: "vtkExodusIICache.h".}
proc GetValue*(this: var vtkExodusIICacheEntry): ptr vtkDataArray {.
    importcpp: "GetValue", header: "vtkExodusIICache.h".}
type
  vtkExodusIICache* {.importcpp: "vtkExodusIICache", header: "vtkExodusIICache.h",
                     bycopy.} = object of vtkObject ## / Default constructor
    vtkExodusIICache* {.importc: "vtkExodusIICache".}: VTK_NEWINSTANCE
    ## / The current size of the cache (i.e., the size of the all the arrays it currently contains) in
    ## / MiB.
    ## * A least-recently-used (LRU) cache to hold arrays.
    ##  During RequestData the cache may contain more than its maximum size since
    ##  the user may request more data than the cache can hold. However, the cache
    ##  is expunged whenever a new array is loaded. Never count on the cache holding
    ##  what you request for very long.
    ##
    ## / The actual LRU list (indices into the cache ordered least to most recently used).


proc New*(): ptr vtkExodusIICache {.importcpp: "vtkExodusIICache::New(@)",
                                header: "vtkExodusIICache.h".}
type
  vtkExodusIICacheSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExodusIICache::IsTypeOf(@)", header: "vtkExodusIICache.h".}
proc IsA*(this: var vtkExodusIICache; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExodusIICache.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExodusIICache {.
    importcpp: "vtkExodusIICache::SafeDownCast(@)", header: "vtkExodusIICache.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExodusIICache :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExodusIICache :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExodusIICache :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExodusIICache; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExodusIICache.h".}
proc Clear*(this: var vtkExodusIICache) {.importcpp: "Clear",
                                      header: "vtkExodusIICache.h".}
proc SetCacheCapacity*(this: var vtkExodusIICache; sizeInMiB: cdouble) {.
    importcpp: "SetCacheCapacity", header: "vtkExodusIICache.h".}
proc GetSpaceLeft*(this: var vtkExodusIICache): cdouble {.importcpp: "GetSpaceLeft",
    header: "vtkExodusIICache.h".}
proc ReduceToSize*(this: var vtkExodusIICache; newSize: cdouble): cint {.
    importcpp: "ReduceToSize", header: "vtkExodusIICache.h".}
proc Insert*(this: var vtkExodusIICache; key: var vtkExodusIICacheKey;
            value: ptr vtkDataArray) {.importcpp: "Insert",
                                    header: "vtkExodusIICache.h".}
proc Find*(this: var vtkExodusIICache; a2: vtkExodusIICacheKey): ptr vtkDataArray {.
    importcpp: "Find", header: "vtkExodusIICache.h".}
proc Invalidate*(this: var vtkExodusIICache; key: vtkExodusIICacheKey): cint {.
    importcpp: "Invalidate", header: "vtkExodusIICache.h".}
proc Invalidate*(this: var vtkExodusIICache; key: vtkExodusIICacheKey;
                pattern: vtkExodusIICacheKey): cint {.importcpp: "Invalidate",
    header: "vtkExodusIICache.h".}
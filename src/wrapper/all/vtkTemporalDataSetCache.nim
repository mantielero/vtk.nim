## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTemporalDataSetCache.h
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
##  @class   vtkTemporalDataSetCache
##  @brief   cache time steps
##
##  vtkTemporalDataSetCache cache time step requests of a temporal dataset,
##  when cached data is requested it is returned using a shallow copy.
##  @par Thanks:
##  Ken Martin (Kitware) and John Bidiscombe of
##  CSCS - Swiss National Supercomputing Centre
##  for creating and contributing this class.
##  For related material, please refer to :
##  John Biddiscombe, Berk Geveci, Ken Martin, Kenneth Moreland, David Thompson,
##  "Time Dependent Processing in a Parallel Pipeline Architecture",
##  IEEE Visualization 2007.
##

import
  vtkFiltersHybridModule, vtkAlgorithm

type
  vtkTemporalDataSetCache* {.importcpp: "vtkTemporalDataSetCache",
                            header: "vtkTemporalDataSetCache.h", bycopy.} = object of vtkAlgorithm
    vtkTemporalDataSetCache* {.importc: "vtkTemporalDataSetCache".}: VTK_NEWINSTANCE
    ## *
    ##  see vtkAlgorithm for details
    ##
    ##  a helper to deal with eviction smoothly. In effect we are an N+1 cache.


proc New*(): ptr vtkTemporalDataSetCache {.importcpp: "vtkTemporalDataSetCache::New(@)",
                                       header: "vtkTemporalDataSetCache.h".}
type
  vtkTemporalDataSetCacheSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTemporalDataSetCache::IsTypeOf(@)",
    header: "vtkTemporalDataSetCache.h".}
proc IsA*(this: var vtkTemporalDataSetCache; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTemporalDataSetCache.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTemporalDataSetCache {.
    importcpp: "vtkTemporalDataSetCache::SafeDownCast(@)",
    header: "vtkTemporalDataSetCache.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTemporalDataSetCache :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTemporalDataSetCache :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTemporalDataSetCache :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTemporalDataSetCache; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTemporalDataSetCache.h".}
proc SetCacheSize*(this: var vtkTemporalDataSetCache; size: cint) {.
    importcpp: "SetCacheSize", header: "vtkTemporalDataSetCache.h".}
## !!!Ignored construct:  virtual int GetCacheSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheSize  of  << this -> CacheSize ) ; return this -> CacheSize ; } ;
## Error: expected ';'!!!

proc SetCacheInMemkind*(this: var vtkTemporalDataSetCache; _arg: bool) {.
    importcpp: "SetCacheInMemkind", header: "vtkTemporalDataSetCache.h".}
## !!!Ignored construct:  virtual bool GetCacheSizeCacheInMemkind ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheInMemkind  of  << this -> CacheInMemkind ) ; return this -> CacheInMemkind ; } ;
## Error: expected ';'!!!

proc CacheInMemkindOn*(this: var vtkTemporalDataSetCache) {.
    importcpp: "CacheInMemkindOn", header: "vtkTemporalDataSetCache.h".}
proc CacheInMemkindOff*(this: var vtkTemporalDataSetCache) {.
    importcpp: "CacheInMemkindOff", header: "vtkTemporalDataSetCache.h".}
  ## /@}
  ## /@{
  ## *
  ##  Tells the filter that needs to act as a pipeline source rather than a midpipline filter. In
  ##  that situation it needs to react differently in a few cases.
  ##
proc SetCacheInMemkindIsASource*(this: var vtkTemporalDataSetCache; _arg: bool) {.
    importcpp: "SetCacheInMemkindIsASource", header: "vtkTemporalDataSetCache.h".}
## !!!Ignored construct:  virtual bool GetCacheSizeCacheInMemkindIsASource ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsASource  of  << this -> IsASource ) ; return this -> IsASource ; } ;
## Error: expected ';'!!!

proc IsASourceOn*(this: var vtkTemporalDataSetCache) {.importcpp: "IsASourceOn",
    header: "vtkTemporalDataSetCache.h".}
proc IsASourceOff*(this: var vtkTemporalDataSetCache) {.importcpp: "IsASourceOff",
    header: "vtkTemporalDataSetCache.h".}
  ## /@}
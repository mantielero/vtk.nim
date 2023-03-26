## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkObjectBase.h
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
##  @class   vtkObjectBase
##  @brief   abstract base class for most VTK objects
##
##  vtkObjectBase is the base class for all reference counted classes
##  in the VTK. These classes include vtkCommand classes, vtkInformationKey
##  classes, and vtkObject classes.
##
##  vtkObjectBase performs reference counting: objects that are
##  reference counted exist as long as another object uses them. Once
##  the last reference to a reference counted object is removed, the
##  object will spontaneously destruct.
##
##  Constructor and destructor of the subclasses of vtkObjectBase
##  should be protected, so that only New() and UnRegister() actually
##  call them. Debug leaks can be used to see if there are any objects
##  left with nonzero reference count.
##
##  @warning
##  Note: Objects of subclasses of vtkObjectBase should always be
##  created with the New() method and deleted with the Delete()
##  method. They cannot be allocated off the stack (i.e., automatic
##  objects) because the constructor is a protected method.
##
##  @sa
##  vtkObject vtkCommand vtkInformationKey
##

##  Semantics around vtkDebugLeaks usage has changed. Now just call
##  vtkObjectBase::InitializeObjectBase() after creating an object with New().
##  The object factory methods take care of this automatically.

import
  vtkCommonCoreModule, vtkFeatures, vtkIndent, vtkSystemIncludes, vtkType

discard "forward decl of vtkGarbageCollector"
discard "forward decl of vtkGarbageCollectorToObjectBaseFriendship"
discard "forward decl of vtkWeakPointerBase"
discard "forward decl of vtkWeakPointerBaseToObjectBaseFriendship"

type
    ostream* = object # FIXME


type
  vtkMallocingFunction* = proc (a1: csize_t): pointer
  vtkReallocingFunction* = proc (a1: pointer; a2: csize_t): pointer
  vtkFreeingFunction* = proc (a1: pointer)
  vtkObjectBase* {.importcpp: "vtkObjectBase", header: "vtkObjectBase.h", 
                   bycopy, pure, inheritable.} = object ## *
                                                                                    ##  Return the class name as a string. This method is overridden
                                                                                    ##  in all subclasses of vtkObjectBase with the vtkTypeMacro found
                                                                                    ##  in vtkSetGet.h.
                                                                                    ##
    ##  Internal Register/UnRegister implementation that accounts for
    ##  possible garbage collection participation.  The second argument
    ##  indicates whether to participate in garbage collection.


## !!!Ignored construct:  public : # VTK_WORKAROUND_WINDOWS_MANGLE [NewLine]  Avoid windows name mangling. # GetClassNameA GetClassName [NewLine] # GetClassNameW GetClassName [NewLine] # [NewLine] *
##  Return the class name as a string.
##  const char * GetClassName ( ) const ;
## Error: identifier expected, but got:  Avoid windows name mangling.!!!

proc GetObjectDescription*(this: vtkObjectBase): string {.noSideEffect,
    importcpp: "GetObjectDescription", header: "vtkObjectBase.h".}
## !!!Ignored construct:  # VTK_WORKAROUND_WINDOWS_MANGLE [NewLine] # GetClassNameW [NewLine] # GetClassNameA [NewLine]  Define possible mangled names. const char * GetClassNameA ( ) const ;
## Error: identifier expected, but got: #!!!

proc GetClassNameW*(this: vtkObjectBase): cstring {.noSideEffect,
    importcpp: "GetClassNameW", header: "vtkObjectBase.h".}
proc IsTypeOf*(name: cstring): vtkTypeBool {.
    importcpp: "vtkObjectBase::IsTypeOf(@)", header: "vtkObjectBase.h".}
proc IsA*(this: var vtkObjectBase; name: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkObjectBase.h".}
proc GetNumberOfGenerationsFromBaseType*(name: cstring): vtkIdType {.
    importcpp: "vtkObjectBase::GetNumberOfGenerationsFromBaseType(@)",
    header: "vtkObjectBase.h".}
proc GetNumberOfGenerationsFromBase*(this: var vtkObjectBase; name: cstring): vtkIdType {.
    importcpp: "GetNumberOfGenerationsFromBase", header: "vtkObjectBase.h".}
proc Delete*(this: var vtkObjectBase) {.importcpp: "Delete", header: "vtkObjectBase.h".}
proc FastDelete*(this: var vtkObjectBase) {.importcpp: "FastDelete",
                                        header: "vtkObjectBase.h".}
proc New*(): ptr vtkObjectBase {.importcpp: "vtkObjectBase::New(@)",
                             header: "vtkObjectBase.h".}
proc InitializeObjectBase*(this: var vtkObjectBase) {.
    importcpp: "InitializeObjectBase", header: "vtkObjectBase.h".}
## !!!Ignored construct:  # defined ( _WIN32 ) || defined ( VTK_USE_MEMKIND ) [NewLine]  Take control of allocation to avoid dll boundary problems or to use memkind. void * operator new ( size_t tSize ) ;
## Error: identifier expected, but got:  Take control of allocation to avoid dll boundary problems or to use memkind.!!!

proc `delete`*(this: var vtkObjectBase; p: pointer) {.
    importcpp: "vtkObjectBase::operator delete", header: "vtkObjectBase.h".}
proc Print*(this: var vtkObjectBase; os: var ostream) {.importcpp: "Print",
    header: "vtkObjectBase.h".}
proc PrintSelf*(this: var vtkObjectBase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkObjectBase.h".}
proc PrintHeader*(this: var vtkObjectBase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintHeader", header: "vtkObjectBase.h".}
proc PrintTrailer*(this: var vtkObjectBase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintTrailer", header: "vtkObjectBase.h".}
proc Register*(this: var vtkObjectBase; o: ptr vtkObjectBase) {.importcpp: "Register",
    header: "vtkObjectBase.h".}
proc UnRegister*(this: var vtkObjectBase; o: ptr vtkObjectBase) {.
    importcpp: "UnRegister", header: "vtkObjectBase.h".}
proc UsesGarbageCollector*(this: vtkObjectBase): bool {.noSideEffect,
    importcpp: "UsesGarbageCollector", header: "vtkObjectBase.h".}
proc GetReferenceCount*(this: var vtkObjectBase): cint {.
    importcpp: "GetReferenceCount", header: "vtkObjectBase.h".}
proc SetReferenceCount*(this: var vtkObjectBase; a2: cint) {.
    importcpp: "SetReferenceCount", header: "vtkObjectBase.h".}
proc SetMemkindDirectory*(directoryname: cstring) {.
    importcpp: "vtkObjectBase::SetMemkindDirectory(@)", header: "vtkObjectBase.h".}
proc GetUsingMemkind*(): bool {.importcpp: "vtkObjectBase::GetUsingMemkind(@)",
                             header: "vtkObjectBase.h".}
type
  vtkObjectBasevtkMemkindRAII* {.importcpp: "vtkObjectBase::vtkMemkindRAII",
                                header: "vtkObjectBase.h", bycopy.} = object
    when defined(VTK_USE_MEMKIND):
      discard


proc constructvtkObjectBasevtkMemkindRAII*(newValue: bool): vtkObjectBasevtkMemkindRAII {.
    constructor, importcpp: "vtkObjectBase::vtkMemkindRAII(@)",
    header: "vtkObjectBase.h".}
proc destroyvtkObjectBasevtkMemkindRAII*(this: var vtkObjectBasevtkMemkindRAII) {.
    importcpp: "#.~vtkMemkindRAII()", header: "vtkObjectBase.h".}
proc constructvtkObjectBasevtkMemkindRAII*(a1: vtkObjectBasevtkMemkindRAII): vtkObjectBasevtkMemkindRAII {.
    constructor, importcpp: "vtkObjectBase::vtkMemkindRAII(@)",
    header: "vtkObjectBase.h".}
proc GetIsInMemkind*(this: vtkObjectBase): bool {.noSideEffect,
    importcpp: "GetIsInMemkind", header: "vtkObjectBase.h".}
##  VTK-HeaderTest-Exclude: vtkObjectBase.h

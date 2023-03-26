import vtkObjectBase
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWeakPointerBase.h
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
##  @class   vtkWeakPointerBase
##  @brief   Non-templated superclass for vtkWeakPointer.
##
##  vtkWeakPointerBase holds a pointer to a vtkObjectBase or subclass
##  instance, but it never affects the reference count of the vtkObjectBase. However,
##  when the vtkObjectBase referred to is destroyed, the pointer gets initialized to
##  nullptr, thus avoid dangling references.
##

## !!!Ignored construct:  # vtkWeakPointerBase_h [NewLine] # vtkWeakPointerBase_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObjectBase.h [NewLine] class vtkObjectBaseToWeakPointerBaseFriendship ;
## Error: token expected: ; but got: [identifier]!!!

type
  vtkWeakPointerBase* {.importcpp: "vtkWeakPointerBase",
                       header: "vtkWeakPointerBase.h", bycopy.} = object ## *
                                                                    ##  Initialize smart pointer to nullptr.
                                                                    ##
                                                                    ##  Initialize weak pointer to given object.


## !!!Ignored construct:  public : *
##  Initialize smart pointer to nullptr.
##  vtkWeakPointerBase ( ) noexcept : Object ( nullptr ) { } *
##  Initialize smart pointer to given object.
##  vtkWeakPointerBase ( vtkObjectBase * r ) ;
## Error: expected ';'!!!

proc constructvtkWeakPointerBase*(r: vtkWeakPointerBase): vtkWeakPointerBase {.
    constructor, importcpp: "vtkWeakPointerBase(@)", header: "vtkWeakPointerBase.h".}
## !!!Ignored construct:  *
##  Move r's object into the new weak pointer, setting r to nullptr.
##  vtkWeakPointerBase ( vtkWeakPointerBase && r ) noexcept ;
## Error: expected ';'!!!

proc destroyvtkWeakPointerBase*(this: var vtkWeakPointerBase) {.
    importcpp: "#.~vtkWeakPointerBase()", header: "vtkWeakPointerBase.h".}
## !!!Ignored construct:  vtkWeakPointerBase & operator = ( vtkWeakPointerBase && r ) noexcept ;
## Error: expected ';'!!!

proc GetPointer*(this: vtkWeakPointerBase): ptr vtkObjectBase {.noSideEffect,
    importcpp: "GetPointer", header: "vtkWeakPointerBase.h".}
## ----------------------------------------------------------------------------

## !!!Ignored construct:  # VTK_WEAK_POINTER_BASE_DEFINE_OPERATOR ( op ) inline bool operator op ( const vtkWeakPointerBase & l , const vtkWeakPointerBase & r ) { return ( static_cast < void * > [end of template] ( l . GetPointer ( ) ) op static_cast < void * > ( r . GetPointer ( ) ) ) ; } inline bool operator op ( vtkObjectBase * l , const vtkWeakPointerBase & r ) { return ( static_cast < void * > ( l ) op static_cast < void * > ( r . GetPointer ( ) ) ) ; } inline bool operator op ( const vtkWeakPointerBase & l , vtkObjectBase * r ) { return ( static_cast < void * > ( l . GetPointer ( ) ) op static_cast < void * > ( r ) ) ; } [NewLine] *
##  Compare smart pointer values.
##  VTK_WEAK_POINTER_BASE_DEFINE_OPERATOR ( == ) VTK_WEAK_POINTER_BASE_DEFINE_OPERATOR ( != ) VTK_WEAK_POINTER_BASE_DEFINE_OPERATOR ( < ) VTK_WEAK_POINTER_BASE_DEFINE_OPERATOR ( <= ) VTK_WEAK_POINTER_BASE_DEFINE_OPERATOR ( > ) VTK_WEAK_POINTER_BASE_DEFINE_OPERATOR ( >= ) # VTK_WEAK_POINTER_BASE_DEFINE_OPERATOR [NewLine] *
##  Streaming operator to print smart pointer like regular pointers.
##  ostream & operator << ( ostream & os , const vtkWeakPointerBase & p ) ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkWeakPointerBase.h

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericAttributeCollection.h
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
##  @class   vtkGenericAttributeCollection
##  @brief   a collection of attributes
##
##  vtkGenericAttributeCollection is a class that collects attributes
##  (represented by vtkGenericAttribute).
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkGenericAttributeInternalVector"
discard "forward decl of vtkIntInternalVector"
discard "forward decl of vtkGenericAttribute"
type
  vtkGenericAttributeCollection* {.importcpp: "vtkGenericAttributeCollection",
                                  header: "vtkGenericAttributeCollection.h",
                                  bycopy.} = object of vtkObject ## *
                                                            ##  Create an empty collection.
                                                            ##
                                                            ## *
                                                            ##  Default constructor: empty collection.
                                                            ##
    vtkGenericAttributeCollection* {.importc: "vtkGenericAttributeCollection".}: VTK_NEWINSTANCE
    ## *
    ##  STL vector for storing index of point centered attributes
    ##
    ##  cache
    ##  cache
    ##  cache
    ##  cache
    ##  cache time stamp
    ## *
    ##  Compute number of components, max number of components and actual
    ##  memory size.
    ##


proc New*(): ptr vtkGenericAttributeCollection {.
    importcpp: "vtkGenericAttributeCollection::New(@)",
    header: "vtkGenericAttributeCollection.h".}
type
  vtkGenericAttributeCollectionSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericAttributeCollection::IsTypeOf(@)",
    header: "vtkGenericAttributeCollection.h".}
proc IsA*(this: var vtkGenericAttributeCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericAttributeCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericAttributeCollection {.
    importcpp: "vtkGenericAttributeCollection::SafeDownCast(@)",
    header: "vtkGenericAttributeCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericAttributeCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericAttributeCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericAttributeCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericAttributeCollection; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkGenericAttributeCollection.h".}
proc GetNumberOfAttributes*(this: var vtkGenericAttributeCollection): cint {.
    importcpp: "GetNumberOfAttributes", header: "vtkGenericAttributeCollection.h".}
proc GetNumberOfComponents*(this: var vtkGenericAttributeCollection): cint {.
    importcpp: "GetNumberOfComponents", header: "vtkGenericAttributeCollection.h".}
proc GetNumberOfPointCenteredComponents*(this: var vtkGenericAttributeCollection): cint {.
    importcpp: "GetNumberOfPointCenteredComponents",
    header: "vtkGenericAttributeCollection.h".}
proc GetMaxNumberOfComponents*(this: var vtkGenericAttributeCollection): cint {.
    importcpp: "GetMaxNumberOfComponents",
    header: "vtkGenericAttributeCollection.h".}
proc GetActualMemorySize*(this: var vtkGenericAttributeCollection): culong {.
    importcpp: "GetActualMemorySize", header: "vtkGenericAttributeCollection.h".}
proc IsEmpty*(this: var vtkGenericAttributeCollection): cint {.importcpp: "IsEmpty",
    header: "vtkGenericAttributeCollection.h".}
proc GetAttribute*(this: var vtkGenericAttributeCollection; i: cint): ptr vtkGenericAttribute {.
    importcpp: "GetAttribute", header: "vtkGenericAttributeCollection.h".}
proc FindAttribute*(this: var vtkGenericAttributeCollection; name: cstring): cint {.
    importcpp: "FindAttribute", header: "vtkGenericAttributeCollection.h".}
proc GetAttributeIndex*(this: var vtkGenericAttributeCollection; i: cint): cint {.
    importcpp: "GetAttributeIndex", header: "vtkGenericAttributeCollection.h".}
proc InsertNextAttribute*(this: var vtkGenericAttributeCollection;
                         a: ptr vtkGenericAttribute) {.
    importcpp: "InsertNextAttribute", header: "vtkGenericAttributeCollection.h".}
proc InsertAttribute*(this: var vtkGenericAttributeCollection; i: cint;
                     a: ptr vtkGenericAttribute) {.importcpp: "InsertAttribute",
    header: "vtkGenericAttributeCollection.h".}
proc RemoveAttribute*(this: var vtkGenericAttributeCollection; i: cint) {.
    importcpp: "RemoveAttribute", header: "vtkGenericAttributeCollection.h".}
proc Reset*(this: var vtkGenericAttributeCollection) {.importcpp: "Reset",
    header: "vtkGenericAttributeCollection.h".}
proc DeepCopy*(this: var vtkGenericAttributeCollection;
              other: ptr vtkGenericAttributeCollection) {.importcpp: "DeepCopy",
    header: "vtkGenericAttributeCollection.h".}
proc ShallowCopy*(this: var vtkGenericAttributeCollection;
                 other: ptr vtkGenericAttributeCollection) {.
    importcpp: "ShallowCopy", header: "vtkGenericAttributeCollection.h".}
proc GetMTime*(this: var vtkGenericAttributeCollection): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkGenericAttributeCollection.h".}
## !!!Ignored construct:   *** ALL THE FOLLOWING METHODS SHOULD BE REMOVED WHEN when the
##  new pipeline update mechanism is checked in.
##  *** BEGIN /@{ *
##  Index of the attribute to be processed (not necessarily scalar).
##  \pre not_empty: !IsEmpty()
##  \post valid_result: result>=0 && result<GetNumberOfAttributes()
##  virtual int GetActiveAttributeActiveAttribute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveAttribute  of  << this -> ActiveAttribute ) ; return this -> ActiveAttribute ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Component of the active attribute to be processed. -1 means module.
##  \pre not_empty: GetNumberOfAttributes()>0
##  \post valid_result: result>=-1 &&
##  result<GetAttribute(GetActiveAttribute())->GetNumberOfComponents()
##  virtual int GetActiveAttributeActiveAttributeActiveComponentActiveComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveComponent  of  << this -> ActiveComponent ) ; return this -> ActiveComponent ; } ;
## Error: expected ';'!!!

proc SetActiveAttribute*(this: var vtkGenericAttributeCollection; attribute: cint;
                        component: cint = 0) {.importcpp: "SetActiveAttribute",
    header: "vtkGenericAttributeCollection.h".}
## !!!Ignored construct:  /@{ *
##  Number of attributes to interpolate.
##  \pre not_empty: !IsEmpty()
##  \post positive_result: result>=0
##  virtual int GetActiveAttributeActiveAttributeActiveComponentActiveComponentNumberOfAttributesToInterpolateNumberOfAttributesToInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfAttributesToInterpolate  of  << this -> NumberOfAttributesToInterpolate ) ; return this -> NumberOfAttributesToInterpolate ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Indices of attributes to interpolate.
##  \pre not_empty: !IsEmpty()
##  \post valid_result: GetNumberOfAttributesToInterpolate()>0
##  int * GetAttributesToInterpolate ( ) VTK_SIZEHINT ( GetNumberOfAttributesToInterpolate ( ) ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Does the array `attributes' of size `size' have `attribute'?
##  \pre positive_size: size>=0
##  \pre valid_attributes: size>0 implies attributes!=0
##  int HasAttribute ( int size , int * attributes , int attribute ) VTK_SIZEHINT ( attributes , size ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@{ *
##  Set the attributes to interpolate.
##  \pre not_empty: !IsEmpty()
##  \pre positive_size: size>=0
##  \pre valid_attributes: size>0 implies attributes!=0
##  \pre valid_attributes_contents: attributes!=0 implies
##  !HasAttributes(size,attributes,GetActiveAttribute())
##  \post is_set: (GetNumberOfAttributesToInterpolate()==size)&&
##  (GetAttributesToInterpolate()==attributes)
##  void SetAttributesToInterpolate ( int size , int * attributes ) VTK_SIZEHINT ( attributes , size ) ;
## Error: expected ';'!!!

proc SetAttributesToInterpolateToAll*(this: var vtkGenericAttributeCollection) {.
    importcpp: "SetAttributesToInterpolateToAll",
    header: "vtkGenericAttributeCollection.h".}
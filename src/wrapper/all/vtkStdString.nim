## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStdString.h
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
##  @class   vtkStdString
##  @brief   Wrapper around std::string to keep symbols short.
##
##  vtkStdString derives from std::string to provide shorter symbol
##  names than basic_string<...> in namespace std given by the standard
##  STL string.
##

## !!!Ignored construct:  # vtkStdString_h [NewLine] # vtkStdString_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkSystemIncludes.h  For VTKCOMMONCORE_EXPORT. # < string >  For the superclass. # < utility >  For std::move [NewLine] class vtkStdString ;
## Error: token expected: ; but got: &!!!

## !!!Ignored construct:  VTKCOMMONCORE_EXPORT ostream & operator << ( ostream & , const vtkStdString & ) ;
## Error: token expected: ; but got: &!!!

type
  vtkStdString* {.importcpp: "vtkStdString", header: "vtkStdString.h", bycopy.} = object of string

  vtkStdStringStdString* = string
  vtkStdStringvalue_type* = value_type
  vtkStdStringpointer* = pointer
  vtkStdStringreference* = reference
  vtkStdStringconst_reference* = const_reference
  vtkStdStringsize_type* = size_type
  vtkStdStringdifference_type* = difference_type
  vtkStdStringiterator* = `iterator`
  vtkStdStringconst_iterator* = const_iterator
  vtkStdStringreverse_iterator* = reverse_iterator
  vtkStdStringconst_reverse_iterator* = const_reverse_iterator

proc constructvtkStdString*(): vtkStdString {.constructor,
    importcpp: "vtkStdString(@)", header: "vtkStdString.h".}
proc constructvtkStdString*(s: ptr vtkStdStringvalue_type): vtkStdString {.
    constructor, importcpp: "vtkStdString(@)", header: "vtkStdString.h".}
proc constructvtkStdString*(s: ptr vtkStdStringvalue_type; n: vtkStdStringsize_type): vtkStdString {.
    constructor, importcpp: "vtkStdString(@)", header: "vtkStdString.h".}
proc constructvtkStdString*(s: string): vtkStdString {.constructor,
    importcpp: "vtkStdString(@)", header: "vtkStdString.h".}
proc constructvtkStdString*(s: var string): vtkStdString {.constructor,
    importcpp: "vtkStdString(@)", header: "vtkStdString.h".}
proc constructvtkStdString*(s: string; pos: vtkStdStringsize_type;
                           n: vtkStdStringsize_type = npos): vtkStdString {.
    constructor, importcpp: "vtkStdString(@)", header: "vtkStdString.h".}
converter `constchar*`*(this: var vtkStdString): cstring {.
    importcpp: "vtkStdString::operator constchar*", header: "vtkStdString.h".}
##  VTK-HeaderTest-Exclude: vtkStdString.h

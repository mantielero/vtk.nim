## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPLY.h
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
##
##
## The interface routines for reading and writing PLY polygon files.
##
## Greg Turk, February 1994
##
## ---------------------------------------------------------------
##
## A PLY file contains a single polygonal _object_.
##
## An object is composed of lists of _elements_.  Typical elements are
## vertices, faces, edges and materials.
##
## Each type of element for a given object has one or more _properties_
## associated with the element type.  For instance, a vertex element may
## have as properties the floating-point values x,y,z and the three unsigned
## chars representing red, green and blue.
##
## ---------------------------------------------------------------
##
## Copyright (c) 1994 The Board of Trustees of The Leland Stanford
## Junior University.  All rights reserved.
##
## Permission to use, copy, modify and distribute this software and its
## documentation for any purpose is hereby granted without fee, provided
## that the above copyright notice and this permission notice appear in
## all copies of this software and that you do not sell the software.
##
## THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT WARRANTY OF ANY KIND,
## EXPRESS, IMPLIED OR OTHERWISE, INCLUDING WITHOUT LIMITATION, ANY
## WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
##
##
## *
##  @class   vtkPLY
##  @brief   a modified version of the PLY 1.1 library
##
##  vtkPLY is a modified version of the PLY 1.1 library. The library
##  has been modified by wrapping in a class (to minimize global symbols);
##  to take advantage of functionality generally not available through the
##  PLY library API; and to correct problems with the PLY library.
##
##  The original distribution was taken from the Stanford University PLY
##  file format release 1.1 (see http://graphics.stanford.edu/data/3Dscanrep/).
##
##  @sa
##  vtkPLYWriter vtkPLYReader
##

import
  vtkIOPLYModule

const
  PLY_ASCII* = 1
  PLY_BINARY_BE* = 2
  PLY_BINARY_LE* = 3
  PLY_OKAY* = 0
  PLY_ERROR* = -1

##  scalar data types supported by PLY format

const
  PLY_START_TYPE* = 0
  PLY_CHAR* = 1
  PLY_SHORT* = 2
  PLY_INT* = 3
  PLY_INT8* = 4
  PLY_INT16* = 5
  PLY_INT32* = 6
  PLY_UCHAR* = 7
  PLY_USHORT* = 8
  PLY_UINT* = 9
  PLY_UINT8* = 10
  PLY_UINT16* = 11
  PLY_UINT32* = 12
  PLY_FLOAT* = 13
  PLY_FLOAT32* = 14
  PLY_DOUBLE* = 15
  PLY_FLOAT64* = 16
  PLY_END_TYPE* = 17
  PLY_SCALAR* = 0
  PLY_LIST* = 1

type
  PlyProperty* {.importcpp: "PlyProperty", header: "vtkPLY.h", bycopy.} = object ##  description of a property
    name* {.importc: "name".}: cstring ##  property name
    external_type* {.importc: "external_type".}: cint ##  file's data type
    internal_type* {.importc: "internal_type".}: cint ##  program's data type
    offset* {.importc: "offset".}: cint ##  offset bytes of prop in a struct
    is_list* {.importc: "is_list".}: cint ##  1 = list, 0 = scalar
    count_external* {.importc: "count_external".}: cint ##  file's count type
    count_internal* {.importc: "count_internal".}: cint ##  program's count type
    count_offset* {.importc: "count_offset".}: cint ##  offset byte for list count

  PlyElement* {.importcpp: "PlyElement", header: "vtkPLY.h", bycopy.} = object ##  description of an element
    name* {.importc: "name".}: cstring ##  element name
    num* {.importc: "num".}: cint ##  number of elements in this object
    size* {.importc: "size".}: cint ##  size of element (bytes) or -1 if variable
    nprops* {.importc: "nprops".}: cint ##  number of properties for this element
    props* {.importc: "props".}: ptr ptr PlyProperty ##  list of properties in the file
    store_prop* {.importc: "store_prop".}: cstring ##  flags: property wanted by user?
    other_offset* {.importc: "other_offset".}: cint ##  offset to un-asked-for props, or -1 if none
    other_size* {.importc: "other_size".}: cint ##  size of other_props structure

  PlyOtherProp* {.importcpp: "PlyOtherProp", header: "vtkPLY.h", bycopy.} = object ##  describes other properties in an element
    name* {.importc: "name".}: cstring ##  element name
    size* {.importc: "size".}: cint ##  size of other_props
    nprops* {.importc: "nprops".}: cint ##  number of properties in other_props
    props* {.importc: "props".}: ptr ptr PlyProperty ##  list of properties in other_props

  OtherData* {.importcpp: "OtherData", header: "vtkPLY.h", bycopy.} = object ##  for storing other_props for an other element
    other_props* {.importc: "other_props".}: pointer

  OtherElem* {.importcpp: "OtherElem", header: "vtkPLY.h", bycopy.} = object ##  data for one "other" element
    elem_name* {.importc: "elem_name".}: cstring ##  names of other elements
    elem_count* {.importc: "elem_count".}: cint ##  count of instances of each element
    other_data* {.importc: "other_data".}: ptr ptr OtherData ##  actual property data for the elements
    other_props* {.importc: "other_props".}: ptr PlyOtherProp ##  description of the property data

  PlyOtherElems* {.importcpp: "PlyOtherElems", header: "vtkPLY.h", bycopy.} = object ##  "other" elements, not interpreted by user
    num_elems* {.importc: "num_elems".}: cint ##  number of other elements
    other_list* {.importc: "other_list".}: ptr OtherElem ##  list of data for other elements

  PlyFile* {.importcpp: "PlyFile", header: "vtkPLY.h", bycopy.} = object ##  description of PLY file
    `is`* {.importc: "is".}: ptr istream ##  input stream
    os* {.importc: "os".}: ptr ostream ##  output stream
    file_type* {.importc: "file_type".}: cint ##  ascii or binary
    version* {.importc: "version".}: cfloat ##  version number of file
    nelems* {.importc: "nelems".}: cint ##  number of elements of object
    elems* {.importc: "elems".}: ptr ptr PlyElement ##  list of elements
    num_comments* {.importc: "num_comments".}: cint ##  number of comments
    comments* {.importc: "comments".}: cstringArray ##  list of comments
    num_obj_info* {.importc: "num_obj_info".}: cint ##  number of items of object information
    obj_info* {.importc: "obj_info".}: cstringArray ##  list of object info items
    which_elem* {.importc: "which_elem".}: ptr PlyElement ##  which element we're currently writing
    other_elems* {.importc: "other_elems".}: ptr PlyOtherElems ##  "other" elements from a PLY file

  vtkPLY* {.importcpp: "vtkPLY", header: "vtkPLY.h", bycopy.} = object ##  standard PLY library interface


proc ply_write*(a1: ptr ostream; a2: cint; a3: cstringArray; a4: cint): ptr PlyFile {.
    importcpp: "vtkPLY::ply_write(@)", header: "vtkPLY.h".}
proc ply_open_for_writing*(a1: cstring; a2: cint; a3: cstringArray; a4: cint): ptr PlyFile {.
    importcpp: "vtkPLY::ply_open_for_writing(@)", header: "vtkPLY.h".}
proc ply_open_for_writing_to_string*(a1: var string; a2: cint; a3: cstringArray;
                                    a4: cint): ptr PlyFile {.
    importcpp: "vtkPLY::ply_open_for_writing_to_string(@)", header: "vtkPLY.h".}
proc ply_describe_element*(a1: ptr PlyFile; a2: cstring; a3: cint; a4: cint;
                          a5: ptr PlyProperty) {.
    importcpp: "vtkPLY::ply_describe_element(@)", header: "vtkPLY.h".}
proc ply_describe_property*(a1: ptr PlyFile; a2: cstring; a3: ptr PlyProperty) {.
    importcpp: "vtkPLY::ply_describe_property(@)", header: "vtkPLY.h".}
proc ply_element_count*(a1: ptr PlyFile; a2: cstring; a3: cint) {.
    importcpp: "vtkPLY::ply_element_count(@)", header: "vtkPLY.h".}
proc ply_header_complete*(a1: ptr PlyFile) {.
    importcpp: "vtkPLY::ply_header_complete(@)", header: "vtkPLY.h".}
proc ply_put_element_setup*(a1: ptr PlyFile; a2: cstring) {.
    importcpp: "vtkPLY::ply_put_element_setup(@)", header: "vtkPLY.h".}
proc ply_put_element*(a1: ptr PlyFile; a2: pointer) {.
    importcpp: "vtkPLY::ply_put_element(@)", header: "vtkPLY.h".}
proc ply_put_comment*(a1: ptr PlyFile; a2: cstring) {.
    importcpp: "vtkPLY::ply_put_comment(@)", header: "vtkPLY.h".}
proc ply_put_obj_info*(a1: ptr PlyFile; a2: cstring) {.
    importcpp: "vtkPLY::ply_put_obj_info(@)", header: "vtkPLY.h".}
proc ply_read*(a1: ptr istream; a2: ptr cint; a3: ptr cstringArray): ptr PlyFile {.
    importcpp: "vtkPLY::ply_read(@)", header: "vtkPLY.h".}
proc ply_open_for_reading*(a1: cstring; a2: ptr cint; a3: ptr cstringArray): ptr PlyFile {.
    importcpp: "vtkPLY::ply_open_for_reading(@)", header: "vtkPLY.h".}
proc ply_open_for_reading_from_string*(a1: string; a2: ptr cint; a3: ptr cstringArray): ptr PlyFile {.
    importcpp: "vtkPLY::ply_open_for_reading_from_string(@)", header: "vtkPLY.h".}
proc ply_get_element_description*(a1: ptr PlyFile; a2: cstring; a3: ptr cint;
                                 a4: ptr cint): ptr PlyElement {.
    importcpp: "vtkPLY::ply_get_element_description(@)", header: "vtkPLY.h".}
proc ply_get_element_setup*(a1: ptr PlyFile; a2: cstring; a3: cint; a4: ptr PlyProperty) {.
    importcpp: "vtkPLY::ply_get_element_setup(@)", header: "vtkPLY.h".}
proc ply_get_property*(a1: ptr PlyFile; a2: cstring; a3: ptr PlyProperty) {.
    importcpp: "vtkPLY::ply_get_property(@)", header: "vtkPLY.h".}
proc ply_get_other_properties*(a1: ptr PlyFile; a2: cstring; a3: cint): ptr PlyOtherProp {.
    importcpp: "vtkPLY::ply_get_other_properties(@)", header: "vtkPLY.h".}
proc ply_get_element*(a1: ptr PlyFile; a2: pointer) {.
    importcpp: "vtkPLY::ply_get_element(@)", header: "vtkPLY.h".}
proc ply_get_comments*(a1: ptr PlyFile; a2: ptr cint): cstringArray {.
    importcpp: "vtkPLY::ply_get_comments(@)", header: "vtkPLY.h".}
proc ply_get_obj_info*(a1: ptr PlyFile; a2: ptr cint): cstringArray {.
    importcpp: "vtkPLY::ply_get_obj_info(@)", header: "vtkPLY.h".}
proc ply_close*(a1: ptr PlyFile) {.importcpp: "vtkPLY::ply_close(@)",
                               header: "vtkPLY.h".}
proc ply_get_info*(a1: ptr PlyFile; a2: ptr cfloat; a3: ptr cint) {.
    importcpp: "vtkPLY::ply_get_info(@)", header: "vtkPLY.h".}
proc ply_get_other_element*(a1: ptr PlyFile; a2: cstring; a3: cint): ptr PlyOtherElems {.
    importcpp: "vtkPLY::ply_get_other_element(@)", header: "vtkPLY.h".}
proc ply_describe_other_elements*(a1: ptr PlyFile; a2: ptr PlyOtherElems) {.
    importcpp: "vtkPLY::ply_describe_other_elements(@)", header: "vtkPLY.h".}
proc ply_put_other_elements*(a1: ptr PlyFile) {.
    importcpp: "vtkPLY::ply_put_other_elements(@)", header: "vtkPLY.h".}
proc ply_free_other_elements*(a1: ptr PlyOtherElems) {.
    importcpp: "vtkPLY::ply_free_other_elements(@)", header: "vtkPLY.h".}
proc ply_describe_other_properties*(a1: ptr PlyFile; a2: ptr PlyOtherProp; a3: cint) {.
    importcpp: "vtkPLY::ply_describe_other_properties(@)", header: "vtkPLY.h".}
proc equal_strings*(a1: cstring; a2: cstring): bool {.
    importcpp: "vtkPLY::equal_strings(@)", header: "vtkPLY.h".}
proc find_element*(a1: ptr PlyFile; a2: cstring): ptr PlyElement {.
    importcpp: "vtkPLY::find_element(@)", header: "vtkPLY.h".}
proc find_property*(a1: ptr PlyElement; a2: cstring; a3: ptr cint): ptr PlyProperty {.
    importcpp: "vtkPLY::find_property(@)", header: "vtkPLY.h".}
proc write_scalar_type*(a1: ptr ostream; a2: cint) {.
    importcpp: "vtkPLY::write_scalar_type(@)", header: "vtkPLY.h".}
proc get_words*(`is`: ptr istream; words: ptr vector[cstring]; line_words: ptr char;
               orig_line: ptr char) {.importcpp: "vtkPLY::get_words(@)",
                                   header: "vtkPLY.h".}
proc write_binary_item*(a1: ptr PlyFile; a2: cint; a3: cuint; a4: cdouble; a5: cint) {.
    importcpp: "vtkPLY::write_binary_item(@)", header: "vtkPLY.h".}
proc write_ascii_item*(a1: ptr ostream; a2: cint; a3: cuint; a4: cdouble; a5: cint) {.
    importcpp: "vtkPLY::write_ascii_item(@)", header: "vtkPLY.h".}
proc old_write_ascii_item*(a1: ptr ostream; a2: cstring; a3: cint): cdouble {.
    importcpp: "vtkPLY::old_write_ascii_item(@)", header: "vtkPLY.h".}
proc add_element*(a1: ptr PlyFile; a2: vector[cstring]) {.
    importcpp: "vtkPLY::add_element(@)", header: "vtkPLY.h".}
proc add_property*(a1: ptr PlyFile; a2: vector[cstring]) {.
    importcpp: "vtkPLY::add_property(@)", header: "vtkPLY.h".}
proc add_comment*(a1: ptr PlyFile; a2: cstring) {.importcpp: "vtkPLY::add_comment(@)",
    header: "vtkPLY.h".}
proc add_obj_info*(a1: ptr PlyFile; a2: cstring) {.
    importcpp: "vtkPLY::add_obj_info(@)", header: "vtkPLY.h".}
proc copy_property*(a1: ptr PlyProperty; a2: ptr PlyProperty) {.
    importcpp: "vtkPLY::copy_property(@)", header: "vtkPLY.h".}
proc store_item*(a1: cstring; a2: cint; a3: cint; a4: cuint; a5: cdouble) {.
    importcpp: "vtkPLY::store_item(@)", header: "vtkPLY.h".}
proc get_stored_item*(a1: pointer; a2: cint; a3: ptr cint; a4: ptr cuint; a5: ptr cdouble) {.
    importcpp: "vtkPLY::get_stored_item(@)", header: "vtkPLY.h".}
proc get_item_value*(a1: cstring; a2: cint): cdouble {.
    importcpp: "vtkPLY::get_item_value(@)", header: "vtkPLY.h".}
proc get_ascii_item*(a1: cstring; a2: cint; a3: ptr cint; a4: ptr cuint; a5: ptr cdouble) {.
    importcpp: "vtkPLY::get_ascii_item(@)", header: "vtkPLY.h".}
proc get_binary_item*(a1: ptr PlyFile; a2: cint; a3: ptr cint; a4: ptr cuint;
                     a5: ptr cdouble): bool {.
    importcpp: "vtkPLY::get_binary_item(@)", header: "vtkPLY.h".}
proc ascii_get_element*(a1: ptr PlyFile; a2: cstring): bool {.
    importcpp: "vtkPLY::ascii_get_element(@)", header: "vtkPLY.h".}
proc binary_get_element*(a1: ptr PlyFile; a2: cstring): bool {.
    importcpp: "vtkPLY::binary_get_element(@)", header: "vtkPLY.h".}
proc my_alloc*(a1: csize_t; a2: cint; a3: cstring): pointer {.
    importcpp: "vtkPLY::my_alloc(@)", header: "vtkPLY.h".}
proc get_prop_type*(a1: cstring): cint {.importcpp: "vtkPLY::get_prop_type(@)",
                                     header: "vtkPLY.h".}
##  VTK-HeaderTest-Exclude: vtkPLY.h

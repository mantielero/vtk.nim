## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMeta.h
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
##  @file vtkMeta.h
##  This file contains a variety of metaprogramming constructs for working
##  with vtk types.
##
##  Forward decs for StripPointers:

discard "forward decl of vtkNew"
discard "forward decl of vtkSmartPointer"
discard "forward decl of vtkWeakPointer"
## ------------------------------------------------------------------------------
##  Strip vtkNew, vtkSmartPointer, etc from a type.

type
  StripPointers*[T] {.importcpp: "vtk::detail::StripPointers<\'0>",
                     header: "vtkMeta.h", bycopy.} = object

  `type`* = T

## !!!Ignored construct:  template < typename T > [end of template] struct StripPointers < T * > { using type = T ; } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < typename ArrayType > [end of template] struct StripPointers < vtkNew < ArrayType >> { using type = ArrayType ; } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < typename ArrayType > [end of template] struct StripPointers < vtkSmartPointer < ArrayType >> { using type = ArrayType ; } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < typename ArrayType > [end of template] struct StripPointers < vtkWeakPointer < ArrayType >> { using type = ArrayType ; } ;
## Error: identifier expected, but got: <!!!

## ------------------------------------------------------------------------------
##  Test if a type is defined (true) or just forward declared (false).

type
  StripPointersStripPointersStripPointersStripPointersIsComplete*[T] {.importcpp: "vtk::detail::StripPointers<\'0>::StripPointers<\'1>::StripPointers<\'2>::StripPointers<\'3>::IsComplete<\'4>",
      header: "vtkMeta.h", bycopy.} = object ##  Can't take the sizeof an incomplete class.


## !!!Ignored construct:  private :  Can't take the sizeof an incomplete class. template < typename U , std :: size_t = sizeof ( U ) > [end of template] static std :: true_type impl ( U * ) ;
## Error: token expected: > [end of template] but got: [identifier]!!!

type
  bool_constant* = typeof(impl(declval[ptr T]()))

##  end namespace vtk::detail

##  VTK-HeaderTest-Exclude: vtkMeta.h

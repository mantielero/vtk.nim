## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRangeIterableTraits.h
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

discard "forward decl of vtkCollection"
discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataObjectTree"
discard "forward decl of CollectionRange"
discard "forward decl of CompositeDataSetRange"
discard "forward decl of DataObjectTreeRange"
## !!!Ignored construct:  template < typename CollectionType , typename = typename std :: enable_if < std :: is_base_of < vtkCollection , CollectionType > :: value > :: type > [end of template] CollectionRange < CollectionType > & DeduceRangeType ( const CollectionType & ) ;
## Error: identifier expected, but got: =!!!

##  vtkCompositeDataSet --> CompositeDataSetRange

proc DeduceRangeType*(a1: vtkCompositeDataSet): var CompositeDataSetRange {.
    importcpp: "vtk::detail::DeduceRangeType(@)",
    header: "vtkRangeIterableTraits.h".}
##  vtkDataObjectTree --> DataObjectTreeRange

proc DeduceRangeType*(a1: vtkDataObjectTree): var DataObjectTreeRange {.
    importcpp: "vtk::detail::DeduceRangeType(@)",
    header: "vtkRangeIterableTraits.h".}
##  Traits class that defines a RangeType corresponding to the iterable range
##  type most appropriate for Iterable.

type
  IterableTraits*[Iterable] {.importcpp: "vtk::detail::IterableTraits<\'0>",
                             header: "vtkRangeIterableTraits.h", bycopy.} = object

  RangeTypeInternal* = typeof(DeduceRangeType(declval[Iterable]()))
  RangeType* = typename

## !!!Ignored construct:  std :: decay < RangeTypeInternal > [end of template] :: type ;
## Error: identifier expected, but got: ;!!!

##  VTK-HeaderTest-Exclude: vtkRangeIterableTraits.h

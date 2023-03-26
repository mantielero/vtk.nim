## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLabelMapLookup.h
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
##  @class   vtkLabelMapLookup
##  @brief   provide an efficient numeric label lookup
##
##
##  vtkLabelMapLookup is a helper object that enables faster lookup of
##  a segmentation label from a set of labels. It uses caching, and
##  different strategies depending on the size of the set of labels.
##
##  @sa
##  vtkSurfaceNets2D vtkSurfaceNets3D vtkDiscreteFlyingEdgesClipper2D
##

## !!!Ignored construct:  # vtkLabelMapLookup_h [NewLine] # vtkLabelMapLookup_h [NewLine] # < unordered_set > [NewLine] # < vector > [NewLine]  Determine whether an image label/object has been specified for output.
##  This requires looking up an image pixel/scalar value and determining
##  whether it's part of a segmented object. Since this can be relatively
##  expensive when performed many times, different lookup classes are used
##  depending on the number of labels specified. A cache is used for the
##  common case of repeated queries for the same label value. template < typename T > [end of template] struct vtkLabelMapLookup { T CachedValue ; T CachedOutValue ; bool CachedOutValueInitialized ; vtkLabelMapLookup ( const double * values , int vtkNotUsed ( numValues ) ) { this -> CachedValue = static_cast < T > [end of template] ( values [ 0 ] ) ; this -> CachedOutValue = static_cast < T > [end of template] ( values [ 0 ] ) ; this -> CachedOutValueInitialized = false ; } virtual ~ vtkLabelMapLookup ( ) = default ; virtual bool IsLabelValue ( T label ) = 0 ; bool IsLabelValueInCache ( T label , bool & inLabelSet ) { if ( label == this -> CachedValue ) { inLabelSet = true ; return true ; } else if ( this -> CachedOutValueInitialized && label == this -> CachedOutValue ) { inLabelSet = false ; return true ; } else { return false ; } }  A little factor for creating the right type of label map based on the
##  number of labels in the set. static vtkLabelMapLookup < T > [end of template] * CreateLabelLookup ( const double * values , vtkIdType numLabels ) ; } ;
## Error: token expected: ; but got: <!!!

##  vtkLabelMapLookup
##  Cache a single contour value

type
  SingleLabelValue*[T] {.importcpp: "SingleLabelValue<\'0>",
                        header: "vtkLabelMapLookup.h", bycopy.} = object of vtkLabelMapLookup[
      T]


proc constructSingleLabelValue*[T](values: ptr cdouble): SingleLabelValue[T] {.
    constructor, importcpp: "SingleLabelValue<\'*0>(@)",
    header: "vtkLabelMapLookup.h".}
proc IsLabelValue*[T](this: var SingleLabelValue[T]; label: T): bool {.
    importcpp: "IsLabelValue", header: "vtkLabelMapLookup.h".}
##  SingleLabelValue
##  Represent a few contour values with a std::vector<>

type
  LabelVector*[T] {.importcpp: "LabelVector<\'0>", header: "vtkLabelMapLookup.h",
                   bycopy.} = object of vtkLabelMapLookup[T]
    Map* {.importc: "Map".}: vector[T]


proc constructLabelVector*[T](values: ptr cdouble; numValues: cint): LabelVector[T] {.
    constructor, importcpp: "LabelVector<\'*0>(@)", header: "vtkLabelMapLookup.h".}
proc IsLabelValue*[T](this: var LabelVector[T]; label: T): bool {.
    importcpp: "IsLabelValue", header: "vtkLabelMapLookup.h".}
##  LabelVector
##  Represent many contour values with a std::set<>

type
  LabelSet*[T] {.importcpp: "LabelSet<\'0>", header: "vtkLabelMapLookup.h", bycopy.} = object of vtkLabelMapLookup[
      T]
    Map* {.importc: "Map".}: unordered_set[T]


proc constructLabelSet*[T](values: ptr cdouble; numValues: cint): LabelSet[T] {.
    constructor, importcpp: "LabelSet<\'*0>(@)", header: "vtkLabelMapLookup.h".}
proc IsLabelValue*[T](this: var LabelSet[T]; label: T): bool {.
    importcpp: "IsLabelValue", header: "vtkLabelMapLookup.h".}
##  LabelSet
##  Given a list of label values (represented generically as doubles),
##  create the appropriate lookup class and add the label values to
##  the collection of labels.

## !!!Ignored construct:  template < typename T > [end of template] vtkLabelMapLookup < T > [end of template] * vtkLabelMapLookup < T > :: CreateLabelLookup ( const double * values , vtkIdType numLabels ) {  These cutoffs are empirical and can be changed. if ( numLabels == 1 ) { return new SingleLabelValue < T > ( values ) ; } else if ( numLabels < 20 ) { return new LabelVector < T > ( values , numLabels ) ; } else { return new LabelSet < T > ( values , numLabels ) ; } } # [NewLine]  VTK-HeaderTest-Exclude: vtkLabelMapLookup.h
## Error: token expected: ; but got: <!!!

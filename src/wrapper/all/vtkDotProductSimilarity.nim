## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDotProductSimilarity.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkDotProductSimilarity
##  @brief   compute dot-product similarity metrics.
##
##
##  Treats matrices as collections of vectors and computes dot-product similarity
##  metrics between vectors.
##
##  The results are returned as an edge-table that lists the index of each vector
##  and their computed similarity.  The output edge-table is typically used with
##  vtkTableToGraph to create a similarity graph.
##
##  This filter can be used with one or two input matrices.  If you provide a single
##  matrix as input, every vector in the matrix is compared with every other vector. If
##  you provide two matrices, every vector in the first matrix is compared with every
##  vector in the second matrix.
##
##  Note that this filter *only* computes the dot-product between each pair of vectors;
##  if you want to compute the cosine of the angles between vectors, you will need to
##  normalize the inputs yourself.
##
##  Inputs:
##    Input port 0: (required) A vtkDenseArray<double> with two dimensions (a matrix).
##    Input port 1: (optional) A vtkDenseArray<double> with two dimensions (a matrix).
##
##  Outputs:
##    Output port 0: A vtkTable containing "source", "target", and "similarity" columns.
##
##  @warning
##  Note that the complexity of this filter is quadratic!  It also requires dense arrays
##  as input, in the future it should be generalized to accept sparse arrays.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkInfovisCoreModule, vtkTableAlgorithm

type
  vtkDotProductSimilarity* {.importcpp: "vtkDotProductSimilarity",
                            header: "vtkDotProductSimilarity.h", bycopy.} = object of vtkTableAlgorithm
    vtkDotProductSimilarity* {.importc: "vtkDotProductSimilarity".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDotProductSimilarity {.importcpp: "vtkDotProductSimilarity::New(@)",
                                       header: "vtkDotProductSimilarity.h".}
type
  vtkDotProductSimilaritySuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDotProductSimilarity::IsTypeOf(@)",
    header: "vtkDotProductSimilarity.h".}
proc IsA*(this: var vtkDotProductSimilarity; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDotProductSimilarity.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDotProductSimilarity {.
    importcpp: "vtkDotProductSimilarity::SafeDownCast(@)",
    header: "vtkDotProductSimilarity.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDotProductSimilarity :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDotProductSimilarity :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDotProductSimilarity :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDotProductSimilarity; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDotProductSimilarity.h".}
## !!!Ignored construct:  /@{ *
##  Controls whether to compute similarities for row-vectors or column-vectors.
##  0 = rows, 1 = columns.
##  virtual vtkIdType GetVectorDimensionVectorDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorDimension  of  << this -> VectorDimension ) ; return this -> VectorDimension ; } ;
## Error: expected ';'!!!

proc SetVectorDimension*(this: var vtkDotProductSimilarity; _arg: vtkIdType) {.
    importcpp: "SetVectorDimension", header: "vtkDotProductSimilarity.h".}
  ## /@}
  ## /@{
  ## *
  ##  When computing similarities for a single input matrix, controls whether the
  ##  results will include the upper diagonal of the similarity matrix.  Default: true.
  ##
## !!!Ignored construct:  virtual int GetVectorDimensionVectorDimensionUpperDiagonal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperDiagonal  of  << this -> UpperDiagonal ) ; return this -> UpperDiagonal ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionUpperDiagonal*(this: var vtkDotProductSimilarity; _arg: cint) {.
    importcpp: "SetVectorDimensionUpperDiagonal",
    header: "vtkDotProductSimilarity.h".}
  ## /@}
  ## /@{
  ## *
  ##  When computing similarities for a single input matrix, controls whether the
  ##  results will include the diagonal of the similarity matrix.  Default: false.
  ##
## !!!Ignored construct:  virtual int GetVectorDimensionVectorDimensionUpperDiagonalDiagonal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Diagonal  of  << this -> Diagonal ) ; return this -> Diagonal ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionUpperDiagonalDiagonal*(this: var vtkDotProductSimilarity;
    _arg: cint) {.importcpp: "SetVectorDimensionUpperDiagonalDiagonal",
                header: "vtkDotProductSimilarity.h".}
  ## /@}
  ## /@{
  ## *
  ##  When computing similarities for a single input matrix, controls whether the
  ##  results will include the lower diagonal of the similarity matrix.  Default: false.
  ##
## !!!Ignored construct:  virtual int GetVectorDimensionVectorDimensionUpperDiagonalDiagonalLowerDiagonal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerDiagonal  of  << this -> LowerDiagonal ) ; return this -> LowerDiagonal ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionUpperDiagonalDiagonalLowerDiagonal*(
    this: var vtkDotProductSimilarity; _arg: cint) {.
    importcpp: "SetVectorDimensionUpperDiagonalDiagonalLowerDiagonal",
    header: "vtkDotProductSimilarity.h".}
  ## /@}
  ## /@{
  ## *
  ##  When computing similarities for two input matrices, controls whether the results
  ##  will include comparisons from the first matrix to the second matrix.
  ##
## !!!Ignored construct:  virtual int GetVectorDimensionVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecond ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FirstSecond  of  << this -> FirstSecond ) ; return this -> FirstSecond ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecond*(
    this: var vtkDotProductSimilarity; _arg: cint) {.importcpp: "SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecond",
    header: "vtkDotProductSimilarity.h".}
  ## /@}
  ## /@{
  ## *
  ##  When computing similarities for two input matrices, controls whether the results
  ##  will include comparisons from the second matrix to the first matrix.
  ##
## !!!Ignored construct:  virtual int GetVectorDimensionVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirst ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SecondFirst  of  << this -> SecondFirst ) ; return this -> SecondFirst ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirst*(
    this: var vtkDotProductSimilarity; _arg: cint) {.importcpp: "SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirst",
    header: "vtkDotProductSimilarity.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specifies a minimum threshold that a similarity must exceed to be included in
  ##  the output.
  ##
## !!!Ignored construct:  virtual double GetVectorDimensionVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumThreshold  of  << this -> MinimumThreshold ) ; return this -> MinimumThreshold ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThreshold*(
    this: var vtkDotProductSimilarity; _arg: cdouble) {.importcpp: "SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThreshold",
    header: "vtkDotProductSimilarity.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specifies a minimum number of edges to include for each vector.
  ##
## !!!Ignored construct:  virtual vtkIdType GetVectorDimensionVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThresholdMinimumCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumCount  of  << this -> MinimumCount ) ; return this -> MinimumCount ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThresholdMinimumCount*(
    this: var vtkDotProductSimilarity; _arg: vtkIdType) {.importcpp: "SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThresholdMinimumCount",
    header: "vtkDotProductSimilarity.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specifies a maximum number of edges to include for each vector.
  ##
## !!!Ignored construct:  virtual vtkIdType GetVectorDimensionVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThresholdMinimumCountMaximumCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumCount  of  << this -> MaximumCount ) ; return this -> MaximumCount ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThresholdMinimumCountMaximumCount*(
    this: var vtkDotProductSimilarity; _arg: vtkIdType) {.importcpp: "SetVectorDimensionUpperDiagonalDiagonalLowerDiagonalFirstSecondSecondFirstMinimumThresholdMinimumCountMaximumCount",
    header: "vtkDotProductSimilarity.h".}
  ## /@}
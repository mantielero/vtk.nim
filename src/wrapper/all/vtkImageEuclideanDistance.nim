## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageEuclideanDistance.h
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
##  @class   vtkImageEuclideanDistance
##  @brief   computes 3D Euclidean DT
##
##  vtkImageEuclideanDistance implements the Euclidean DT using
##  Saito's algorithm. The distance map produced contains the square of the
##  Euclidean distance values.
##
##  The algorithm has a o(n^(D+1)) complexity over nxnx...xn images in D
##  dimensions. It is very efficient on relatively small images. Cuisenaire's
##  algorithms should be used instead if n >> 500. These are not implemented
##  yet.
##
##  For the special case of images where the slice-size is a multiple of
##  2^N with a large N (typically for 256x256 slices), Saito's algorithm
##  encounters a lot of cache conflicts during the 3rd iteration which can
##  slow it very significantly. In that case, one should use
##  vtkImageEuclideanDistance::SetAlgorithmToSaitoCached() instead for better performance.
##
##  References:
##
##  T. Saito and J.I. Toriwaki. New algorithms for Euclidean distance
##  transformations of an n-dimensional digitised picture with applications.
##  Pattern Recognition, 27(11). pp. 1551--1565, 1994.
##
##  O. Cuisenaire. Distance Transformation: fast algorithms and applications
##  to medical image processing. PhD Thesis, Universite catholique de Louvain,
##  October 1999. http://ltswww.epfl.ch/~cuisenai/papers/oc_thesis.pdf
##

import
  vtkImageDecomposeFilter, vtkImagingGeneralModule

const
  VTK_EDT_SAITO_CACHED* = 0
  VTK_EDT_SAITO* = 1

type
  vtkImageEuclideanDistance* {.importcpp: "vtkImageEuclideanDistance",
                              header: "vtkImageEuclideanDistance.h", bycopy.} = object of vtkImageDecomposeFilter
    vtkImageEuclideanDistance* {.importc: "vtkImageEuclideanDistance".}: VTK_NEWINSTANCE
    ##  Replaces "EnlargeOutputUpdateExtent"


proc New*(): ptr vtkImageEuclideanDistance {.
    importcpp: "vtkImageEuclideanDistance::New(@)",
    header: "vtkImageEuclideanDistance.h".}
type
  vtkImageEuclideanDistanceSuperclass* = vtkImageDecomposeFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageEuclideanDistance::IsTypeOf(@)",
    header: "vtkImageEuclideanDistance.h".}
proc IsA*(this: var vtkImageEuclideanDistance; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageEuclideanDistance.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageEuclideanDistance {.
    importcpp: "vtkImageEuclideanDistance::SafeDownCast(@)",
    header: "vtkImageEuclideanDistance.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageEuclideanDistance :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageDecomposeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageEuclideanDistance :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageEuclideanDistance :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageEuclideanDistance; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageEuclideanDistance.h".}
proc SetInitialize*(this: var vtkImageEuclideanDistance; _arg: vtkTypeBool) {.
    importcpp: "SetInitialize", header: "vtkImageEuclideanDistance.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInitialize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Initialize  of  << this -> Initialize ) ; return this -> Initialize ; } ;
## Error: expected ';'!!!

proc InitializeOn*(this: var vtkImageEuclideanDistance) {.importcpp: "InitializeOn",
    header: "vtkImageEuclideanDistance.h".}
proc InitializeOff*(this: var vtkImageEuclideanDistance) {.
    importcpp: "InitializeOff", header: "vtkImageEuclideanDistance.h".}
  ## /@}
  ## /@{
  ## *
  ##  Used to define whether Spacing should be used in the computation of the
  ##  distances
  ##
proc SetInitializeConsiderAnisotropy*(this: var vtkImageEuclideanDistance;
                                     _arg: vtkTypeBool) {.
    importcpp: "SetInitializeConsiderAnisotropy",
    header: "vtkImageEuclideanDistance.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInitializeConsiderAnisotropy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConsiderAnisotropy  of  << this -> ConsiderAnisotropy ) ; return this -> ConsiderAnisotropy ; } ;
## Error: expected ';'!!!

proc ConsiderAnisotropyOn*(this: var vtkImageEuclideanDistance) {.
    importcpp: "ConsiderAnisotropyOn", header: "vtkImageEuclideanDistance.h".}
proc ConsiderAnisotropyOff*(this: var vtkImageEuclideanDistance) {.
    importcpp: "ConsiderAnisotropyOff", header: "vtkImageEuclideanDistance.h".}
  ## /@}
  ## /@{
  ## *
  ##  Any distance bigger than this->MaximumDistance will not ne computed but
  ##  set to this->MaximumDistance instead.
  ##
proc SetInitializeConsiderAnisotropyMaximumDistance*(
    this: var vtkImageEuclideanDistance; _arg: cdouble) {.
    importcpp: "SetInitializeConsiderAnisotropyMaximumDistance",
    header: "vtkImageEuclideanDistance.h".}
## !!!Ignored construct:  virtual double GetInitializeConsiderAnisotropyMaximumDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumDistance  of  << this -> MaximumDistance ) ; return this -> MaximumDistance ; } ;
## Error: expected ';'!!!

proc SetInitializeConsiderAnisotropyMaximumDistanceAlgorithm*(
    this: var vtkImageEuclideanDistance; _arg: cint) {.
    importcpp: "SetInitializeConsiderAnisotropyMaximumDistanceAlgorithm",
    header: "vtkImageEuclideanDistance.h".}
## !!!Ignored construct:  virtual int GetInitializeConsiderAnisotropyMaximumDistanceAlgorithm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Algorithm  of  << this -> Algorithm ) ; return this -> Algorithm ; } ;
## Error: expected ';'!!!

proc SetAlgorithmToSaito*(this: var vtkImageEuclideanDistance) {.
    importcpp: "SetAlgorithmToSaito", header: "vtkImageEuclideanDistance.h".}
proc SetAlgorithmToSaitoCached*(this: var vtkImageEuclideanDistance) {.
    importcpp: "SetAlgorithmToSaitoCached", header: "vtkImageEuclideanDistance.h".}
proc IterativeRequestData*(this: var vtkImageEuclideanDistance;
                          a2: ptr vtkInformation; a3: ptr ptr vtkInformationVector;
                          a4: ptr vtkInformationVector): cint {.
    importcpp: "IterativeRequestData", header: "vtkImageEuclideanDistance.h".}
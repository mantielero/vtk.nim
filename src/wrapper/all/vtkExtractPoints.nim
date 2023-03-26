## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractPoints.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkExtractPoints
##  @brief   extract points within an implicit function
##
##
##  vtkExtractPoints removes points that are either inside or outside of a
##  vtkImplicitFunction. Implicit functions in VTK defined as function of the
##  form f(x,y,z)=c, where values c<=0 are interior values of the implicit
##  function. Typical examples include planes, spheres, cylinders, cones,
##  etc. plus boolean combinations of these functions. (This operation
##  presumes closure on the set, so points on the boundary are also considered
##  to be inside.)
##
##  Note that while any vtkPointSet type can be provided as input, the output is
##  represented by an explicit representation of points via a
##  vtkPolyData. This output polydata will populate its instance of vtkPoints,
##  but no cells will be defined (i.e., no vtkVertex or vtkPolyVertex are
##  contained in the output). Also, after filter execution, the user can
##  request a vtkIdType* map which indicates how the input points were mapped
##  to the output. A value of map[i] (where i is the ith input point) less
##  than 0 means that the ith input point was removed. (See also the
##  superclass documentation for accessing the removed points through the
##  filter's second output.)
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @warning
##  The vtkExtractEnclosedPoints filter can be used to extract points inside of
##  a volume defined by a manifold, closed polygonal surface. This filter
##  however is much slower than methods based on implicit functions (like this
##  filter).
##
##  @sa
##  vtkExtractEnclosedPoints vtkSelectEnclosedPoints vtkPointCloudFilter
##  vtkRadiusOutlierRemoval vtkStatisticalOutlierRemoval vtkThresholdPoints
##  vtkImplicitFunction vtkExtractGeometry vtkFitImplicitFunction
##

import
  vtkFiltersPointsModule, vtkPointCloudFilter

discard "forward decl of vtkImplicitFunction"
discard "forward decl of vtkPointSet"
type
  vtkExtractPoints* {.importcpp: "vtkExtractPoints", header: "vtkExtractPoints.h",
                     bycopy.} = object of vtkPointCloudFilter ## /@{
                                                         ## *
                                                         ##  Standard methods for instantiating, obtaining type information, and
                                                         ##  printing information.
                                                         ##
    vtkExtractPoints* {.importc: "vtkExtractPoints".}: VTK_NEWINSTANCE
    ##  All derived classes must implement this method. Note that a side effect of
    ##  the class is to populate the PointMap. Zero is returned if there is a failure.


proc New*(): ptr vtkExtractPoints {.importcpp: "vtkExtractPoints::New(@)",
                                header: "vtkExtractPoints.h".}
type
  vtkExtractPointsSuperclass* = vtkPointCloudFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractPoints::IsTypeOf(@)", header: "vtkExtractPoints.h".}
proc IsA*(this: var vtkExtractPoints; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExtractPoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractPoints {.
    importcpp: "vtkExtractPoints::SafeDownCast(@)", header: "vtkExtractPoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractPoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractPoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractPoints.h".}
proc SetImplicitFunction*(this: var vtkExtractPoints; a2: ptr vtkImplicitFunction) {.
    importcpp: "SetImplicitFunction", header: "vtkExtractPoints.h".}
proc GetnameImplicitFunction*(this: var vtkExtractPoints): ptr vtkImplicitFunction {.
    importcpp: "GetnameImplicitFunction", header: "vtkExtractPoints.h".}
  ## /@}
  ## /@{
  ## *
  ##  Boolean controls whether to extract points that are inside of implicit
  ##  function (ExtractInside == true) or outside of implicit function
  ##  (ExtractInside == false). By default, ExtractInside is true.
  ##
proc SetExtractInside*(this: var vtkExtractPoints; _arg: bool) {.
    importcpp: "SetExtractInside", header: "vtkExtractPoints.h".}
## !!!Ignored construct:  virtual bool GetExtractInside ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractInside  of  << this -> ExtractInside ) ; return this -> ExtractInside ; } ;
## Error: expected ';'!!!

proc ExtractInsideOn*(this: var vtkExtractPoints) {.importcpp: "ExtractInsideOn",
    header: "vtkExtractPoints.h".}
proc ExtractInsideOff*(this: var vtkExtractPoints) {.importcpp: "ExtractInsideOff",
    header: "vtkExtractPoints.h".}
  ## /@}
  ## *
  ##  Return the MTime taking into account changes to the implicit function
  ##
proc GetMTime*(this: var vtkExtractPoints): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkExtractPoints.h".}
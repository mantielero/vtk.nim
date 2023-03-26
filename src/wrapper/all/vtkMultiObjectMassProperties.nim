## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiObjectMassProperties.h
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
##  @class   vtkMultiObjectMassProperties
##  @brief   compute volume and area of objects in a polygonal mesh
##
##  vtkMultiObjectMassProperties estimates the volume, the surface area, and
##  the centroid of a polygonal mesh. Multiple, valid closed objects may be
##  represented, and each object is assumed to be defined as a polyhedron
##  defined by polygonal faces (i.e., the faces do not have to be triangles).
##  The algorithm computes the total volume and area, as well as per object values
##  which are placed in data arrays. Note that an object is valid only if it is
##  manifold and closed (i.e., each edge is used exactly two times by two different
##  polygons). Invalid objects are processed but may produce inaccurate
##  results. Inconsistent polygon ordering is also allowed.
##
##  The algorithm is composed of two basic parts. First a connected traversal
##  is performed to identify objects, detect whether the objects are valid,
##  and ensure that the composing polygons are ordered consistently. Next, in
##  threaded execution, a parallel process of computing areas, volumes  and
##  centroids is performed. It is possible to skip the first part if the
##  SkipValidityCheck is enabled, AND a vtkIdTypeArray data array named "ObjectIds"
##  is associated with the polygon input (i.e., cell data) that enumerates which
##  object every polygon belongs to (i.e., indicates that it is a boundary
##  polygon of a specified object).
##
##  The algorithm implemented here is inspired by this paper:
##  http://chenlab.ece.cornell.edu/Publication/Cha/icip01_Cha.pdf. Also see
##  the stack-overflow entry: https://stackoverflow.com/questions/1406029/.
##  The centroids are calculated as a weighted average of the centroids of the tetrahedrons
##  which are used to compute the volume of the polygonal object, and the weight is the
##  tetrahedron's volume contribution. If the polygonal object has 0 volume, then the resulted
##  centroid will be (nan, nan, nan). The general assumption here is that the model
##  is of closed surface.  Also, this approach requires triangulating the polygons so
##  triangle meshes are processed much faster. Finally, the volume, area and centroid
##  calculations are done in parallel (threaded) after a connectivity pass is made
##  (used to identify objects and verify that they are manifold and closed).
##
##  The output contains seven additional data arrays. The arrays
##  "ObjectValidity", "ObjectVolumes", "ObjectAreas" and "ObjectCentroids" are
##  placed in the output field data.  These are arrays which indicate which objects are
##  valid; the volume of each object; the surface area of each object; the centroid
##  of each object. Three additional arrays are placed in the output cell data, and
##  indicate, on a per polygons basis, which object the polygon bounds
##  "ObjectIds"; the polygon area "Areas"; and the contribution of volume
##  "Volumes".  Additionally, the TotalVolume and TotalArea is available after
##  the filter executes (i.e., the sum of the ObjectVolumes and ObjectAreas
##  arrays).
##
##  Per-object validity, as mentioned previously, is reported in the
##  ObjectValidity array. However another variable, AllValid, is set after
##  filter execution which indicates whether all objects are valid (!=0) or
##  not. This information can be used as a shortcut in case you want to skip
##  validity checking on an object-by-object basis.
##
##  @warning
##  This filter operates on the polygonal data contained in the input
##  vtkPolyData. Other types (vertices, lines, triangle strips) are ignored and
##  not passed to the output. The input polys and points, as well as
##  associated point and cell data, are passed through to the output.
##
##  @warning
##  This filter is similar to vtkMassProperties. However vtkMassProperties
##  operates on triangle meshes and assumes only a single, closed, properly
##  oriented surface is represented. vtkMultiObjectMassProperties performs
##  additional topological and connectivity operations to identify separate
##  objects, and confirms that they are manifold. It also accommodates
##  inconsistent ordering.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkMassProperties
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkIdTypeArray"
type
  vtkMultiObjectMassProperties* {.importcpp: "vtkMultiObjectMassProperties",
                                 header: "vtkMultiObjectMassProperties.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                              ## *
                                                                                                              ##  Standard methods for construction, type and printing.
                                                                                                              ##
    vtkMultiObjectMassProperties* {.importc: "vtkMultiObjectMassProperties".}: VTK_NEWINSTANCE
    ##  Internal data members supporting algorithm execution
    ##  number of objects identified
    ##  for each input polygon, the object id that the polygon is in
    ##  the array name of ObjectIds.
    ##  is it a valid object?
    ##  what is the object volume (if valid)?
    ##  what is the total object area?
    ##  what is the object centroid
    ##  avoid repetitive new/delete
    ##  processing wave
    ##  Connected traversal to identify objects


proc New*(): ptr vtkMultiObjectMassProperties {.
    importcpp: "vtkMultiObjectMassProperties::New(@)",
    header: "vtkMultiObjectMassProperties.h".}
type
  vtkMultiObjectMassPropertiesSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiObjectMassProperties::IsTypeOf(@)",
    header: "vtkMultiObjectMassProperties.h".}
proc IsA*(this: var vtkMultiObjectMassProperties; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMultiObjectMassProperties.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiObjectMassProperties {.
    importcpp: "vtkMultiObjectMassProperties::SafeDownCast(@)",
    header: "vtkMultiObjectMassProperties.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiObjectMassProperties :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiObjectMassProperties :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiObjectMassProperties :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiObjectMassProperties; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkMultiObjectMassProperties.h".}
proc SetSkipValidityCheck*(this: var vtkMultiObjectMassProperties; _arg: vtkTypeBool) {.
    importcpp: "SetSkipValidityCheck", header: "vtkMultiObjectMassProperties.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSkipValidityCheck ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SkipValidityCheck  of  << this -> SkipValidityCheck ) ; return this -> SkipValidityCheck ; } ;
## Error: expected ';'!!!

proc SkipValidityCheckOn*(this: var vtkMultiObjectMassProperties) {.
    importcpp: "SkipValidityCheckOn", header: "vtkMultiObjectMassProperties.h".}
proc SkipValidityCheckOff*(this: var vtkMultiObjectMassProperties) {.
    importcpp: "SkipValidityCheckOff", header: "vtkMultiObjectMassProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the name of the ObjectIds array. This array, which indicates in which object
  ##  a polygon belongs to, can be either provided by the user or computed.
  ##  The default name is "ObjectIds".
  ##
proc SetObjectIdsArrayName*(this: var vtkMultiObjectMassProperties; arg: cstring) {.
    importcpp: "SetObjectIdsArrayName", header: "vtkMultiObjectMassProperties.h".}
proc GetObjectIdsArrayName*(this: var vtkMultiObjectMassProperties): cstring {.
    importcpp: "GetObjectIdsArrayName", header: "vtkMultiObjectMassProperties.h".}
  ## /@}
  ## *
  ##  Return the number of objects identified. This is valid only after the
  ##  filter executes. Check the ObjectValidity array which indicates which of
  ##  these identified objects are valid. Invalid objects may have incorrect
  ##  volume and area values.
  ##
proc GetNumberOfObjects*(this: var vtkMultiObjectMassProperties): vtkIdType {.
    importcpp: "GetNumberOfObjects", header: "vtkMultiObjectMassProperties.h".}
proc GetAllValid*(this: var vtkMultiObjectMassProperties): vtkTypeBool {.
    importcpp: "GetAllValid", header: "vtkMultiObjectMassProperties.h".}
proc GetTotalVolume*(this: var vtkMultiObjectMassProperties): cdouble {.
    importcpp: "GetTotalVolume", header: "vtkMultiObjectMassProperties.h".}
proc GetTotalArea*(this: var vtkMultiObjectMassProperties): cdouble {.
    importcpp: "GetTotalArea", header: "vtkMultiObjectMassProperties.h".}
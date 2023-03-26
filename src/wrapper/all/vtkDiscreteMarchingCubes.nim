## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDiscreteMarchingCubes.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## // .SECTION Thanks
## // Jim Miller at GE Research implemented the original version of this
## // filter.
## // This work was supported by PHS Research Grant No. 1 P41 RR13218-01
## // from the National Center for Research Resources and supported by a
## // grant from the DARPA, executed by the U.S. Army Medical Research
## // and Materiel Command/TATRC Cooperative Agreement,
## // Contract # W81XWH-04-2-0012.
##
## =========================================================================
## *
##  @class   vtkDiscreteMarchingCubes
##  @brief   generate object boundaries from
##  labelled volumes
##
##  This filter extracts object boundaries from label maps (label maps are
##  volumes in which each voxel is labeled according to the region in which it
##  is contained).  The filter takes as input a volume (e.g., 3D structured
##  point set) of segmentation labels and generates on output one or more
##  models representing the boundaries between the specified label and the
##  adjacent structures.  One or more label values must be specified to
##  generate the models.  The boundary positions are always defined to be
##  half-way between adjacent voxels. This filter works best with integral
##  scalar values.
##
##  If ComputeScalars is on (the default), each output cell will have cell
##  data that corresponding to the scalar value (segmentation label) of the
##  corresponding cube. Note that this differs from vtkMarchingCubes, which
##  stores the scalar value as point data. The rationale for this difference
##  is that cell vertices may be shared between multiple cells. This also
##  means that the resultant polydata may be non-manifold (cell faces may be
##  coincident). To further process the polydata, users should either: 1)
##  extract cells that have a common scalar value using vtkThreshold, or 2)
##  process the data with filters that can handle non-manifold polydata
##  (e.g. vtkWindowedSincPolyDataFilter). Also note, Normals and Gradients are
##  not computed.
##
##  If ComputeAdjacentScalars is on (default is off), each output point will
##  have point data that contains the label value of the neighbouring voxel.
##  This allows to remove regions of the resulting vtkPolyData that are
##  adjacent to specific label meshes. For example, if the input is a label
##  image that was created by running a watershed transformation on a distance
##  map followed by masking with the original binary segmentation. For further
##  details and images see the VTK Journal paper:
##  "Providing values of adjacent voxel with vtkDiscreteMarchingCubes"
##  by Roman Grothausmann:
##  http://hdl.handle.net/10380/3559
##  http://www.vtkjournal.org/browse/publication/975
##
##  @warning
##  This filter is specialized to volumes. If you are interested in contouring
##  other types of data, use the general vtkContourFilter. If you want to
##  contour an image (i.e., a volume slice), use vtFlyingEdges2D or
##  vtkMarchingSquares.
##
##  @sa
##  vtkSurfaceNets3D vtkDiscreteFlyingEdges3D vtkSurfaceNets2D
##  vtkContourFilter vtkSliceCubes vtkMarchingSquares vtkDividingCubes
##

import
  vtkFiltersGeneralModule, vtkMarchingCubes

type
  vtkDiscreteMarchingCubes* {.importcpp: "vtkDiscreteMarchingCubes",
                             header: "vtkDiscreteMarchingCubes.h", bycopy.} = object of vtkMarchingCubes ## /@{
                                                                                                  ## *
                                                                                                  ##  Standard methods for instantiation, obtaining type information, and
                                                                                                  ##  printing the state of an object.
                                                                                                  ##
    vtkDiscreteMarchingCubes* {.importc: "vtkDiscreteMarchingCubes".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDiscreteMarchingCubes {.importcpp: "vtkDiscreteMarchingCubes::New(@)",
                                        header: "vtkDiscreteMarchingCubes.h".}
type
  vtkDiscreteMarchingCubesSuperclass* = vtkMarchingCubes

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDiscreteMarchingCubes::IsTypeOf(@)",
    header: "vtkDiscreteMarchingCubes.h".}
proc IsA*(this: var vtkDiscreteMarchingCubes; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDiscreteMarchingCubes.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDiscreteMarchingCubes {.
    importcpp: "vtkDiscreteMarchingCubes::SafeDownCast(@)",
    header: "vtkDiscreteMarchingCubes.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDiscreteMarchingCubes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMarchingCubes :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDiscreteMarchingCubes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDiscreteMarchingCubes :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDiscreteMarchingCubes; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDiscreteMarchingCubes.h".}
proc SetComputeAdjacentScalars*(this: var vtkDiscreteMarchingCubes;
                               _arg: vtkTypeBool) {.
    importcpp: "SetComputeAdjacentScalars", header: "vtkDiscreteMarchingCubes.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeAdjacentScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeAdjacentScalars  of  << this -> ComputeAdjacentScalars ) ; return this -> ComputeAdjacentScalars ; } ;
## Error: expected ';'!!!

proc ComputeAdjacentScalarsOn*(this: var vtkDiscreteMarchingCubes) {.
    importcpp: "ComputeAdjacentScalarsOn", header: "vtkDiscreteMarchingCubes.h".}
proc ComputeAdjacentScalarsOff*(this: var vtkDiscreteMarchingCubes) {.
    importcpp: "ComputeAdjacentScalarsOff", header: "vtkDiscreteMarchingCubes.h".}
  ## /@}
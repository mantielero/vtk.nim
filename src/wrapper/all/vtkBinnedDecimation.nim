## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBinnedDecimation.h
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
##  @class   vtkBinnedDecimation
##  @brief   reduce the number of triangles in a vtkPolyData mesh
##
##  vtkBinnedDecimation is a filter to reduce the number of triangles in a
##  triangle mesh represented by vtkPolyData. It is similar to
##  vtkQuadricClustering in concept, although it is performance accelerated:
##  it does not use quadric error metrics to position points in the bins, plus
##  it is threaded. (See vtkQuadricClustering for more information.) It also
##  takes some short cuts in the interest of speed: it limits the binning
##  resolution to no more than 2^31 bins; and it can (optionally) reuse the input
##  points in the output (to save memory and computational costs).
##
##  A high-level overview of the algorithm is as follows. Points are binned
##  into a regular grid subdivided in the x-y-z directions. The idea is to
##  combine all the points within each bin into a single point which is then
##  used by the output triangles. Four options are available to generate the
##  output points. If the input points are to be reused as the output points,
##  then all points in the same bin simply adopt the coordinates of one of the
##  selected points in the bin (and thus all points in the bin take on the
##  same output point id). Alternatively, if new output points are to be
##  generated, then either one point is selected; the centers of occupied bins
##  can be used as the output point coordinates; or an average position of all
##  points falling into the bin can be used to generate the bin
##  point. Finally, triangles are inserted into the output: triangles whose
##  three, binned points lie in separate bins are sent to the output, while
##  all others are discarded (i.e., triangles with two or more points in the
##  same bin are not sent to the output).
##
##  To use this filter, specify the divisions defining the spatial subdivision
##  in the x, y, and z directions. Of course you must also specify an input
##  vtkPolyData / filter connection. Higher division levels generally produce
##  results closer to the original mesh. Note that for performance reasons
##  (i.e., related to memory), the maximum divisions in the x-y-z directions
##  is limited in such a way (i.e., proportional scaling of divisions is used)
##  so as to ensure that no more than 2^31 bins are used. Higher divisions have
##  modest impact on the overall performance of the algorithm, although the
##  resolution of the output vtkPolyData is affected significantly (i.e., many
##  more triangles may be generated).
##
##  @warning
##  This filter can drastically affect mesh topology, i.e., topology is not
##  preserved.
##
##  @warning
##  This filter and vtkQuadricClustering produce similar results, with
##  vtkQuadricClustering theoretically producing better results. In practice
##  however, vtkBinnedDecimation produces results that are visually close to
##  vtkQuadricClustering at speeds approaching 10-100x faster (depending on
##  the bin divisions, and how the output points are generated), and the
##  algorithm requires much less memory. Note that the API of this filter is a
##  subset of vtkQuadricClustering and can often be used interchangeably with
##  vtkQuadricClustering.
##
##  @warning
##  Algorithm 4) BIN_CENTERS uses a very different implementation strategy
##  requiring a sort of all points. It scales better as the number of bins
##  increases.
##
##  @warning
##  For certain types of geometry (e.g., a mostly 2D plane with jitter in the
##  normal direction), this decimator can perform badly. In this situation,
##  set the number of bins in the normal direction to one.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential execution type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkQuadricClustering vtkDecimatePro vtkDecimate vtkQuadricLODActor
##  vtkTriangleFilter
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

type
  vtkBinnedDecimation* {.importcpp: "vtkBinnedDecimation",
                        header: "vtkBinnedDecimation.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                            ## *
                                                                                            ##  Standard instantiation, type and print methods.
                                                                                            ##
    vtkBinnedDecimation* {.importc: "vtkBinnedDecimation".}: VTK_NEWINSTANCE
    ##  Since there are two ways of specifying the grid, we the the flag below
    ##  to indicate which the user has set.  When this flag is on, the bin sizes
    ##  are computed from the DivisionOrigin and DivisionSpacing.
    ##  Helper function


proc New*(): ptr vtkBinnedDecimation {.importcpp: "vtkBinnedDecimation::New(@)",
                                   header: "vtkBinnedDecimation.h".}
type
  vtkBinnedDecimationSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBinnedDecimation::IsTypeOf(@)", header: "vtkBinnedDecimation.h".}
proc IsA*(this: var vtkBinnedDecimation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBinnedDecimation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBinnedDecimation {.
    importcpp: "vtkBinnedDecimation::SafeDownCast(@)",
    header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBinnedDecimation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBinnedDecimation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBinnedDecimation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBinnedDecimation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBinnedDecimation.h".}
proc SetNumberOfXDivisions*(this: var vtkBinnedDecimation; num: cint) {.
    importcpp: "SetNumberOfXDivisions", header: "vtkBinnedDecimation.h".}
proc SetNumberOfYDivisions*(this: var vtkBinnedDecimation; num: cint) {.
    importcpp: "SetNumberOfYDivisions", header: "vtkBinnedDecimation.h".}
proc SetNumberOfZDivisions*(this: var vtkBinnedDecimation; num: cint) {.
    importcpp: "SetNumberOfZDivisions", header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  virtual int GetNumberOfXDivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfXDivisions  of  << this -> NumberOfXDivisions ) ; return this -> NumberOfXDivisions ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetNumberOfXDivisionsNumberOfYDivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfYDivisions  of  << this -> NumberOfYDivisions ) ; return this -> NumberOfYDivisions ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfZDivisions  of  << this -> NumberOfZDivisions ) ; return this -> NumberOfZDivisions ; } ;
## Error: expected ';'!!!

proc SetNumberOfDivisions*(this: var vtkBinnedDecimation; `div`: array[3, cint]) {.
    importcpp: "SetNumberOfDivisions", header: "vtkBinnedDecimation.h".}
proc SetNumberOfDivisions*(this: var vtkBinnedDecimation; div0: cint; div1: cint;
                          div2: cint) {.importcpp: "SetNumberOfDivisions",
                                      header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  int * GetNumberOfDivisions ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetNumberOfDivisions*(this: var vtkBinnedDecimation; `div`: array[3, cint]) {.
    importcpp: "GetNumberOfDivisions", header: "vtkBinnedDecimation.h".}
proc SetAutoAdjustNumberOfDivisions*(this: var vtkBinnedDecimation; _arg: bool) {.
    importcpp: "SetAutoAdjustNumberOfDivisions", header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  virtual bool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdjustNumberOfDivisions  of  << this -> AutoAdjustNumberOfDivisions ) ; return this -> AutoAdjustNumberOfDivisions ; } ;
## Error: expected ';'!!!

proc AutoAdjustNumberOfDivisionsOn*(this: var vtkBinnedDecimation) {.
    importcpp: "AutoAdjustNumberOfDivisionsOn", header: "vtkBinnedDecimation.h".}
proc AutoAdjustNumberOfDivisionsOff*(this: var vtkBinnedDecimation) {.
    importcpp: "AutoAdjustNumberOfDivisionsOff", header: "vtkBinnedDecimation.h".}
  ## /@}
  ## /@{
  ## *
  ##  This is an alternative way to set up the bins.  If you are trying to
  ##  match boundaries between pieces, then you should use these methods
  ##  rather than SetNumberOfDivisions(). To use these methods, specify the
  ##  origin and spacing of the spatial binning.
  ##
proc SetDivisionOrigin*(this: var vtkBinnedDecimation; x: cdouble; y: cdouble;
                       z: cdouble) {.importcpp: "SetDivisionOrigin",
                                   header: "vtkBinnedDecimation.h".}
proc SetDivisionOrigin*(this: var vtkBinnedDecimation; o: array[3, cdouble]) {.
    importcpp: "SetDivisionOrigin", header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  virtual double * GetDivisionOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DivisionOrigin  pointer  << this -> DivisionOrigin ) ; return this -> DivisionOrigin ; } VTK_WRAPEXCLUDE virtual void GetDivisionOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DivisionOrigin [ 0 ] ; _arg2 = this -> DivisionOrigin [ 1 ] ; _arg3 = this -> DivisionOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DivisionOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDivisionOrigin ( double _arg [ 3 ] ) { this -> GetDivisionOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDivisionSpacing*(this: var vtkBinnedDecimation; x: cdouble; y: cdouble;
                        z: cdouble) {.importcpp: "SetDivisionSpacing",
                                    header: "vtkBinnedDecimation.h".}
proc SetDivisionSpacing*(this: var vtkBinnedDecimation; s: array[3, cdouble]) {.
    importcpp: "SetDivisionSpacing", header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  virtual double * GetDivisionOriginDivisionSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DivisionSpacing  pointer  << this -> DivisionSpacing ) ; return this -> DivisionSpacing ; } VTK_WRAPEXCLUDE virtual void GetDivisionOriginDivisionSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DivisionSpacing [ 0 ] ; _arg2 = this -> DivisionSpacing [ 1 ] ; _arg3 = this -> DivisionSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DivisionSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDivisionOriginDivisionSpacing ( double _arg [ 3 ] ) { this -> GetDivisionOriginDivisionSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

const
  vtkBinnedDecimationINPUT_POINTS* = 1
  vtkBinnedDecimationBIN_POINTS* = 2
  vtkBinnedDecimationBIN_CENTERS* = 3
  vtkBinnedDecimationBIN_AVERAGES* = 4

proc SetPointGenerationMode*(this: var vtkBinnedDecimation; _arg: cint) {.
    importcpp: "SetPointGenerationMode", header: "vtkBinnedDecimation.h".}
proc GetPointGenerationModeMinValue*(this: var vtkBinnedDecimation): cint {.
    importcpp: "GetPointGenerationModeMinValue", header: "vtkBinnedDecimation.h".}
proc GetPointGenerationModeMaxValue*(this: var vtkBinnedDecimation): cint {.
    importcpp: "GetPointGenerationModeMaxValue", header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  virtual int GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsPointGenerationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointGenerationMode  of  << this -> PointGenerationMode ) ; return this -> PointGenerationMode ; } ;
## Error: expected ';'!!!

proc SetPointGenerationModeToUseInputPoints*(this: var vtkBinnedDecimation) {.
    importcpp: "SetPointGenerationModeToUseInputPoints",
    header: "vtkBinnedDecimation.h".}
proc SetPointGenerationModeToBinPoints*(this: var vtkBinnedDecimation) {.
    importcpp: "SetPointGenerationModeToBinPoints",
    header: "vtkBinnedDecimation.h".}
proc SetPointGenerationModeToBinCenters*(this: var vtkBinnedDecimation) {.
    importcpp: "SetPointGenerationModeToBinCenters",
    header: "vtkBinnedDecimation.h".}
proc SetPointGenerationModeToBinAverages*(this: var vtkBinnedDecimation) {.
    importcpp: "SetPointGenerationModeToBinAverages",
    header: "vtkBinnedDecimation.h".}
proc SetAutoAdjustNumberOfDivisionsProducePointData*(
    this: var vtkBinnedDecimation; _arg: bool) {.
    importcpp: "SetAutoAdjustNumberOfDivisionsProducePointData",
    header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  virtual bool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsPointGenerationModeProducePointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProducePointData  of  << this -> ProducePointData ) ; return this -> ProducePointData ; } ;
## Error: expected ';'!!!

proc ProducePointDataOn*(this: var vtkBinnedDecimation) {.
    importcpp: "ProducePointDataOn", header: "vtkBinnedDecimation.h".}
proc ProducePointDataOff*(this: var vtkBinnedDecimation) {.
    importcpp: "ProducePointDataOff", header: "vtkBinnedDecimation.h".}
  ## /@}
  ## /@{
  ## *
  ##  This flag directs the filter to copy cell data from input to output.
  ##  This flag is off by default.
  ##
proc SetAutoAdjustNumberOfDivisionsProducePointDataProduceCellData*(
    this: var vtkBinnedDecimation; _arg: bool) {.
    importcpp: "SetAutoAdjustNumberOfDivisionsProducePointDataProduceCellData",
    header: "vtkBinnedDecimation.h".}
## !!!Ignored construct:  virtual bool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsPointGenerationModeProducePointDataProduceCellData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProduceCellData  of  << this -> ProduceCellData ) ; return this -> ProduceCellData ; } ;
## Error: expected ';'!!!

proc ProduceCellDataOn*(this: var vtkBinnedDecimation) {.
    importcpp: "ProduceCellDataOn", header: "vtkBinnedDecimation.h".}
proc ProduceCellDataOff*(this: var vtkBinnedDecimation) {.
    importcpp: "ProduceCellDataOff", header: "vtkBinnedDecimation.h".}
  ## /@}
  ## *
  ##  Return a flag indicating whether large ids were used during
  ##  execution. The value of this flag is only valid after filter
  ##  execution. The filter may use a smaller id type unless it must use
  ##  vtkIdType to represent points and cell ids.
  ##
proc GetLargeIds*(this: var vtkBinnedDecimation): bool {.importcpp: "GetLargeIds",
    header: "vtkBinnedDecimation.h".}
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataPlaneClipper.h
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
##  @class   vtkPolyDataPlaneClipper
##  @brief   clip a vtkPolyData with a plane and optionally cap it
##
##  vtkPolyDataPlaneClipper clips an input vtkPolyData with a plane to produce
##  an output vtkPolyData. (Here clipping means extracting cells, or portions
##  of cells, that are on one side of a specified plane.) The input
##  vtkPolyData must consist of convex polygons forming one or more manifold
##  shells (use vtkTriangleFilter to triangulate the input if necessary. Note
##  that if the input cells are non-convex, then the clipping operation will
##  likely produce erroneous results.)
##
##  An optional, second vtkPolyData output may also be generated if either
##  ClippingLoops or Capping is enabled. The clipping loops are a set of lines
##  representing the curve(s) of intersection between the plane and the one or
##  more shells of the input vtkPolyData. If Capping is enabled, then the
##  clipping loops are tessellated to produce a "cap" across the clipped
##  output. The capping option is only available if the input consists of one
##  or more manifold shells. If not, the loop generation will fail and no
##  cap(s) will be generated.
##
##  @warning
##  The method CanFullyProcessDataObject() is available to see whether the
##  input data can be successully processed by this filter. Use this method
##  sparingly because it can be slow.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkClipPolyData vtkClipClosedSurface vtkPolyDataPlaneCutter vtkPlaneCutter
##  vtkTriangleFilter vtkCutter
##

## !!!Ignored construct:  # vtkPolyDataPlaneClipper_h [NewLine] # vtkPolyDataPlaneClipper_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPlane.h  For clipping plane # vtkPolyDataAlgorithm.h [NewLine] # vtkPolyDataPlaneCutter.h  For CanFullyProcessDataObject() method # vtkSmartPointer.h  For SmartPointer [NewLine] class VTKFILTERSCORE_EXPORT vtkPolyDataPlaneClipper : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard construction, type, and print methods.
##  static vtkPolyDataPlaneClipper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyDataPlaneClipper :: IsTypeOf ( type ) ; } static vtkPolyDataPlaneClipper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyDataPlaneClipper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyDataPlaneClipper * NewInstance ( ) const { return vtkPolyDataPlaneClipper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataPlaneClipper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataPlaneClipper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  The modified time depends on the delegated clipping plane.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Specify the plane (an implicit function) to perform the clipping. The
##  definition of the plane used to perform the clipping (i.e., its origin
##  and normal) is controlled via this instance of vtkPlane.
##  void SetPlane ( vtkPlane * ) ; virtual vtkPlane * GetnamePlane ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Plane  address  << static_cast < vtkPlane * > ( this -> Plane ) ) ; return this -> Plane ; } ; /@} /@{ *
##  Specify whether to generate clipping loops, i.e., the intersection of
##  the plane with the input polydata. The generation of clipping loops will
##  function correctly even if the input vtkPolyData consists of non-closed
##  shells; however if the shells are not closed, the loops will not be
##  either. If enabled, a second vtkPolyData output will be produced that
##  contains the clipping loops (in vtkPolyData::Lines)
##  virtual void SetClippingLoops ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ClippingLoops  to  << _arg ) ; if ( this -> ClippingLoops != _arg ) { this -> ClippingLoops = _arg ; this -> Modified ( ) ; } } ; virtual bool GetClippingLoops ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClippingLoops  of  << this -> ClippingLoops ) ; return this -> ClippingLoops ; } ; virtual void ClippingLoopsOn ( ) { this -> SetClippingLoops ( static_cast < bool > ( 1 ) ) ; } virtual void ClippingLoopsOff ( ) { this -> SetClippingLoops ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether to cap the clipped output vtkPolyData. If enabled, a
##  second vtkPolyData output will be produced that contains the capping
##  polygons (in vtkPolyData:Polys). Note that the capping operation assumes
##  that the input to this filter is a manifold shell. If not, no output
##  will be generated. Note that point data or cell data is not produced on
##  this second output (because the results of interpolation across the
##  cap(s) are generally nonsensical).
##  virtual void SetClippingLoopsCapping ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Capping  to  << _arg ) ; if ( this -> Capping != _arg ) { this -> Capping = _arg ; this -> Modified ( ) ; } } ; virtual bool GetClippingLoopsCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ; virtual void CappingOn ( ) { this -> SetClippingLoopsCapping ( static_cast < bool > ( 1 ) ) ; } virtual void CappingOff ( ) { this -> SetClippingLoopsCapping ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Get the output dataset representing the clipping loops and capping
##  polygons.  This output is empty if both ClippingLoops and Capping is
##  off. Otherwise, if there is an intersection with the clipping plane,
##  then polyline loops are available from the vtkPolyData::Lines, and the
##  capping polygons are available from the vtkPolyData::Polys data arrays.
##  vtkPolyData * GetCap ( ) ; /@{ *
##  Specify whether to pass point data through to the second (Cap) output.
##  By default this is disabled. This feature is useful in certain situations
##  when trying to combine the cap with clipped polydata.
##  virtual void SetClippingLoopsCappingPassCapPointData ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassCapPointData  to  << _arg ) ; if ( this -> PassCapPointData != _arg ) { this -> PassCapPointData = _arg ; this -> Modified ( ) ; } } ; virtual bool GetClippingLoopsCappingPassCapPointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassCapPointData  of  << this -> PassCapPointData ) ; return this -> PassCapPointData ; } ; virtual void PassCapPointDataOn ( ) { this -> SetClippingLoopsCappingPassCapPointData ( static_cast < bool > ( 1 ) ) ; } virtual void PassCapPointDataOff ( ) { this -> SetClippingLoopsCappingPassCapPointData ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output points type. See the
##  documentation for the vtkAlgorithm::DesiredOutputPrecision enum for an
##  explanation of the available precision settings. OutputPointsPrecision
##  is DEFAULT_PRECISION by default.
##  virtual void SetClippingLoopsCappingPassCapPointDataOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetClippingLoopsCappingPassCapPointDataOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} /@{ *
##  Specify the number of input triangles in a batch, where a batch defines
##  a subset of the input triangles operated on during threaded
##  execution. Generally this is only used for debugging or performance
##  studies (since batch size affects the thread workload).
##  virtual void SetBatchSize ( unsigned int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BatchSize  to  << _arg ) ; if ( this -> BatchSize != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> BatchSize = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual unsigned int GetBatchSizeMinValue ( ) { return 1 ; } virtual unsigned int GetBatchSizeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual unsigned int GetClippingLoopsCappingPassCapPointDataOutputPointsPrecisionBatchSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BatchSize  of  << this -> BatchSize ) ; return this -> BatchSize ; } ; /@} *
##  This helper method can be used to determine the if the input vtkPolyData
##  contains convex polygonal cells, and therefore is suitable for
##  processing by this filter. (The name of the method is consistent with
##  other filters that perform similar operations.) This method returns true
##  when the input contains only polygons (i.e., no verts, lines, or
##  triangle strips); and each polygon is convex. It returns false
##  otherwise.
##  static bool CanFullyProcessDataObject ( vtkDataObject * object ) { return vtkPolyDataPlaneCutter :: CanFullyProcessDataObject ( object ) ; } protected : vtkPolyDataPlaneClipper ( ) ; ~ vtkPolyDataPlaneClipper ( ) override ; vtkSmartPointer < vtkPlane > Plane ; bool ClippingLoops ; bool Capping ; bool PassCapPointData ; int OutputPointsPrecision ; unsigned int BatchSize ;  Pipeline-related methods int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkPolyDataPlaneClipper ( const vtkPolyDataPlaneClipper & ) = delete ; void operator = ( const vtkPolyDataPlaneClipper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

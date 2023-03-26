## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataPlaneCutter.h
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
##  @class   vtkPolyDataPlaneCutter
##  @brief   threaded (high-performance) cutting of a vtkPolyData with a plane
##
##  vtkPolyDataPlaneCutter cuts an input vtkPolyData with a plane to produce
##  an output vtkPolyData. (Here cutting means slicing through the polydata to
##  generates lines of intersection.) The input vtkPolyData must consist of
##  convex polygons - vertices, lines, and triangle strips are ignored. (Note:
##  use vtkTriangleFilter to triangulate non-convex input polygons if
##  necessary. If the input cells are non-convex, then the cutting operation
##  will likely produce erroneous results.)
##
##  The main difference between this filter and other cutting filters is that
##  vtkPolyDataPlaneCutter is tuned for performance on vtkPolyData with convex
##  polygonal cells.
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
##  vtkPlaneCutter vtkCutter vtkPolyDataPlaneClipper
##

## !!!Ignored construct:  # vtkPolyDataPlaneCutter_h [NewLine] # vtkPolyDataPlaneCutter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPlane.h  For cutting plane # vtkPolyDataAlgorithm.h [NewLine] # vtkSmartPointer.h  For SmartPointer [NewLine] class VTKFILTERSCORE_EXPORT vtkPolyDataPlaneCutter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard construction, type, and print methods.
##  static vtkPolyDataPlaneCutter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyDataPlaneCutter :: IsTypeOf ( type ) ; } static vtkPolyDataPlaneCutter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyDataPlaneCutter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyDataPlaneCutter * NewInstance ( ) const { return vtkPolyDataPlaneCutter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataPlaneCutter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataPlaneCutter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the plane (an implicit function) to perform the cutting. The
##  definition of the plane used to perform the cutting (i.e., its origin
##  and normal) is controlled via this instance of vtkPlane.
##  void SetPlane ( vtkPlane * ) ; virtual vtkPlane * GetnamePlane ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Plane  address  << static_cast < vtkPlane * > ( this -> Plane ) ) ; return this -> Plane ; } ; /@} /@{ *
##  Set/Get the computation of normals. The normal generated is simply the
##  cut plane normal. The normals are associated with the output points. By
##  default the computation of normals is disabled.
##  virtual void SetComputeNormals ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetComputeNormals ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetComputeNormals ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to interpolate attribute data. By default this is
##  enabled. Note that both cell data and point data is interpolated and
##  output.
##  virtual void SetComputeNormalsInterpolateAttributes ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InterpolateAttributes  to  << _arg ) ; if ( this -> InterpolateAttributes != _arg ) { this -> InterpolateAttributes = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeNormalsInterpolateAttributes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateAttributes  of  << this -> InterpolateAttributes ) ; return this -> InterpolateAttributes ; } ; virtual void InterpolateAttributesOn ( ) { this -> SetComputeNormalsInterpolateAttributes ( static_cast < bool > ( 1 ) ) ; } virtual void InterpolateAttributesOff ( ) { this -> SetComputeNormalsInterpolateAttributes ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output points type. See the
##  documentation for the vtkAlgorithm::DesiredOutputPrecision enum for an
##  explanation of the available precision settings. OutputPointsPrecision
##  is DEFAULT_PRECISION by default.
##  virtual void SetComputeNormalsInterpolateAttributesOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetComputeNormalsInterpolateAttributesOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} *
##  The modified time depends on the delegated cutting plane.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Specify the number of input cells in a batch, where a batch defines
##  a subset of the input cells operated on during threaded
##  execution. Generally this is only used for debugging or performance
##  studies (since batch size affects the thread workload). By default,
##  the batch size is 10,000 cells.
##  virtual void SetBatchSize ( unsigned int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BatchSize  to  << _arg ) ; if ( this -> BatchSize != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> BatchSize = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual unsigned int GetBatchSizeMinValue ( ) { return 1 ; } virtual unsigned int GetBatchSizeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual unsigned int GetComputeNormalsInterpolateAttributesOutputPointsPrecisionBatchSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BatchSize  of  << this -> BatchSize ) ; return this -> BatchSize ; } ; /@} *
##  This helper method can be used to determine the if the input vtkPolyData
##  contains convex polygonal cells, and therefore is suitable for
##  processing by this filter. (The name of the method is consistent with
##  other filters that perform similar operations.) This method returns true
##  when the input contains only polygons (i.e., no verts, lines, or
##  triangle strips); and each polygon is convex. It returns false
##  otherwise.
##  static bool CanFullyProcessDataObject ( vtkDataObject * object ) ; protected : vtkPolyDataPlaneCutter ( ) ; ~ vtkPolyDataPlaneCutter ( ) override ; vtkSmartPointer < vtkPlane > Plane ; bool ComputeNormals ; bool InterpolateAttributes ; int OutputPointsPrecision ; unsigned int BatchSize ;  Pipeline-related methods int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkPolyDataPlaneCutter ( const vtkPolyDataPlaneCutter & ) = delete ; void operator = ( const vtkPolyDataPlaneCutter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

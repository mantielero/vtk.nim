## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBandedPolyDataContourFilter.h
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
##  @class   vtkBandedPolyDataContourFilter
##  @brief   generate filled contours for vtkPolyData
##
##  vtkBandedPolyDataContourFilter is a filter that takes as input vtkPolyData
##  and produces as output filled contours (also represented as vtkPolyData).
##  Filled contours are bands of cells that all have the same cell scalar
##  value, and can therefore be colored the same. The method is also referred
##  to as filled contour generation.
##
##  To use this filter you must specify one or more contour values.  You can
##  either use the method SetValue() to specify each contour value, or use
##  GenerateValues() to generate a series of evenly spaced contours.  Each
##  contour value divides (or clips) the data into two pieces, values below
##  the contour value, and values above it. The scalar values of each
##  band correspond to the specified contour value.  Note that if the first and
##  last contour values are not the minimum/maximum contour range, then two
##  extra contour values are added corresponding to the minimum and maximum
##  range values. These extra contour bands can be prevented from being output
##  by turning clipping on.
##
##  @sa
##  vtkClipDataSet vtkClipPolyData vtkClipVolume vtkContourFilter
##
##

## !!!Ignored construct:  # vtkBandedPolyDataContourFilter_h [NewLine] # vtkBandedPolyDataContourFilter_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkContourValues.h  Needed for inline methods [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkBandedPolyDataContourFilterInternals"
const
  VTK_SCALAR_MODE_INDEX* = 0
  VTK_SCALAR_MODE_VALUE* = 1

## !!!Ignored construct:  class VTKFILTERSMODELING_EXPORT vtkBandedPolyDataContourFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBandedPolyDataContourFilter :: IsTypeOf ( type ) ; } static vtkBandedPolyDataContourFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBandedPolyDataContourFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBandedPolyDataContourFilter * NewInstance ( ) const { return vtkBandedPolyDataContourFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBandedPolyDataContourFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBandedPolyDataContourFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with no contours defined.
##  static vtkBandedPolyDataContourFilter * New ( ) ; /@{ *
##  Methods to set / get contour values. A single value at a time can be
##  set with SetValue(). Multiple contour values can be set with
##  GenerateValues(). Note that GenerateValues() generates n values
##  inclusive of the start and end range values.
##  void SetValue ( int i , double value ) ; double GetValue ( int i ) ; double * GetValues ( ) ; void GetValues ( double * contourValues ) ; void SetNumberOfContours ( int number ) ; vtkIdType GetNumberOfContours ( ) ; void GenerateValues ( int numContours , double range [ 2 ] ) ; void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) ; /@} /@{ *
##  Indicate whether to clip outside the range specified by the user.
##  (The range is contour value[0] to contour value[numContours-1].)
##  Clipping means all cells outside of the range specified are not
##  sent to the output.
##  virtual void SetClipping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Clipping  to  << _arg ) ; if ( this -> Clipping != _arg ) { this -> Clipping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Clipping  of  << this -> Clipping ) ; return this -> Clipping ; } ; virtual void ClippingOn ( ) { this -> SetClipping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ClippingOff ( ) { this -> SetClipping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control whether the cell scalars are output as an integer index or
##  a scalar value. If an index, the index refers to the bands produced
##  by the clipping range. If a value, then a scalar value which is a
##  value between clip values is used.
##  virtual void SetScalarMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarMode  to  << _arg ) ; if ( this -> ScalarMode != ( _arg < VTK_SCALAR_MODE_INDEX ? VTK_SCALAR_MODE_INDEX : ( _arg > VTK_SCALAR_MODE_VALUE ? VTK_SCALAR_MODE_VALUE : _arg ) ) ) { this -> ScalarMode = ( _arg < VTK_SCALAR_MODE_INDEX ? VTK_SCALAR_MODE_INDEX : ( _arg > VTK_SCALAR_MODE_VALUE ? VTK_SCALAR_MODE_VALUE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetScalarModeMinValue ( ) { return VTK_SCALAR_MODE_INDEX ; } virtual int GetScalarModeMaxValue ( ) { return VTK_SCALAR_MODE_VALUE ; } ; virtual int GetClippingScalarMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarMode  of  << this -> ScalarMode ) ; return this -> ScalarMode ; } ; void SetScalarModeToIndex ( ) { this -> SetScalarMode ( VTK_SCALAR_MODE_INDEX ) ; } void SetScalarModeToValue ( ) { this -> SetScalarMode ( VTK_SCALAR_MODE_VALUE ) ; } /@} /@{ *
##  Turn on/off a flag to control whether contour edges are generated.
##  Contour edges are the edges between bands. If enabled, they are
##  generated from polygons/triangle strips and placed into the second
##  output (the ContourEdgesOutput).
##  virtual void SetClippingGenerateContourEdges ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateContourEdges  to  << _arg ) ; if ( this -> GenerateContourEdges != _arg ) { this -> GenerateContourEdges = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetClippingScalarModeGenerateContourEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateContourEdges  of  << this -> GenerateContourEdges ) ; return this -> GenerateContourEdges ; } ; virtual void GenerateContourEdgesOn ( ) { this -> SetClippingGenerateContourEdges ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateContourEdgesOff ( ) { this -> SetClippingGenerateContourEdges ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the clip tolerance. Warning: setting this too large will
##  certainly cause numerical issues. Change from the default value
##  of FLT_EPSILON at your own risk. The actual internal clip tolerance
##  is computed by multiplying ClipTolerance by the scalar range.
##  virtual void SetClippingGenerateContourEdgesClipTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ClipTolerance  to  << _arg ) ; if ( this -> ClipTolerance != _arg ) { this -> ClipTolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetClippingScalarModeGenerateContourEdgesClipTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClipTolerance  of  << this -> ClipTolerance ) ; return this -> ClipTolerance ; } ; /@} /@{ *
##  Set/Get the component to use of an input scalars array with more than one
##  component. Default is 0.
##  virtual void SetClippingGenerateContourEdgesClipToleranceComponent ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Component  to  << _arg ) ; if ( this -> Component != _arg ) { this -> Component = _arg ; this -> Modified ( ) ; } } ; virtual int GetClippingScalarModeGenerateContourEdgesClipToleranceComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Component  of  << this -> Component ) ; return this -> Component ; } ; /@} *
##  Get the second output which contains the edges dividing the contour
##  bands. This output is empty unless GenerateContourEdges is enabled.
##  vtkPolyData * GetContourEdgesOutput ( ) ; *
##  Overload GetMTime because we delegate to vtkContourValues so its
##  modified time must be taken into account.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkBandedPolyDataContourFilter ( ) ; ~ vtkBandedPolyDataContourFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int ClipEdge ( int v1 , int v2 , vtkPoints * pts , vtkDataArray * inScalars , vtkDoubleArray * outScalars , vtkPointData * inPD , vtkPointData * outPD , vtkIdType edgePts [ ] ) ; int InsertCell ( vtkCellArray * cells , int npts , const vtkIdType * pts , int cellId , double s , vtkFloatArray * newS ) ; int InsertLine ( vtkCellArray * cells , vtkIdType pt1 , vtkIdType pt2 , int cellId , double s , vtkFloatArray * newS ) ; int ComputeClippedIndex ( double s ) ; int InsertNextScalar ( vtkFloatArray * scalars , int cellId , int idx ) ;  data members vtkContourValues * ContourValues ; vtkTypeBool Clipping ; int ScalarMode ; int Component ; double ClipTolerance ;  specify numerical accuracy during clipping  the second output vtkTypeBool GenerateContourEdges ; vtkBandedPolyDataContourFilterInternals * Internal ; private : vtkBandedPolyDataContourFilter ( const vtkBandedPolyDataContourFilter & ) = delete ; void operator = ( const vtkBandedPolyDataContourFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##

proc SetValue*(i: cint; value: cdouble) {.importcpp: "VTKFILTERSMODELING_EXPORT::SetValue(@)",
                                     header: "vtkBandedPolyDataContourFilter.h".}
## *
##  Get the ith contour value.
##

proc GetValue*(i: cint): cdouble {.importcpp: "VTKFILTERSMODELING_EXPORT::GetValue(@)",
                               header: "vtkBandedPolyDataContourFilter.h".}
## *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##

proc GetValues*(): ptr cdouble {.importcpp: "VTKFILTERSMODELING_EXPORT::GetValues(@)",
                             header: "vtkBandedPolyDataContourFilter.h".}
## *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##

proc GetValues*(contourValues: ptr cdouble) {.
    importcpp: "VTKFILTERSMODELING_EXPORT::GetValues(@)",
    header: "vtkBandedPolyDataContourFilter.h".}
## *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##

proc SetNumberOfContours*(number: cint) {.importcpp: "VTKFILTERSMODELING_EXPORT::SetNumberOfContours(@)", header: "vtkBandedPolyDataContourFilter.h".}
## *
##  Get the number of contours in the list of contour values.
##

proc GetNumberOfContours*(): vtkIdType {.importcpp: "VTKFILTERSMODELING_EXPORT::GetNumberOfContours(@)", header: "vtkBandedPolyDataContourFilter.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; range: array[2, cdouble]) {.
    importcpp: "VTKFILTERSMODELING_EXPORT::GenerateValues(@)",
    header: "vtkBandedPolyDataContourFilter.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "VTKFILTERSMODELING_EXPORT::GenerateValues(@)",
    header: "vtkBandedPolyDataContourFilter.h".}
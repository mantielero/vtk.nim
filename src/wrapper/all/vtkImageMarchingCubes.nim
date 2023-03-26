## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMarchingCubes.h
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
##  @class   vtkImageMarchingCubes
##  @brief   generate isosurface(s) from volume/images
##
##  vtkImageMarchingCubes is a filter that takes as input images (e.g., 3D
##  image region) and generates on output one or more isosurfaces.
##  One or more contour values must be specified to generate the isosurfaces.
##  Alternatively, you can specify a min/max scalar range and the number of
##  contours to generate a series of evenly spaced contour values.
##  This filter can stream, so that the entire volume need not be loaded at
##  once.  Streaming is controlled using the instance variable
##  InputMemoryLimit, which has units KBytes.
##
##  @warning
##  This filter is specialized to volumes. If you are interested in
##  contouring other types of data, use the general vtkContourFilter. If you
##  want to contour an image (i.e., a volume slice), use vtkMarchingSquares.
##  @sa
##  vtkContourFilter vtkSliceCubes vtkMarchingSquares vtkSynchronizedTemplates3D
##

## !!!Ignored construct:  # vtkImageMarchingCubes_h [NewLine] # vtkImageMarchingCubes_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkContourValues.h  Needed for direct access to ContourValues [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkImageMarchingCubes : public vtkPolyDataAlgorithm { public : static vtkImageMarchingCubes * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageMarchingCubes :: IsTypeOf ( type ) ; } static vtkImageMarchingCubes * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageMarchingCubes * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageMarchingCubes * NewInstance ( ) const { return vtkImageMarchingCubes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMarchingCubes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMarchingCubes :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Methods to set contour values
##  void SetValue ( int i , double value ) ; double GetValue ( int i ) ; double * GetValues ( ) ; void GetValues ( double * contourValues ) ; void SetNumberOfContours ( int number ) ; vtkIdType GetNumberOfContours ( ) ; void GenerateValues ( int numContours , double range [ 2 ] ) ; void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) ; /@} *
##  Because we delegate to vtkContourValues & refer to vtkImplicitFunction
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set/Get the computation of scalars.
##  virtual void SetComputeScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeScalars  to  << _arg ) ; if ( this -> ComputeScalars != _arg ) { this -> ComputeScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ; virtual void ComputeScalarsOn ( ) { this -> SetComputeScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeScalarsOff ( ) { this -> SetComputeScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the computation of normals. Normal computation is fairly expensive
##  in both time and storage. If the output data will be processed by filters
##  that modify topology or geometry, it may be wise to turn Normals and Gradients off.
##  virtual void SetComputeScalarsComputeNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeScalarsComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetComputeScalarsComputeNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetComputeScalarsComputeNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the computation of gradients. Gradient computation is fairly expensive
##  in both time and storage. Note that if ComputeNormals is on, gradients will
##  have to be calculated, but will not be stored in the output dataset.
##  If the output data will be processed by filters that modify topology or
##  geometry, it may be wise to turn Normals and Gradients off.
##  virtual void SetComputeScalarsComputeNormalsComputeGradients ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeGradients  to  << _arg ) ; if ( this -> ComputeGradients != _arg ) { this -> ComputeGradients = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeScalarsComputeNormalsComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ; virtual void ComputeGradientsOn ( ) { this -> SetComputeScalarsComputeNormalsComputeGradients ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeGradientsOff ( ) { this -> SetComputeScalarsComputeNormalsComputeGradients ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@}  Should be protected, but the templated functions need these vtkTypeBool ComputeScalars ; vtkTypeBool ComputeNormals ; vtkTypeBool ComputeGradients ; int NeedGradients ; vtkCellArray * Triangles ; vtkFloatArray * Scalars ; vtkPoints * Points ; vtkFloatArray * Normals ; vtkFloatArray * Gradients ; vtkIdType GetLocatorPoint ( int cellX , int cellY , int edge ) ; void AddLocatorPoint ( int cellX , int cellY , int edge , vtkIdType ptId ) ; void IncrementLocatorZ ( ) ; /@{ *
##  The InputMemoryLimit determines the chunk size (the number of slices
##  requested at each iteration).  The units of this limit is KiloBytes.
##  For now, only the Z axis is split.
##  virtual void SetComputeScalarsComputeNormalsComputeGradientsInputMemoryLimit ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InputMemoryLimit  to  << _arg ) ; if ( this -> InputMemoryLimit != _arg ) { this -> InputMemoryLimit = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetComputeScalarsComputeNormalsComputeGradientsInputMemoryLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputMemoryLimit  of  << this -> InputMemoryLimit ) ; return this -> InputMemoryLimit ; } ; /@} protected : vtkImageMarchingCubes ( ) ; ~ vtkImageMarchingCubes ( ) override ; int NumberOfSlicesPerChunk ; vtkIdType InputMemoryLimit ; vtkContourValues * ContourValues ; vtkIdType * LocatorPointIds ; int LocatorDimX ; int LocatorDimY ; int LocatorMinX ; int LocatorMinY ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; void March ( vtkImageData * inData , int chunkMin , int chunkMax , int numContours , double * values ) ; void InitializeLocator ( int min0 , int max0 , int min1 , int max1 ) ; void DeleteLocator ( ) ; vtkIdType * GetLocatorPointer ( int cellX , int cellY , int edge ) ; private : vtkImageMarchingCubes ( const vtkImageMarchingCubes & ) = delete ; void operator = ( const vtkImageMarchingCubes & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##

proc SetValue*(i: cint; value: cdouble) {.importcpp: "VTKFILTERSGENERAL_EXPORT::SetValue(@)",
                                     header: "vtkImageMarchingCubes.h".}
## *
##  Get the ith contour value.
##

proc GetValue*(i: cint): cdouble {.importcpp: "VTKFILTERSGENERAL_EXPORT::GetValue(@)",
                               header: "vtkImageMarchingCubes.h".}
## *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##

proc GetValues*(): ptr cdouble {.importcpp: "VTKFILTERSGENERAL_EXPORT::GetValues(@)",
                             header: "vtkImageMarchingCubes.h".}
## *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##

proc GetValues*(contourValues: ptr cdouble) {.
    importcpp: "VTKFILTERSGENERAL_EXPORT::GetValues(@)",
    header: "vtkImageMarchingCubes.h".}
## *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##

proc SetNumberOfContours*(number: cint) {.importcpp: "VTKFILTERSGENERAL_EXPORT::SetNumberOfContours(@)",
                                       header: "vtkImageMarchingCubes.h".}
## *
##  Get the number of contours in the list of contour values.
##

proc GetNumberOfContours*(): vtkIdType {.importcpp: "VTKFILTERSGENERAL_EXPORT::GetNumberOfContours(@)",
                                      header: "vtkImageMarchingCubes.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; range: array[2, cdouble]) {.
    importcpp: "VTKFILTERSGENERAL_EXPORT::GenerateValues(@)",
    header: "vtkImageMarchingCubes.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "VTKFILTERSGENERAL_EXPORT::GenerateValues(@)",
    header: "vtkImageMarchingCubes.h".}
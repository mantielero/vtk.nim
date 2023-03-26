## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageDataGeometryFilter.h
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
##  @class   vtkImageDataGeometryFilter
##  @brief   extract geometry for structured points
##
##  vtkImageDataGeometryFilter is a filter that extracts geometry from a
##  structured points dataset. By specifying appropriate i-j-k indices (via the
##  "Extent" instance variable), it is possible to extract a point, a line, a
##  plane (i.e., image), or a "volume" from dataset. (Since the output is
##  of type polydata, the volume is actually a (n x m x o) region of points.)
##
##  The extent specification is zero-offset. That is, the first k-plane in
##  a 50x50x50 volume is given by (0,49, 0,49, 0,0).
##  @warning
##  If you don't know the dimensions of the input dataset, you can use a large
##  number to specify extent (the number will be clamped appropriately). For
##  example, if the dataset dimensions are 50x50x50, and you want a the fifth
##  k-plane, you can use the extents (0,100, 0,100, 4,4). The 100 will
##  automatically be clamped to 49.
##
##  @sa
##  vtkGeometryFilter vtkStructuredGridSource
##

## !!!Ignored construct:  # vtkImageDataGeometryFilter_h [NewLine] # vtkImageDataGeometryFilter_h [NewLine] # vtkFiltersGeometryModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSGEOMETRY_EXPORT vtkImageDataGeometryFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageDataGeometryFilter :: IsTypeOf ( type ) ; } static vtkImageDataGeometryFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageDataGeometryFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageDataGeometryFilter * NewInstance ( ) const { return vtkImageDataGeometryFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageDataGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageDataGeometryFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with initial extent of all the data
##  static vtkImageDataGeometryFilter * New ( ) ; /@{ *
##  Set / get the extent (imin,imax, jmin,jmax, kmin,kmax) indices.
##  void SetExtent ( int extent [ 6 ] ) ; void SetExtent ( int iMin , int iMax , int jMin , int jMax , int kMin , int kMax ) ; int * GetExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> Extent ; } /@} /@{ *
##  Set ThresholdCells to true if you wish to skip any voxel/pixels which have scalar
##  values less than the specified threshold.
##  Currently this functionality is only implemented for 2D imagedata
##  virtual void SetThresholdCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ThresholdCells  to  << _arg ) ; if ( this -> ThresholdCells != _arg ) { this -> ThresholdCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetThresholdCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThresholdCells  of  << this -> ThresholdCells ) ; return this -> ThresholdCells ; } ; virtual void ThresholdCellsOn ( ) { this -> SetThresholdCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ThresholdCellsOff ( ) { this -> SetThresholdCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set ThresholdValue to the scalar value by which to threshold cells when extracting geometry
##  when ThresholdCells is true. Cells with scalar values greater than the threshold will be
##  output.
##  virtual void SetThresholdCellsThresholdValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ThresholdValue  to  << _arg ) ; if ( this -> ThresholdValue != _arg ) { this -> ThresholdValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetThresholdCellsThresholdValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThresholdValue  of  << this -> ThresholdValue ) ; return this -> ThresholdValue ; } ; virtual void ThresholdValueOn ( ) { this -> SetThresholdCellsThresholdValue ( static_cast < double > ( 1 ) ) ; } virtual void ThresholdValueOff ( ) { this -> SetThresholdCellsThresholdValue ( static_cast < double > ( 0 ) ) ; } ; /@} /@{ *
##  Set OutputTriangles to true if you wish to generate triangles instead of quads
##  when extracting cells from 2D imagedata
##  Currently this functionality is only implemented for 2D imagedata
##  virtual void SetThresholdCellsThresholdValueOutputTriangles ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputTriangles  to  << _arg ) ; if ( this -> OutputTriangles != _arg ) { this -> OutputTriangles = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetThresholdCellsThresholdValueOutputTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputTriangles  of  << this -> OutputTriangles ) ; return this -> OutputTriangles ; } ; virtual void OutputTrianglesOn ( ) { this -> SetThresholdCellsThresholdValueOutputTriangles ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OutputTrianglesOff ( ) { this -> SetThresholdCellsThresholdValueOutputTriangles ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkImageDataGeometryFilter ( ) ; ~ vtkImageDataGeometryFilter ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int Extent [ 6 ] ; vtkTypeBool ThresholdCells ; double ThresholdValue ; vtkTypeBool OutputTriangles ; private : vtkImageDataGeometryFilter ( const vtkImageDataGeometryFilter & ) = delete ; void operator = ( const vtkImageDataGeometryFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

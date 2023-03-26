## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDepthImageToPointCloud.h
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
##  @class   vtkDepthImageToPointCloud
##  @brief   convert a depth image into a point cloud
##
##
##  vtkDepthImageToPointCloud is a filter that acquires its input
##  from a depth image and converts it to point cloud represented as a
##  vtkPolyData. This can then be used in a visualization pipeline.
##
##  The filter takes two input images, one of which is optional. The first
##  image is a (required) depth image containing z-buffer values. The second
##  image is an (optional) scalar image. The information in the z-buffer
##  image, plus a specified camera, is used to generate x-y-z coordinates of
##  the output point cloud (i.e., the points in a vtkPolyData). The second
##  scalar image is (optionally) output as scalars to the output point
##  cloud. Note that the depth image must be a single component image, with
##  values ranging between the near and far clipping range [-1,1].
##
##  Note that if only a single input is provided, then the input is
##  interpreted in one of two ways. First, if the "ZBuffer" point data is
##  provided, then the input image is assumed to be color scalars with the
##  depth data provided in the "ZBuffer" data array. (This is consistent with
##  the vtkRendererSource filter with DepthValues enabled.) Otherwise, the
##  input image is assumed to be a depth image.
##
##  It is (optionally) possible to cull points located on the near and far
##  clipping planes. This may better simulate the generation of a scanned
##  object point cloud.
##
##  @warning
##  For the camera to transform the image depths into a point cloud, this
##  filter makes assumptions about the origin of the depth image (and
##  associated color scalar image). This class performs point by point
##  transformation. The view matrix is used to transform each pixel. IMPORTANT
##  NOTE: The transformation occurs by normalizing the image pixels into the
##  (-1,1) view space (depth values are passed through). The process follows the
##  vtkCoordinate class which is the standard for VTK rendering
##  transformations. Subtle differences in whether the lower left pixel origin
##  are at the center of the pixel versus the lower-left corner of the pixel
##  will make slight differences in how pixels are transformed. (Similarly for
##  the upper right pixel as well). This half pixel difference can cause
##  transformation issues. (The code is commented appropriately.)
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkRendererSource vtkWindowToImageFilter vtkCamera vtkPolyData
##  vtkCoordinate
##

## !!!Ignored construct:  # vtkDepthImageToPointCloud_h [NewLine] # vtkDepthImageToPointCloud_h [NewLine] # vtkPolyDataAlgorithm.h [NewLine] # vtkRenderingImageModule.h  For export macro [NewLine] class vtkCamera ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKRENDERINGIMAGE_EXPORT vtkDepthImageToPointCloud : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard instantiation, type and print methods.
##  static vtkDepthImageToPointCloud * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDepthImageToPointCloud :: IsTypeOf ( type ) ; } static vtkDepthImageToPointCloud * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDepthImageToPointCloud * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDepthImageToPointCloud * NewInstance ( ) const { return vtkDepthImageToPointCloud :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDepthImageToPointCloud :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDepthImageToPointCloud :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Return the MTime also considering the camera.
##  vtkMTimeType GetMTime ( ) override ; *
##  Indicates what camera was used to generate the depth image. The camera
##  parameters define a transformation which is used to perform coordinate
##  conversion into the 3D x-y-z space of the point cloud.
##  void SetCamera ( vtkCamera * ) ; /@{ *
##  Returns the camera being used to generate the point cloud from the
##  depth image.
##  virtual vtkCamera * GetnameCamera ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Camera  address  << static_cast < vtkCamera * > ( this -> Camera ) ) ; return this -> Camera ; } ; /@} /@{ *
##  Indicate whether to cull points that are located on the near clipping
##  plane. These typically are points that are part of the clipped foreground. By
##  default this is disabled.
##  virtual void SetCullNearPoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CullNearPoints  to  << _arg ) ; if ( this -> CullNearPoints != _arg ) { this -> CullNearPoints = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCullNearPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CullNearPoints  of  << this -> CullNearPoints ) ; return this -> CullNearPoints ; } ; virtual void CullNearPointsOn ( ) { this -> SetCullNearPoints ( static_cast < bool > ( 1 ) ) ; } virtual void CullNearPointsOff ( ) { this -> SetCullNearPoints ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to cull points that are located on the far clipping
##  plane. These typically are points that are part of the background. By
##  default this is enabled.
##  virtual void SetCullNearPointsCullFarPoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CullFarPoints  to  << _arg ) ; if ( this -> CullFarPoints != _arg ) { this -> CullFarPoints = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCullNearPointsCullFarPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CullFarPoints  of  << this -> CullFarPoints ) ; return this -> CullFarPoints ; } ; virtual void CullFarPointsOn ( ) { this -> SetCullNearPointsCullFarPoints ( static_cast < bool > ( 1 ) ) ; } virtual void CullFarPointsOff ( ) { this -> SetCullNearPointsCullFarPoints ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to output color scalar values along with the
##  point cloud (assuming that the scalar values are available on
##  input). By default this is enabled.
##  virtual void SetCullNearPointsCullFarPointsProduceColorScalars ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProduceColorScalars  to  << _arg ) ; if ( this -> ProduceColorScalars != _arg ) { this -> ProduceColorScalars = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCullNearPointsCullFarPointsProduceColorScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProduceColorScalars  of  << this -> ProduceColorScalars ) ; return this -> ProduceColorScalars ; } ; virtual void ProduceColorScalarsOn ( ) { this -> SetCullNearPointsCullFarPointsProduceColorScalars ( static_cast < bool > ( 1 ) ) ; } virtual void ProduceColorScalarsOff ( ) { this -> SetCullNearPointsCullFarPointsProduceColorScalars ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to output a vertex cell array (i.e., Verts) in the
##  output point cloud. Some filters require this vertex cells to be
##  defined in order to execute properly. For example some mappers will
##  only render points if the vertex cells are defined.
##  virtual void SetCullNearPointsCullFarPointsProduceColorScalarsProduceVertexCellArray ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProduceVertexCellArray  to  << _arg ) ; if ( this -> ProduceVertexCellArray != _arg ) { this -> ProduceVertexCellArray = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCullNearPointsCullFarPointsProduceColorScalarsProduceVertexCellArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProduceVertexCellArray  of  << this -> ProduceVertexCellArray ) ; return this -> ProduceVertexCellArray ; } ; virtual void ProduceVertexCellArrayOn ( ) { this -> SetCullNearPointsCullFarPointsProduceColorScalarsProduceVertexCellArray ( static_cast < bool > ( 1 ) ) ; } virtual void ProduceVertexCellArrayOff ( ) { this -> SetCullNearPointsCullFarPointsProduceColorScalarsProduceVertexCellArray ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the desired precision for the output points.
##  See vtkAlgorithm::DesiredOutputPrecision for the available choices.
##  The default is double precision.
##  virtual void SetCullNearPointsCullFarPointsProduceColorScalarsProduceVertexCellArrayOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetCullNearPointsCullFarPointsProduceColorScalarsProduceVertexCellArrayOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkDepthImageToPointCloud ( ) ; ~ vtkDepthImageToPointCloud ( ) override ; vtkCamera * Camera ; bool CullNearPoints ; bool CullFarPoints ; bool ProduceColorScalars ; bool ProduceVertexCellArray ; int OutputPointsPrecision ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outInfo ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; private : vtkDepthImageToPointCloud ( const vtkDepthImageToPointCloud & ) = delete ; void operator = ( const vtkDepthImageToPointCloud & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

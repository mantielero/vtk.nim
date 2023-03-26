## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageDataLIC2D.h
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
##  @class   vtkImageDataLIC2D
##
##
##   GPU implementation of a Line Integral Convolution, a technique for
##   imaging vector fields.
##
##   The input on port 0 is an vtkImageData with extents of a 2D image. It needs
##   a vector field on point data. This filter only works on point vectors. One
##   can use a vtkCellDataToPointData filter to convert cell vectors to point
##   vectors.
##
##   Port 1 is a special port for customized noise input. It is an optional port.
##   If noise input is not specified, then the filter using vtkImageNoiseSource to
##   generate a 128x128 noise texture.
##
##  @sa
##   vtkSurfaceLICPainter vtkLineIntegralConvolution2D
##

## !!!Ignored construct:  # vtkImageDataLIC2D_h [NewLine] # vtkImageDataLIC2D_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkRenderingLICOpenGL2Module.h  For export macro # vtkWeakPointer.h  needed for vtkWeakPointer. [NewLine] class vtkRenderWindow ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkImageNoiseSource"
discard "forward decl of vtkImageCast"
## !!!Ignored construct:  class VTKRENDERINGLICOPENGL2_EXPORT vtkImageDataLIC2D : public vtkImageAlgorithm { public : static vtkImageDataLIC2D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageDataLIC2D :: IsTypeOf ( type ) ; } static vtkImageDataLIC2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageDataLIC2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageDataLIC2D * NewInstance ( ) const { return vtkImageDataLIC2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageDataLIC2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageDataLIC2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the context. Context must be a vtkOpenGLRenderWindow.
##  This does not increase the reference count of the
##  context to avoid reference loops.
##  SetContext() may raise an error if the OpenGL context does not support the
##  required OpenGL extensions. Return 0 upon failure and 1 upon success.
##  int SetContext ( vtkRenderWindow * context ) ; vtkRenderWindow * GetContext ( ) ; /@} /@{ *
##  Number of steps. Initial value is 20.
##  class invariant: Steps>0.
##  In term of visual quality, the greater the better.
##  virtual void SetSteps ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Steps  to  << _arg ) ; if ( this -> Steps != _arg ) { this -> Steps = _arg ; this -> Modified ( ) ; } } ; virtual int GetSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Steps  of  << this -> Steps ) ; return this -> Steps ; } ; /@} /@{ *
##  Step size.
##  Specify the step size as a unit of the cell length of the input vector
##  field. Cell length is the length of the diagonal of a cell.
##  Initial value is 1.0.
##  class invariant: StepSize>0.0.
##  In term of visual quality, the smaller the better.
##  The type for the interface is double as VTK interface is double
##  but GPU only supports float. This value will be converted to
##  float in the execution of the algorithm.
##  virtual void SetStepsStepSize ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StepSize  to  << _arg ) ; if ( this -> StepSize != _arg ) { this -> StepSize = _arg ; this -> Modified ( ) ; } } ; virtual double GetStepsStepSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StepSize  of  << this -> StepSize ) ; return this -> StepSize ; } ; /@} /@{ *
##  The magnification factor. Default is 1
##  virtual void SetStepsStepSizeMagnification ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Magnification  to  << _arg ) ; if ( this -> Magnification != _arg ) { this -> Magnification = _arg ; this -> Modified ( ) ; } } ; virtual int GetStepsStepSizeMagnification ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Magnification  of  << this -> Magnification ) ; return this -> Magnification ; } ; /@} /@{ *
##  Check if the required OpenGL extensions / GPU are supported.
##  virtual int GetStepsStepSizeMagnificationOpenGLExtensionsSupported ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OpenGLExtensionsSupported  of  << this -> OpenGLExtensionsSupported ) ; return this -> OpenGLExtensionsSupported ; } ; /@} void TranslateInputExtent ( const int * inExt , const int * inWholeExtent , int * outExt ) ; protected : vtkImageDataLIC2D ( ) ; ~ vtkImageDataLIC2D ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Fill the input port information objects for this algorithm.  This
##  is invoked by the first call to GetInputPortInformation for each
##  port so subclasses can specify what they can handle.
##  Redefined from the superclass.
##  int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestUpdateExtent ( vtkInformation * vtkNotUsed ( request ) , vtkInformationVector * * inputVector , vtkInformationVector * vtkNotUsed ( outputVector ) ) override ; *
##  This is called by the superclass.
##  This is the method you should override.
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; vtkWeakPointer < vtkOpenGLRenderWindow > Context ; bool OwnWindow ; int OpenGLExtensionsSupported ; vtkImageNoiseSource * NoiseSource ; vtkImageCast * ImageCast ; int Steps ; double StepSize ; int Magnification ; private : vtkImageDataLIC2D ( const vtkImageDataLIC2D & ) = delete ; void operator = ( const vtkImageDataLIC2D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

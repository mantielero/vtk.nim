## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClearRGBPass.h
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
##  @class   vtkClearRGBPass
##  @brief   Paint in the color buffer.
##
##  Clear the color buffer to the specified color.
##
##  @sa
##  vtkValuePasses
##

## !!!Ignored construct:  # vtkClearRGBPass_h [NewLine] # vtkClearRGBPass_h [NewLine] # vtkRenderPass.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro [NewLine] class vtkOpenGLRenderWindow ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkClearRGBPass : public vtkRenderPass { public : static vtkClearRGBPass * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkRenderPass Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkRenderPass :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkClearRGBPass :: IsTypeOf ( type ) ; } static vtkClearRGBPass * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkClearRGBPass * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkClearRGBPass * NewInstance ( ) const { return vtkClearRGBPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClearRGBPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClearRGBPass :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Perform rendering according to a render state s.
##  void Render ( const vtkRenderState * s ) override ; /@{ *
##  Set/Get the background color of the rendering screen using an rgb color
##  specification.
##  virtual void SetBackground ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Background  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Background [ 0 ] != _arg1 ) || ( this -> Background [ 1 ] != _arg2 ) || ( this -> Background [ 2 ] != _arg3 ) ) { this -> Background [ 0 ] = _arg1 ; this -> Background [ 1 ] = _arg2 ; this -> Background [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetBackground ( const double _arg [ 3 ] ) { this -> SetBackground ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetBackground ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Background  pointer  << this -> Background ) ; return this -> Background ; } VTK_WRAPEXCLUDE virtual void GetBackground ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Background [ 0 ] ; _arg2 = this -> Background [ 1 ] ; _arg3 = this -> Background [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Background  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackground ( double _arg [ 3 ] ) { this -> GetBackground ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} protected : *
##  Default constructor.
##  vtkClearRGBPass ( ) ; *
##  Destructor.
##  ~ vtkClearRGBPass ( ) override ; double Background [ 3 ] ; private : vtkClearRGBPass ( const vtkClearRGBPass & ) = delete ; void operator = ( const vtkClearRGBPass & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

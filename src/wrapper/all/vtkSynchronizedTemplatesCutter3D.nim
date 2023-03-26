## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSynchronizedTemplatesCutter3D.h
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
##  @class   vtkSynchronizedTemplatesCutter3D
##  @brief   generate cut surface from structured points
##
##
##  vtkSynchronizedTemplatesCutter3D is an implementation of the synchronized
##  template algorithm. Note that vtkCutFilter will automatically
##  use this class when appropriate.
##
##  @sa
##  vtkContourFilter vtkSynchronizedTemplates3D
##

## !!!Ignored construct:  # vtkSynchronizedTemplatesCutter3D_h [NewLine] # vtkSynchronizedTemplatesCutter3D_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkSynchronizedTemplates3D.h [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkSynchronizedTemplatesCutter3D : public vtkSynchronizedTemplates3D { public : static vtkSynchronizedTemplatesCutter3D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSynchronizedTemplates3D Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSynchronizedTemplates3D :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSynchronizedTemplatesCutter3D :: IsTypeOf ( type ) ; } static vtkSynchronizedTemplatesCutter3D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSynchronizedTemplatesCutter3D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSynchronizedTemplatesCutter3D * NewInstance ( ) const { return vtkSynchronizedTemplatesCutter3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSynchronizedTemplates3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSynchronizedTemplatesCutter3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSynchronizedTemplatesCutter3D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Needed by templated functions.
##  void ThreadedExecute ( vtkImageData * data , vtkInformation * outInfo , int ) ; /@{ *
##  Specify the implicit function to perform the cutting.
##  virtual void SetCutFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameCutFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CutFunction  address  << static_cast < vtkImplicitFunction * > ( this -> CutFunction ) ) ; return this -> CutFunction ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ) { this -> OutputPointsPrecision = ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOutputPointsPrecisionMinValue ( ) { return SINGLE_PRECISION ; } virtual int GetOutputPointsPrecisionMaxValue ( ) { return DEFAULT_PRECISION ; } ; virtual int GetOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkSynchronizedTemplatesCutter3D ( ) ; ~ vtkSynchronizedTemplatesCutter3D ( ) override ; vtkImplicitFunction * CutFunction ; int OutputPointsPrecision ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkSynchronizedTemplatesCutter3D ( const vtkSynchronizedTemplatesCutter3D & ) = delete ; void operator = ( const vtkSynchronizedTemplatesCutter3D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

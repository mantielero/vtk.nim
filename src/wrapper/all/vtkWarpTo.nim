## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWarpTo.h
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
##  @class   vtkWarpTo
##  @brief   deform geometry by warping towards a point
##
##  vtkWarpTo is a filter that modifies point coordinates by moving the
##  points towards a user specified position.
##

## !!!Ignored construct:  # vtkWarpTo_h [NewLine] # vtkWarpTo_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkWarpTo : public vtkPointSetAlgorithm { public : static vtkWarpTo * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkWarpTo :: IsTypeOf ( type ) ; } static vtkWarpTo * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkWarpTo * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkWarpTo * NewInstance ( ) const { return vtkWarpTo :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWarpTo :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWarpTo :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the value to scale displacement.
##  virtual void SetScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != _arg ) { this -> ScaleFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  Set/Get the position to warp towards.
##  virtual double * GetPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Position [ i ] ; } } ; virtual void SetPosition ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Position  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Position [ 0 ] != _arg1 ) || ( this -> Position [ 1 ] != _arg2 ) || ( this -> Position [ 2 ] != _arg3 ) ) { this -> Position [ 0 ] = _arg1 ; this -> Position [ 1 ] = _arg2 ; this -> Position [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPosition ( const double _arg [ 3 ] ) { this -> SetPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get the Absolute ivar. Turning Absolute on causes scale factor
##  of the new position to be one unit away from Position.
##  virtual void SetScaleFactorAbsolute ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Absolute  to  << _arg ) ; if ( this -> Absolute != _arg ) { this -> Absolute = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScaleFactorAbsolute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Absolute  of  << this -> Absolute ) ; return this -> Absolute ; } ; virtual void AbsoluteOn ( ) { this -> SetAbsolute ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AbsoluteOff ( ) { this -> SetAbsolute ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} int FillInputPortInformation ( int port , vtkInformation * info ) override ; protected : vtkWarpTo ( ) ; ~ vtkWarpTo ( ) override = default ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double ScaleFactor ; double Position [ 3 ] ; vtkTypeBool Absolute ; private : vtkWarpTo ( const vtkWarpTo & ) = delete ; void operator = ( const vtkWarpTo & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

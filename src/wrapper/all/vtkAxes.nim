## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAxes.h
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
##  @class   vtkAxes
##  @brief   create an x-y-z axes
##
##  vtkAxes creates three lines that form an x-y-z axes. The origin of the
##  axes is user specified (0,0,0 is default), and the size is specified with
##  a scale factor. Three scalar values are generated for the three lines and
##  can be used (via color map) to indicate a particular coordinate axis.
##

## !!!Ignored construct:  # vtkAxes_h [NewLine] # vtkAxes_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkAxes : public vtkPolyDataAlgorithm { public : static vtkAxes * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAxes :: IsTypeOf ( type ) ; } static vtkAxes * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAxes * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAxes * NewInstance ( ) const { return vtkAxes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAxes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAxes :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the origin of the axes.
##  virtual void SetOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Origin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Origin [ 0 ] != _arg1 ) || ( this -> Origin [ 1 ] != _arg2 ) || ( this -> Origin [ 2 ] != _arg3 ) ) { this -> Origin [ 0 ] = _arg1 ; this -> Origin [ 1 ] = _arg2 ; this -> Origin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOrigin ( const double _arg [ 3 ] ) { this -> SetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Origin [ i ] ; } } ; /@} /@{ *
##  Set the scale factor of the axes. Used to control size.
##  virtual void SetScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != _arg ) { this -> ScaleFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  If Symmetric is on, the axis continue to negative values.
##  virtual void SetScaleFactorSymmetric ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Symmetric  to  << _arg ) ; if ( this -> Symmetric != _arg ) { this -> Symmetric = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScaleFactorSymmetric ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Symmetric  of  << this -> Symmetric ) ; return this -> Symmetric ; } ; virtual void SymmetricOn ( ) { this -> SetSymmetric ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SymmetricOff ( ) { this -> SetSymmetric ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Option for computing normals.  By default they are computed.
##  virtual void SetScaleFactorSymmetricComputeNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScaleFactorSymmetricComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetSymmetricComputeNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetSymmetricComputeNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkAxes ( ) ; ~ vtkAxes ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  This source does not know how to generate pieces yet. int ComputeDivisionExtents ( vtkDataObject * output , int idx , int numDivisions ) ; double Origin [ 3 ] ; double ScaleFactor ; vtkTypeBool Symmetric ; vtkTypeBool ComputeNormals ; private : vtkAxes ( const vtkAxes & ) = delete ; void operator = ( const vtkAxes & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

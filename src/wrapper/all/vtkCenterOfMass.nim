## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCenterOfMass.h
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
##  @class   vtkCenterOfMass
##  @brief   Find the center of mass of a set of points.
##
##  vtkCenterOfMass finds the "center of mass" of a vtkPointSet (vtkPolyData
##  or vtkUnstructuredGrid). Optionally, the user can specify to use the scalars
##  as weights in the computation. If this option, UseScalarsAsWeights, is off,
##  each point contributes equally in the calculation.
##
##  You must ensure Update() has been called before GetCenter will produce a valid
##  value.
##

## !!!Ignored construct:  # vtkCenterOfMass_h [NewLine] # vtkCenterOfMass_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkCenterOfMass : public vtkPointSetAlgorithm { public : static vtkCenterOfMass * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCenterOfMass :: IsTypeOf ( type ) ; } static vtkCenterOfMass * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCenterOfMass * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCenterOfMass * NewInstance ( ) const { return vtkCenterOfMass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCenterOfMass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCenterOfMass :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output of the center of mass computation.
##  virtual void SetCenter ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Center  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Center [ 0 ] != _arg1 ) || ( this -> Center [ 1 ] != _arg2 ) || ( this -> Center [ 2 ] != _arg3 ) ) { this -> Center [ 0 ] = _arg1 ; this -> Center [ 1 ] = _arg2 ; this -> Center [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetCenter ( const double _arg [ 3 ] ) { this -> SetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Center [ 0 ] ; _arg2 = this -> Center [ 1 ] ; _arg3 = this -> Center [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Center  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double _arg [ 3 ] ) { this -> GetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set a flag to determine if the points are weighted.
##  virtual void SetUseScalarsAsWeights ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseScalarsAsWeights  to  << _arg ) ; if ( this -> UseScalarsAsWeights != _arg ) { this -> UseScalarsAsWeights = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseScalarsAsWeights ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseScalarsAsWeights  of  << this -> UseScalarsAsWeights ) ; return this -> UseScalarsAsWeights ; } ; /@} *
##  This function is called by RequestData. It exists so that
##  other classes may use this computation without constructing
##  a vtkCenterOfMass object.  The scalars can be set to nullptr
##  if all points are to be weighted equally.  If scalars are
##  used, it is the caller's responsibility to ensure that the
##  number of scalars matches the number of points, and that
##  the sum of the scalars is a positive value.
##  static void ComputeCenterOfMass ( vtkPoints * input , vtkDataArray * scalars , double center [ 3 ] ) ; protected : vtkCenterOfMass ( ) ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkCenterOfMass ( const vtkCenterOfMass & ) = delete ; void operator = ( const vtkCenterOfMass & ) = delete ; bool UseScalarsAsWeights ; double Center [ 3 ] ; } ;
## Error: token expected: ; but got: [identifier]!!!

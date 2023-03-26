## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRecursiveDividingCubes.h
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
##  @class   vtkRecursiveDividingCubes
##  @brief   create points laying on isosurface (using recursive approach)
##
##  vtkRecursiveDividingCubes is a filter that generates points laying on a
##  surface of constant scalar value (i.e., an isosurface). Dense point
##  clouds (i.e., at screen resolution) will appear as a surface. Less dense
##  clouds can be used as a source to generate streamlines or to generate
##  "transparent" surfaces.
##
##  This implementation differs from vtkDividingCubes in that it uses a
##  recursive procedure. In many cases this can result in generating
##  more points than the procedural implementation of vtkDividingCubes. This is
##  because the recursive procedure divides voxels by multiples of powers of
##  two. This can over-constrain subdivision. One of the advantages of the
##  recursive technique is that the recursion is terminated earlier, which in
##  some cases can be more efficient.
##
##  @sa
##  vtkDividingCubes vtkContourFilter vtkMarchingCubes
##

## !!!Ignored construct:  # vtkRecursiveDividingCubes_h [NewLine] # vtkRecursiveDividingCubes_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkVoxel ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkRecursiveDividingCubes : public vtkPolyDataAlgorithm { public : static vtkRecursiveDividingCubes * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRecursiveDividingCubes :: IsTypeOf ( type ) ; } static vtkRecursiveDividingCubes * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRecursiveDividingCubes * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRecursiveDividingCubes * NewInstance ( ) const { return vtkRecursiveDividingCubes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRecursiveDividingCubes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRecursiveDividingCubes :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set isosurface value.
##  virtual void SetValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Value  to  << _arg ) ; if ( this -> Value != _arg ) { this -> Value = _arg ; this -> Modified ( ) ; } } ; virtual double GetValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Value  of  << this -> Value ) ; return this -> Value ; } ; /@} /@{ *
##  Specify sub-voxel size at which to generate point.
##  virtual void SetDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Distance  to  << _arg ) ; if ( this -> Distance != ( _arg < 1.0e-06 ? 1.0e-06 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Distance = ( _arg < 1.0e-06 ? 1.0e-06 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetDistanceMinValue ( ) { return 1.0e-06 ; } virtual double GetDistanceMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetValueDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Distance  of  << this -> Distance ) ; return this -> Distance ; } ; /@} /@{ *
##  Every "Increment" point is added to the list of points. This parameter, if
##  set to a large value, can be used to limit the number of points while
##  retaining good accuracy.
##  virtual void SetDistanceIncrement ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Increment  to  << _arg ) ; if ( this -> Increment != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> Increment = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDistanceMinValueIncrementMinValue ( ) { return 1 ; } virtual int GetDistanceMaxValueIncrementMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetValueDistanceIncrement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Increment  of  << this -> Increment ) ; return this -> Increment ; } ; /@} protected : vtkRecursiveDividingCubes ( ) ; ~ vtkRecursiveDividingCubes ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; void SubDivide ( double origin [ 3 ] , double h [ 3 ] , double values [ 8 ] ) ; double Value ; double Distance ; int Increment ;  working variable int Count ;  to replace a static vtkVoxel * Voxel ; private : vtkRecursiveDividingCubes ( const vtkRecursiveDividingCubes & ) = delete ; void operator = ( const vtkRecursiveDividingCubes & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

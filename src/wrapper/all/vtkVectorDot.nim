## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVectorDot.h
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
##  @class   vtkVectorDot
##  @brief   generate scalars from dot product of vectors and normals (e.g., show displacement plot)
##
##  vtkVectorDot is a filter to generate point scalar values from a dataset.
##  The scalar value at a point is created by computing the dot product
##  between the normal and vector at each point. Combined with the appropriate
##  color map, this can show nodal lines/mode shapes of vibration, or a
##  displacement plot.
##
##  Note that by default the resulting scalars are mapped into a specified
##  range. This requires an extra pass in the algorithm. This mapping pass can
##  be disabled (set MapScalars to off).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##

## !!!Ignored construct:  # vtkVectorDot_h [NewLine] # vtkVectorDot_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class VTKFILTERSCORE_EXPORT vtkVectorDot : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVectorDot :: IsTypeOf ( type ) ; } static vtkVectorDot * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVectorDot * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVectorDot * NewInstance ( ) const { return vtkVectorDot :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVectorDot :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVectorDot :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with scalar range (-1,1).
##  static vtkVectorDot * New ( ) ; /@{ *
##  Enable/disable the mapping of scalars into a specified range. This will
##  significantly improve the performance of the algorithm but the resulting
##  scalar values will strictly be a function of the vector and normal
##  data. By default, MapScalars is enabled, and the output scalar
##  values will fall into the range ScalarRange.
##  virtual void SetMapScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MapScalars  to  << _arg ) ; if ( this -> MapScalars != _arg ) { this -> MapScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMapScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MapScalars  of  << this -> MapScalars ) ; return this -> MapScalars ; } ; virtual void MapScalarsOn ( ) { this -> SetMapScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MapScalarsOff ( ) { this -> SetMapScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the range into which to map the scalars. This mapping only
##  occurs if MapScalars is enabled.
##  virtual void SetScalarRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ScalarRange [ 0 ] != _arg1 ) || ( this -> ScalarRange [ 1 ] != _arg2 ) ) { this -> ScalarRange [ 0 ] = _arg1 ; this -> ScalarRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetScalarRange ( const double _arg [ 2 ] ) { this -> SetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ScalarRange [ i ] ; } } ; /@} /@{ *
##  Return the actual range of the generated scalars (prior to mapping).
##  Note that the data is valid only after the filter executes.
##  virtual double * GetScalarRangeActualRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ActualRange  pointer  << this -> ActualRange ) ; return this -> ActualRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRangeActualRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ActualRange [ i ] ; } } ; /@} protected : vtkVectorDot ( ) ; ~ vtkVectorDot ( ) override = default ; vtkTypeBool MapScalars ; double ScalarRange [ 2 ] ; double ActualRange [ 2 ] ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkVectorDot ( const vtkVectorDot & ) = delete ; void operator = ( const vtkVectorDot & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

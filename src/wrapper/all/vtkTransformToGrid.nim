## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransformToGrid.h
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
##  @class   vtkTransformToGrid
##  @brief   create a grid for a vtkGridTransform
##
##  vtkTransformToGrid takes any transform as input and produces a grid
##  for use by a vtkGridTransform.  This can be used, for example, to
##  invert a grid transform, concatenate two grid transforms, or to
##  convert a thin plate spline transform into a grid transform.
##  @sa
##  vtkGridTransform vtkThinPlateSplineTransform vtkAbstractTransform
##

## !!!Ignored construct:  # vtkTransformToGrid_h [NewLine] # vtkTransformToGrid_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkImageData.h  makes things a bit easier [NewLine] class vtkAbstractTransform ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkTransformToGrid : public vtkAlgorithm { public : static vtkTransformToGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTransformToGrid :: IsTypeOf ( type ) ; } static vtkTransformToGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTransformToGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTransformToGrid * NewInstance ( ) const { return vtkTransformToGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransformToGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransformToGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the transform which will be converted into a grid.
##  virtual void SetInput ( vtkAbstractTransform * ) ; virtual vtkAbstractTransform * GetnameInput ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Input  address  << static_cast < vtkAbstractTransform * > ( this -> Input ) ) ; return this -> Input ; } ; /@} /@{ *
##  Get/Set the extent of the grid.
##  virtual void SetGridExtent ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << GridExtent  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> GridExtent [ 0 ] != _arg1 ) || ( this -> GridExtent [ 1 ] != _arg2 ) || ( this -> GridExtent [ 2 ] != _arg3 ) || ( this -> GridExtent [ 3 ] != _arg4 ) || ( this -> GridExtent [ 4 ] != _arg5 ) || ( this -> GridExtent [ 5 ] != _arg6 ) ) { this -> GridExtent [ 0 ] = _arg1 ; this -> GridExtent [ 1 ] = _arg2 ; this -> GridExtent [ 2 ] = _arg3 ; this -> GridExtent [ 3 ] = _arg4 ; this -> GridExtent [ 4 ] = _arg5 ; this -> GridExtent [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetGridExtent ( const int _arg [ 6 ] ) { this -> SetGridExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetGridExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GridExtent  pointer  << this -> GridExtent ) ; return this -> GridExtent ; } VTK_WRAPEXCLUDE virtual void GetGridExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> GridExtent [ 0 ] ; _arg2 = this -> GridExtent [ 1 ] ; _arg3 = this -> GridExtent [ 2 ] ; _arg4 = this -> GridExtent [ 3 ] ; _arg5 = this -> GridExtent [ 4 ] ; _arg6 = this -> GridExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << GridExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetGridExtent ( int _arg [ 6 ] ) { this -> GetGridExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Get/Set the origin of the grid.
##  virtual void SetGridOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << GridOrigin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> GridOrigin [ 0 ] != _arg1 ) || ( this -> GridOrigin [ 1 ] != _arg2 ) || ( this -> GridOrigin [ 2 ] != _arg3 ) ) { this -> GridOrigin [ 0 ] = _arg1 ; this -> GridOrigin [ 1 ] = _arg2 ; this -> GridOrigin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetGridOrigin ( const double _arg [ 3 ] ) { this -> SetGridOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetGridOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GridOrigin  pointer  << this -> GridOrigin ) ; return this -> GridOrigin ; } VTK_WRAPEXCLUDE virtual void GetGridOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> GridOrigin [ 0 ] ; _arg2 = this -> GridOrigin [ 1 ] ; _arg3 = this -> GridOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << GridOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetGridOrigin ( double _arg [ 3 ] ) { this -> GetGridOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Get/Set the spacing between samples in the grid.
##  virtual void SetGridOriginGridSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << GridSpacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> GridSpacing [ 0 ] != _arg1 ) || ( this -> GridSpacing [ 1 ] != _arg2 ) || ( this -> GridSpacing [ 2 ] != _arg3 ) ) { this -> GridSpacing [ 0 ] = _arg1 ; this -> GridSpacing [ 1 ] = _arg2 ; this -> GridSpacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetGridOriginGridSpacing ( const double _arg [ 3 ] ) { this -> SetGridOriginGridSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetGridOriginGridSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GridSpacing  pointer  << this -> GridSpacing ) ; return this -> GridSpacing ; } VTK_WRAPEXCLUDE virtual void GetGridOriginGridSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> GridSpacing [ 0 ] ; _arg2 = this -> GridSpacing [ 1 ] ; _arg3 = this -> GridSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << GridSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetGridOriginGridSpacing ( double _arg [ 3 ] ) { this -> GetGridOriginGridSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Get/Set the scalar type of the grid.  The default is float.
##  virtual void SetGridScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GridScalarType  to  << _arg ) ; if ( this -> GridScalarType != _arg ) { this -> GridScalarType = _arg ; this -> Modified ( ) ; } } ; virtual int GetGridScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GridScalarType  of  << this -> GridScalarType ) ; return this -> GridScalarType ; } ; void SetGridScalarTypeToDouble ( ) { this -> SetGridScalarType ( VTK_DOUBLE ) ; } void SetGridScalarTypeToFloat ( ) { this -> SetGridScalarType ( VTK_FLOAT ) ; } void SetGridScalarTypeToShort ( ) { this -> SetGridScalarType ( VTK_SHORT ) ; } void SetGridScalarTypeToUnsignedShort ( ) { this -> SetGridScalarType ( VTK_UNSIGNED_SHORT ) ; } void SetGridScalarTypeToUnsignedChar ( ) { this -> SetGridScalarType ( VTK_UNSIGNED_CHAR ) ; } void SetGridScalarTypeToChar ( ) { this -> SetGridScalarType ( VTK_CHAR ) ; } /@} /@{ *
##  Get the scale and shift to convert integer grid elements into
##  real values:  dx = scale*di + shift.  If the grid is of double type,
##  then scale = 1 and shift = 0.
##  double GetDisplacementScale ( ) { this -> UpdateShiftScale ( ) ; return this -> DisplacementScale ; } double GetDisplacementShift ( ) { this -> UpdateShiftScale ( ) ; return this -> DisplacementShift ; } /@} *
##  Get the output data object for a port on this algorithm.
##  vtkImageData * GetOutput ( ) ; *
##  see vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; protected : vtkTransformToGrid ( ) ; ~ vtkTransformToGrid ( ) override ; void RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; void RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; *
##  Internal method to calculate the shift and scale values which
##  will provide maximum grid precision for a particular integer type.
##  void UpdateShiftScale ( ) ; vtkMTimeType GetMTime ( ) override ; vtkAbstractTransform * Input ; int GridScalarType ; int GridExtent [ 6 ] ; double GridOrigin [ 3 ] ; double GridSpacing [ 3 ] ; double DisplacementScale ; double DisplacementShift ; vtkTimeStamp ShiftScaleTime ;  see algorithm for more info int FillOutputPortInformation ( int port , vtkInformation * info ) override ; private : vtkTransformToGrid ( const vtkTransformToGrid & ) = delete ; void operator = ( const vtkTransformToGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

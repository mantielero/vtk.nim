## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSampleFunction.h
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
##  @class   vtkSampleFunction
##  @brief   sample an implicit function over a structured point set
##
##  vtkSampleFunction is a source object that evaluates an implicit function
##  and normals at each point in a vtkStructuredPoints. The user can specify
##  the sample dimensions and location in space to perform the sampling. To
##  create closed surfaces (in conjunction with the vtkContourFilter), capping
##  can be turned on to set a particular value on the boundaries of the sample
##  space.
##
##  @sa
##  vtkImplicitModeller
##

## !!!Ignored construct:  # vtkSampleFunction_h [NewLine] # vtkSampleFunction_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingHybridModule.h  For export macro [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKIMAGINGHYBRID_EXPORT vtkSampleFunction : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSampleFunction :: IsTypeOf ( type ) ; } static vtkSampleFunction * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSampleFunction * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSampleFunction * NewInstance ( ) const { return vtkSampleFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSampleFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSampleFunction :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with ModelBounds=(-1,1,-1,1,-1,1), SampleDimensions=(50,50,50),
##  Capping turned off, and normal generation on.
##  static vtkSampleFunction * New ( ) ; /@{ *
##  Specify the implicit function to use to generate data.
##  virtual void SetImplicitFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameImplicitFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ImplicitFunction  address  << static_cast < vtkImplicitFunction * > ( this -> ImplicitFunction ) ) ; return this -> ImplicitFunction ; } ; /@} /@{ *
##  Set what type of scalar data this source should generate.
##  virtual void SetOutputScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputScalarType  to  << _arg ) ; if ( this -> OutputScalarType != _arg ) { this -> OutputScalarType = _arg ; this -> Modified ( ) ; } } ; virtual int GetOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; void SetOutputScalarTypeToDouble ( ) { this -> SetOutputScalarType ( VTK_DOUBLE ) ; } void SetOutputScalarTypeToFloat ( ) { this -> SetOutputScalarType ( VTK_FLOAT ) ; } void SetOutputScalarTypeToLong ( ) { this -> SetOutputScalarType ( VTK_LONG ) ; } void SetOutputScalarTypeToUnsignedLong ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_LONG ) ; } void SetOutputScalarTypeToInt ( ) { this -> SetOutputScalarType ( VTK_INT ) ; } void SetOutputScalarTypeToUnsignedInt ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_INT ) ; } void SetOutputScalarTypeToShort ( ) { this -> SetOutputScalarType ( VTK_SHORT ) ; } void SetOutputScalarTypeToUnsignedShort ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_SHORT ) ; } void SetOutputScalarTypeToChar ( ) { this -> SetOutputScalarType ( VTK_CHAR ) ; } void SetOutputScalarTypeToUnsignedChar ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_CHAR ) ; } /@} *
##  Specify the dimensions of the data on which to sample.
##  void SetSampleDimensions ( int i , int j , int k ) ; /@{ *
##  Specify the dimensions of the data on which to sample.
##  void SetSampleDimensions ( int dim [ 3 ] ) ; virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ; /@} /@{ *
##  Specify the region in space over which the sampling occurs. The
##  bounds is specified as (xMin,xMax, yMin,yMax, zMin,zMax).
##  void SetModelBounds ( const double bounds [ 6 ] ) ; void SetModelBounds ( double xMin , double xMax , double yMin , double yMax , double zMin , double zMax ) ; virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Turn on/off capping. If capping is on, then the outer boundaries of the
##  structured point set are set to cap value. This can be used to ensure
##  surfaces are closed.
##  virtual void SetOutputScalarTypeCapping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Capping  to  << _arg ) ; if ( this -> Capping != _arg ) { this -> Capping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetOutputScalarTypeCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ; virtual void CappingOn ( ) { this -> SetCapping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CappingOff ( ) { this -> SetCapping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the cap value.
##  virtual void SetOutputScalarTypeCappingCapValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CapValue  to  << _arg ) ; if ( this -> CapValue != _arg ) { this -> CapValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetOutputScalarTypeCappingCapValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CapValue  of  << this -> CapValue ) ; return this -> CapValue ; } ; /@} /@{ *
##  Turn on/off the computation of normals (normals are float values).
##  virtual void SetOutputScalarTypeCappingCapValueComputeNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetOutputScalarTypeCappingCapValueComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetCappingComputeNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetCappingComputeNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the scalar array name for this data set. Initial value is
##  "scalars".
##  virtual void SetScalarArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ScalarArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ScalarArrayName && _arg && ( ! strcmp ( this -> ScalarArrayName , _arg ) ) ) { return ; } delete [ ] this -> ScalarArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ScalarArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ScalarArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetScalarArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarArrayName  of  << ( this -> ScalarArrayName ? this -> ScalarArrayName : (null) ) ) ; return this -> ScalarArrayName ; } ; /@} /@{ *
##  Set/get the normal array name for this data set. Initial value is
##  "normals".
##  virtual void SetScalarArrayNameNormalArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NormalArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> NormalArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> NormalArrayName && _arg && ( ! strcmp ( this -> NormalArrayName , _arg ) ) ) { return ; } delete [ ] this -> NormalArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> NormalArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> NormalArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetScalarArrayNameNormalArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << NormalArrayName  of  << ( this -> NormalArrayName ? this -> NormalArrayName : (null) ) ) ; return this -> NormalArrayName ; } ; /@} *
##  Return the MTime also considering the implicit function.
##  vtkMTimeType GetMTime ( ) override ; protected : *
##  Default constructor.
##  Construct with ModelBounds=(-1,1,-1,1,-1,1), SampleDimensions=(50,50,50),
##  Capping turned off, CapValue=VTK_DOUBLE_MAX, normal generation on,
##  OutputScalarType set to VTK_DOUBLE, ImplicitFunction set to nullptr,
##  ScalarArrayName is "" and NormalArrayName is "".
##  vtkSampleFunction ( ) ; ~ vtkSampleFunction ( ) override ; void ReportReferences ( vtkGarbageCollector * ) override ; void ExecuteDataWithInformation ( vtkDataObject * , vtkInformation * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void Cap ( vtkDataArray * s ) ; int OutputScalarType ; int SampleDimensions [ 3 ] ; double ModelBounds [ 6 ] ; vtkTypeBool Capping ; double CapValue ; vtkImplicitFunction * ImplicitFunction ; vtkTypeBool ComputeNormals ; char * ScalarArrayName ; char * NormalArrayName ; private : vtkSampleFunction ( const vtkSampleFunction & ) = delete ; void operator = ( const vtkSampleFunction & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

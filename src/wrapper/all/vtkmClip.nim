## =============================================================================
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2012 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
## =============================================================================
## *
##  @class vtkmClip
##  @brief Clip a dataset using the accelerated vtk-m Clip filter.
##
##  Clip a dataset using either a given value or by using an vtkImplicitFunction
##  Currently the supported implicit functions are Box, Plane, and Sphere.
##
##

## !!!Ignored construct:  # vtkmClip_h [NewLine] # vtkmClip_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] # < memory >  For std::unique_ptr [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmClip : public vtkUnstructuredGridAlgorithm { public : static vtkmClip * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmClip :: IsTypeOf ( type ) ; } static vtkmClip * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmClip * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmClip * NewInstance ( ) const { return vtkmClip :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmClip :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmClip :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  The scalar value to use when clipping the dataset. Values greater than
##  ClipValue are preserved in the output dataset. Default is 0.
##  double GetClipValue ( ) ; void SetClipValue ( double ) ; *
##  If true, all input point data arrays will be mapped onto the output
##  dataset. Default is true.
##  bool GetComputeScalars ( ) ; void SetComputeScalars ( bool ) ; *
##  Set the implicit function with which to perform the clipping. If set,
##  \c ClipValue is ignored and the clipping is performed using the implicit
##  function.
##  void SetClipFunction ( vtkImplicitFunction * ) ; vtkImplicitFunction * GetClipFunction ( ) ; vtkMTimeType GetMTime ( ) override ; /@{ *
##  When this flag is off (the default), then the computation will fall back
##  to the serial VTK version if VTK-m fails to run. When the flag is on,
##  the filter will generate an error if VTK-m fails to run. This is mostly
##  useful in testing to make sure the expected algorithm is run.
##  virtual vtkTypeBool GetForceVTKm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceVTKm  of  << this -> ForceVTKm ) ; return this -> ForceVTKm ; } ; virtual void SetForceVTKm ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForceVTKm  to  << _arg ) ; if ( this -> ForceVTKm != _arg ) { this -> ForceVTKm = _arg ; this -> Modified ( ) ; } } ; virtual void ForceVTKmOn ( ) { this -> SetForceVTKm ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ForceVTKmOff ( ) { this -> SetForceVTKm ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkmClip ( ) ; ~ vtkmClip ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkTypeBool ForceVTKm = false ; struct internals ; std :: unique_ptr < internals > Internals ; private : vtkmClip ( const vtkmClip & ) = delete ; void operator = ( const vtkmClip & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

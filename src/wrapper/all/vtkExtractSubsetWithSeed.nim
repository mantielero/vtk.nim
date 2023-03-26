## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSubsetWithSeed.h
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
##  @class vtkExtractSubsetWithSeed
##  @brief extract a line or plane in the ijk space starting with a seed
##
##  vtkExtractSubsetWithSeed is a filter that can extract a line or a plane
##  in the i-j-k space starting with a seed point. The filter supports cases
##  where the structured grid is split up into multiple blocks (across multiple
##  ranks). It also handles cases were the ijk origin for each the blocks is not
##  aligned.
##
##  The implementation starts with the seed point and then extracts a line
##  in the chosen direction. Then, using the face center for the terminal
##  faces as the new seeds it continues seeding and extracting until a seed can
##  no longer extract a new grid. The same principle holds when extracting a
##  plane, except in that case multiple seeds are generated using face centers
##  for each face alone the plane edges.
##

## !!!Ignored construct:  # vtkExtractSubsetWithSeed_h [NewLine] # vtkExtractSubsetWithSeed_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersParallelDIY2Module.h  for export macros [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPARALLELDIY2_EXPORT vtkExtractSubsetWithSeed : public vtkDataObjectAlgorithm { public : static vtkExtractSubsetWithSeed * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractSubsetWithSeed :: IsTypeOf ( type ) ; } static vtkExtractSubsetWithSeed * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractSubsetWithSeed * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractSubsetWithSeed * NewInstance ( ) const { return vtkExtractSubsetWithSeed :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSubsetWithSeed :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSubsetWithSeed :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the extraction seed point. This is specified in world coordinates
##  i.e. x-y-z space.
##  virtual void SetSeed ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Seed  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Seed [ 0 ] != _arg1 ) || ( this -> Seed [ 1 ] != _arg2 ) || ( this -> Seed [ 2 ] != _arg3 ) ) { this -> Seed [ 0 ] = _arg1 ; this -> Seed [ 1 ] = _arg2 ; this -> Seed [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetSeed ( const double _arg [ 3 ] ) { this -> SetSeed ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetSeed ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Seed  pointer  << this -> Seed ) ; return this -> Seed ; } VTK_WRAPEXCLUDE virtual void GetSeed ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Seed [ 0 ] ; _arg2 = this -> Seed [ 1 ] ; _arg3 = this -> Seed [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Seed  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSeed ( double _arg [ 3 ] ) { this -> GetSeed ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} enum { LINE_I = 0 , LINE_J , LINE_K , PLANE_IJ , PLANE_JK , PLANE_KI , } ; /@{ *
##  Get/Set the directions in the ijk spaced to extract starting with the
##  seed.
##  virtual void SetDirection ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Direction  to  << _arg ) ; if ( this -> Direction != ( _arg < LINE_I ? LINE_I : ( _arg > PLANE_KI ? PLANE_KI : _arg ) ) ) { this -> Direction = ( _arg < LINE_I ? LINE_I : ( _arg > PLANE_KI ? PLANE_KI : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDirectionMinValue ( ) { return LINE_I ; } virtual int GetDirectionMaxValue ( ) { return PLANE_KI ; } ; virtual int GetDirection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Direction  of  << this -> Direction ) ; return this -> Direction ; } ; void SetDirectionToLineI ( ) { this -> SetDirection ( LINE_I ) ; } void SetDirectionToLineJ ( ) { this -> SetDirection ( LINE_J ) ; } void SetDirectionToLineK ( ) { this -> SetDirection ( LINE_K ) ; } void SetDirectionToPlaneIJ ( ) { this -> SetDirection ( PLANE_IJ ) ; } void SetDirectionToPlaneJK ( ) { this -> SetDirection ( PLANE_JK ) ; } void SetDirectionToPlaneKI ( ) { this -> SetDirection ( PLANE_KI ) ; } /@} /@{ *
##  Get/Set the controller to use. By default
##  vtkMultiProcessController::GlobalController will be used.
##  void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkExtractSubsetWithSeed ( ) ; ~ vtkExtractSubsetWithSeed ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkExtractSubsetWithSeed ( const vtkExtractSubsetWithSeed & ) = delete ; void operator = ( const vtkExtractSubsetWithSeed & ) = delete ; double Seed [ 3 ] = { 0 , 0 , 0 } ; int Direction = LINE_I ; vtkMultiProcessController * Controller = nullptr ; } ;
## Error: token expected: ; but got: [identifier]!!!

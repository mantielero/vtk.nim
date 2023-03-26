## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDistancePolyDataFilter.h
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
##  @class   vtkDistancePolyDataFilter
##
##
##  Computes the signed distance from one vtkPolyData to another. The
##  signed distance to the second input is computed at every point in
##  the first input using vtkImplicitPolyDataDistance. Optionally, the signed
##  distance to the first input at every point in the second input can
##  be computed. This may be enabled by calling
##  ComputeSecondDistanceOn().
##
##  If the signed distance is not desired, the unsigned distance can be
##  computed by calling SignedDistanceOff(). The signed distance field
##  may be negated by calling NegateDistanceOn();
##
##  This code was contributed in the VTK Journal paper:
##  "Boolean Operations on Surfaces in VTK Without External Libraries"
##  by Cory Quammen, Chris Weigle C., Russ Taylor
##  http://hdl.handle.net/10380/3262
##  http://www.midasjournal.org/browse/publication/797
##

## !!!Ignored construct:  # vtkDistancePolyDataFilter_h [NewLine] # vtkDistancePolyDataFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkDistancePolyDataFilter : public vtkPolyDataAlgorithm { public : static vtkDistancePolyDataFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDistancePolyDataFilter :: IsTypeOf ( type ) ; } static vtkDistancePolyDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDistancePolyDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDistancePolyDataFilter * NewInstance ( ) const { return vtkDistancePolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDistancePolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDistancePolyDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Enable/disable computation of the signed distance between
##  the first poly data and the second poly data. Defaults to on.
##  virtual void SetSignedDistance ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SignedDistance  to  << _arg ) ; if ( this -> SignedDistance != _arg ) { this -> SignedDistance = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetSignedDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SignedDistance  of  << this -> SignedDistance ) ; return this -> SignedDistance ; } ; virtual void SignedDistanceOn ( ) { this -> SetSignedDistance ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SignedDistanceOff ( ) { this -> SetSignedDistance ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable negation of the distance values. Defaults to
##  off. Has no effect if SignedDistance is off.
##  virtual void SetSignedDistanceNegateDistance ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NegateDistance  to  << _arg ) ; if ( this -> NegateDistance != _arg ) { this -> NegateDistance = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetSignedDistanceNegateDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NegateDistance  of  << this -> NegateDistance ) ; return this -> NegateDistance ; } ; virtual void NegateDistanceOn ( ) { this -> SetSignedDistanceNegateDistance ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NegateDistanceOff ( ) { this -> SetSignedDistanceNegateDistance ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable computation of a second output poly data with the
##  distance from the first poly data at each point. Defaults to on.
##  virtual void SetSignedDistanceNegateDistanceComputeSecondDistance ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeSecondDistance  to  << _arg ) ; if ( this -> ComputeSecondDistance != _arg ) { this -> ComputeSecondDistance = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetSignedDistanceNegateDistanceComputeSecondDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeSecondDistance  of  << this -> ComputeSecondDistance ) ; return this -> ComputeSecondDistance ; } ; virtual void ComputeSecondDistanceOn ( ) { this -> SetSignedDistanceNegateDistanceComputeSecondDistance ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeSecondDistanceOff ( ) { this -> SetSignedDistanceNegateDistanceComputeSecondDistance ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Get the second output, which is a copy of the second input with an
##  additional distance scalar field.
##  Note this will return a valid data object only after this->Update() is
##  called.
##  vtkPolyData * GetSecondDistanceOutput ( ) ; /@{ *
##  Enable/disable computation of cell-center distance to the
##  second poly data. Defaults to on for backwards compatibility.
##
##  If the first poly data consists of just vertex cells,
##  computing point and cell-center distances is redundant.
##  virtual void SetSignedDistanceNegateDistanceComputeSecondDistanceComputeCellCenterDistance ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeCellCenterDistance  to  << _arg ) ; if ( this -> ComputeCellCenterDistance != _arg ) { this -> ComputeCellCenterDistance = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetSignedDistanceNegateDistanceComputeSecondDistanceComputeCellCenterDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeCellCenterDistance  of  << this -> ComputeCellCenterDistance ) ; return this -> ComputeCellCenterDistance ; } ; virtual void ComputeCellCenterDistanceOn ( ) { this -> SetSignedDistanceNegateDistanceComputeSecondDistanceComputeCellCenterDistance ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeCellCenterDistanceOff ( ) { this -> SetSignedDistanceNegateDistanceComputeSecondDistanceComputeCellCenterDistance ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkDistancePolyDataFilter ( ) ; ~ vtkDistancePolyDataFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void GetPolyDataDistance ( vtkPolyData * , vtkPolyData * ) ; private : vtkDistancePolyDataFilter ( const vtkDistancePolyDataFilter & ) = delete ; void operator = ( const vtkDistancePolyDataFilter & ) = delete ; vtkTypeBool SignedDistance ; vtkTypeBool NegateDistance ; vtkTypeBool ComputeSecondDistance ; vtkTypeBool ComputeCellCenterDistance ; } ;
## Error: token expected: ; but got: [identifier]!!!

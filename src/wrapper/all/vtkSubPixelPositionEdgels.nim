## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSubPixelPositionEdgels.h
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
##  @class   vtkSubPixelPositionEdgels
##  @brief   adjust edgel locations based on gradients.
##
##  vtkSubPixelPositionEdgels is a filter that takes a series of linked
##  edgels (digital curves) and gradient maps as input. It then adjusts
##  the edgel locations based on the gradient data. Specifically, the
##  algorithm first determines the neighboring gradient magnitudes of
##  an edgel using simple interpolation of its neighbors. It then fits
##  the following three data points: negative gradient direction
##  gradient magnitude, edgel gradient magnitude and positive gradient
##  direction gradient magnitude to a quadratic function. It then
##  solves this quadratic to find the maximum gradient location along
##  the gradient orientation.  It then modifies the edgels location
##  along the gradient orientation to the calculated maximum
##  location. This algorithm does not adjust an edgel in the direction
##  orthogonal to its gradient vector.
##
##  @sa
##  vtkImageData vtkImageGradient vtkLinkEdgels
##

## !!!Ignored construct:  # vtkSubPixelPositionEdgels_h [NewLine] # vtkSubPixelPositionEdgels_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkStructuredPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkSubPixelPositionEdgels : public vtkPolyDataAlgorithm { public : static vtkSubPixelPositionEdgels * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSubPixelPositionEdgels :: IsTypeOf ( type ) ; } static vtkSubPixelPositionEdgels * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSubPixelPositionEdgels * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSubPixelPositionEdgels * NewInstance ( ) const { return vtkSubPixelPositionEdgels :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSubPixelPositionEdgels :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSubPixelPositionEdgels :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the gradient data for doing the position adjustments.
##  void SetGradMapsData ( vtkStructuredPoints * gm ) ; vtkStructuredPoints * GetGradMaps ( ) ; /@} /@{ *
##  These methods can make the positioning look for a target scalar value
##  instead of looking for a maximum.
##  virtual void SetTargetFlag ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TargetFlag  to  << _arg ) ; if ( this -> TargetFlag != _arg ) { this -> TargetFlag = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTargetFlag ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TargetFlag  of  << this -> TargetFlag ) ; return this -> TargetFlag ; } ; virtual void TargetFlagOn ( ) { this -> SetTargetFlag ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TargetFlagOff ( ) { this -> SetTargetFlag ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetTargetFlagTargetValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TargetValue  to  << _arg ) ; if ( this -> TargetValue != _arg ) { this -> TargetValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetTargetFlagTargetValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TargetValue  of  << this -> TargetValue ) ; return this -> TargetValue ; } ; /@} protected : vtkSubPixelPositionEdgels ( ) ; ~ vtkSubPixelPositionEdgels ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; void Move ( int xdim , int ydim , int zdim , int x , int y , float * img , vtkDataArray * inVecs , double * result , int z , double * aspect , double * resultNormal ) ; void Move ( int xdim , int ydim , int zdim , int x , int y , double * img , vtkDataArray * inVecs , double * result , int z , double * aspect , double * resultNormal ) ;  extension for target instead of maximum vtkTypeBool TargetFlag ; double TargetValue ; private : vtkSubPixelPositionEdgels ( const vtkSubPixelPositionEdgels & ) = delete ; void operator = ( const vtkSubPixelPositionEdgels & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

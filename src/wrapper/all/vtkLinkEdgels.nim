## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLinkEdgels.h
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
##  @class   vtkLinkEdgels
##  @brief   links edgels together to form digital curves.
##
##  vtkLinkEdgels links edgels into digital curves which are then stored
##  as polylines. The algorithm works one pixel at a time only looking at
##  its immediate neighbors. There is a GradientThreshold that can be set
##  that eliminates any pixels with a smaller gradient value. This can
##  be used as the lower threshold of a two value edgel thresholding.
##
##  For the remaining edgels, links are first tried for the four
##  connected neighbors.  A successful neighbor will satisfy three
##  tests. First both edgels must be above the gradient
##  threshold. Second, the difference between the orientation between
##  the two edgels (Alpha) and each edgels orientation (Phi) must be
##  less than LinkThreshold. Third, the difference between the two
##  edgels Phi values must be less than PhiThreshold.
##  The most successful link is selected. The measure is simply the
##  sum of the three angle differences (actually stored as the sum of
##  the cosines). If none of the four connect neighbors succeeds, then
##  the eight connect neighbors are examined using the same method.
##
##  This filter requires gradient information so you will need to use
##  a vtkImageGradient at some point prior to this filter.  Typically
##  a vtkNonMaximumSuppression filter is also used. vtkThresholdEdgels
##  can be used to complete the two value edgel thresholding as used
##  in a Canny edge detector. The vtkSubpixelPositionEdgels filter
##  can also be used after this filter to adjust the edgel locations.
##
##  @sa
##  vtkImageData vtkImageGradient vtkImageNonMaximumSuppression
##

## !!!Ignored construct:  # vtkLinkEdgels_h [NewLine] # vtkLinkEdgels_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkLinkEdgels : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLinkEdgels :: IsTypeOf ( type ) ; } static vtkLinkEdgels * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLinkEdgels * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLinkEdgels * NewInstance ( ) const { return vtkLinkEdgels :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLinkEdgels :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLinkEdgels :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct instance of vtkLinkEdgels with GradientThreshold set to
##  0.1, PhiThreshold set to 90 degrees and LinkThreshold set to 90 degrees.
##  static vtkLinkEdgels * New ( ) ; /@{ *
##  Set/Get the threshold for Phi vs. Alpha link thresholding.
##  virtual void SetLinkThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LinkThreshold  to  << _arg ) ; if ( this -> LinkThreshold != _arg ) { this -> LinkThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetLinkThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LinkThreshold  of  << this -> LinkThreshold ) ; return this -> LinkThreshold ; } ; /@} /@{ *
##  Set/get the threshold for Phi vs. Phi link thresholding.
##  virtual void SetLinkThresholdPhiThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PhiThreshold  to  << _arg ) ; if ( this -> PhiThreshold != _arg ) { this -> PhiThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetLinkThresholdPhiThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PhiThreshold  of  << this -> PhiThreshold ) ; return this -> PhiThreshold ; } ; /@} /@{ *
##  Set/Get the threshold for image gradient thresholding.
##  virtual void SetLinkThresholdPhiThresholdGradientThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GradientThreshold  to  << _arg ) ; if ( this -> GradientThreshold != _arg ) { this -> GradientThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetLinkThresholdPhiThresholdGradientThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GradientThreshold  of  << this -> GradientThreshold ) ; return this -> GradientThreshold ; } ; /@} protected : vtkLinkEdgels ( ) ; ~ vtkLinkEdgels ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; void LinkEdgels ( int xdim , int ydim , double * image , vtkDataArray * inVectors , vtkCellArray * newLines , vtkPoints * newPts , vtkDoubleArray * outScalars , vtkDoubleArray * outVectors , int z ) ; double GradientThreshold ; double PhiThreshold ; double LinkThreshold ; private : vtkLinkEdgels ( const vtkLinkEdgels & ) = delete ; void operator = ( const vtkLinkEdgels & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

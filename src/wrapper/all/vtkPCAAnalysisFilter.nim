## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPCAAnalysisFilter.h
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
##  @class   vtkPCAAnalysisFilter
##  @brief   Performs principal component analysis of a set of aligned pointsets
##
##
##  vtkPCAAnalysisFilter is a filter that takes as input a set of aligned
##  pointsets (any object derived from vtkPointSet) and performs
##  a principal component analysis of the coordinates.
##  This can be used to visualise the major or minor modes of variation
##  seen in a set of similar biological objects with corresponding
##  landmarks.
##  vtkPCAAnalysisFilter is designed to work with the output from
##  the vtkProcrustesAnalysisFilter
##  vtkPCAAnalysisFilter requires a vtkMultiBlock input consisting
##  of vtkPointSets as first level children.
##
##  vtkPCAAnalysisFilter is an implementation of (for example):
##
##  T. Cootes et al. : Active Shape Models - their training and application.
##  Computer Vision and Image Understanding, 61(1):38-59, 1995.
##
##  The material can also be found in Tim Cootes' ever-changing online report
##  published at his website:
##  http://www.isbe.man.ac.uk/~bim/
##
##  @warning
##  All of the input pointsets must have the same number of points.
##
##  @par Thanks:
##  Rasmus Paulsen and Tim Hutton who developed and contributed this class
##
##  @sa
##  vtkProcrustesAlignmentFilter
##

## !!!Ignored construct:  # vtkPCAAnalysisFilter_h [NewLine] # vtkPCAAnalysisFilter_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] class vtkFloatArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointSet"
## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkPCAAnalysisFilter : public vtkMultiBlockDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPCAAnalysisFilter :: IsTypeOf ( type ) ; } static vtkPCAAnalysisFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPCAAnalysisFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPCAAnalysisFilter * NewInstance ( ) const { return vtkPCAAnalysisFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPCAAnalysisFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPCAAnalysisFilter :: New ( ) ; } public : ; *
##  Prints information about the state of the filter.
##  void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates with similarity transform.
##  static vtkPCAAnalysisFilter * New ( ) ; /@{ *
##  Get the vector of eigenvalues sorted in descending order
##  virtual vtkFloatArray * GetnameEvals ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Evals  address  << static_cast < vtkFloatArray * > ( this -> Evals ) ) ; return this -> Evals ; } ; /@} *
##  Fills the shape with:
##
##  mean + b[0] * sqrt(eigenvalue[0]) * eigenvector[0]
##  + b[1] * sqrt(eigenvalue[1]) * eigenvector[1]
##  ...
##  + b[sizeb-1] * sqrt(eigenvalue[bsize-1]) * eigenvector[bsize-1]
##
##  here b are the parameters expressed in standard deviations
##  bsize is the number of parameters in the b vector
##  This function assumes that shape is already allocated
##  with the right size, it just moves the points.
##  void GetParameterisedShape ( vtkFloatArray * b , vtkPointSet * shape ) ; *
##  Return the bsize parameters b that best model the given shape
##  (in standard deviations).
##  That is that the given shape will be approximated by:
##
##  shape ~ mean + b[0] * sqrt(eigenvalue[0]) * eigenvector[0]
##  + b[1] * sqrt(eigenvalue[1]) * eigenvector[1]
##  ...
##  + b[bsize-1] * sqrt(eigenvalue[bsize-1]) * eigenvector[bsize-1]
##  void GetShapeParameters ( vtkPointSet * shape , vtkFloatArray * b , int bsize ) ; *
##  Retrieve how many modes are necessary to model the given proportion of the variation.
##  proportion should be between 0 and 1
##  int GetModesRequiredFor ( double proportion ) ; protected : vtkPCAAnalysisFilter ( ) ; ~ vtkPCAAnalysisFilter ( ) override ; *
##  Usual data generation method.
##  int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkPCAAnalysisFilter ( const vtkPCAAnalysisFilter & ) = delete ; void operator = ( const vtkPCAAnalysisFilter & ) = delete ;  Eigenvalues vtkFloatArray * Evals ;  Matrix where each column is an eigenvector double * * evecMat2 ;  The mean shape in a vector double * meanshape ; } ;
## Error: token expected: ; but got: [identifier]!!!

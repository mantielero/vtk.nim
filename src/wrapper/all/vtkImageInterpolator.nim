## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageInterpolator.h
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
##  @class   vtkImageInterpolator
##  @brief   interpolate data values from images
##
##  vtkImageInterpolator provides a simple interface for interpolating image
##  data.  It provides linear, cubic, and nearest-neighbor interpolation.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##  @sa
##  vtkImageReslice
##

## !!!Ignored construct:  # vtkImageInterpolator_h [NewLine] # vtkImageInterpolator_h [NewLine] # vtkAbstractImageInterpolator.h [NewLine] # vtkImagingCoreModule.h  For export macro [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageInterpolator : public vtkAbstractImageInterpolator { public : static vtkImageInterpolator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractImageInterpolator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractImageInterpolator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageInterpolator :: IsTypeOf ( type ) ; } static vtkImageInterpolator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageInterpolator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageInterpolator * NewInstance ( ) const { return vtkImageInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractImageInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageInterpolator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The interpolation mode for point scalars (default: linear).  Subclasses
##  will provide additional interpolation modes, so this is a virtual method.
##  virtual void SetInterpolationMode ( int mode ) ; void SetInterpolationModeToNearest ( ) { this -> SetInterpolationMode ( VTK_NEAREST_INTERPOLATION ) ; } void SetInterpolationModeToLinear ( ) { this -> SetInterpolationMode ( VTK_LINEAR_INTERPOLATION ) ; } void SetInterpolationModeToCubic ( ) { this -> SetInterpolationMode ( VTK_CUBIC_INTERPOLATION ) ; } int GetInterpolationMode ( ) { return this -> InterpolationMode ; } virtual const char * GetInterpolationModeAsString ( ) ; /@} *
##  Get the support size for use in computing update extents.  If the data
##  will be sampled on a regular grid, then pass a matrix describing the
##  structured coordinate transformation between the output and the input.
##  Otherwise, pass nullptr as the matrix to retrieve the full kernel size.
##  void ComputeSupportSize ( const double matrix [ 16 ] , int size [ 3 ] ) override ; *
##  Returns true if the interpolator supports weight precomputation.
##  This will always return true for this interpolator.
##  bool IsSeparable ( ) override ; /@{ *
##  If the data is going to be sampled on a regular grid, then the
##  interpolation weights can be precomputed.  A matrix must be supplied
##  that provides a transformation between the provided extent and the
##  structured coordinates of the input.  This matrix must perform only
##  permutations, scales, and translation, i.e. each of the three columns
##  must have only one non-zero value.  A new extent is provided that can
##  be used for out-of-bounds checks. THIS METHOD IS THREAD SAFE.
##  void PrecomputeWeightsForExtent ( const double matrix [ 16 ] , const int extent [ 6 ] , int newExtent [ 6 ] , vtkInterpolationWeights * & weights ) override ; void PrecomputeWeightsForExtent ( const float matrix [ 16 ] , const int extent [ 6 ] , int newExtent [ 6 ] , vtkInterpolationWeights * & weights ) override ; /@} *
##  Free the precomputed weights.  THIS METHOD IS THREAD SAFE.
##  void FreePrecomputedWeights ( vtkInterpolationWeights * & weights ) override ; protected : vtkImageInterpolator ( ) ; ~ vtkImageInterpolator ( ) override ; *
##  Update the interpolator.
##  void InternalUpdate ( ) override ; *
##  Copy all members.
##  void InternalDeepCopy ( vtkAbstractImageInterpolator * obj ) override ; /@{ *
##  Get the interpolation functions.
##  void GetInterpolationFunc ( void ( * * doublefunc ) ( vtkInterpolationInfo * , const double [ 3 ] , double * ) ) override ; void GetInterpolationFunc ( void ( * * floatfunc ) ( vtkInterpolationInfo * , const float [ 3 ] , float * ) ) override ; /@} /@{ *
##  Get the row interpolation functions.
##  void GetRowInterpolationFunc ( void ( * * doublefunc ) ( vtkInterpolationWeights * , int , int , int , double * , int ) ) override ; void GetRowInterpolationFunc ( void ( * * floatfunc ) ( vtkInterpolationWeights * , int , int , int , float * , int ) ) override ; /@} int InterpolationMode ; private : vtkImageInterpolator ( const vtkImageInterpolator & ) = delete ; void operator = ( const vtkImageInterpolator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

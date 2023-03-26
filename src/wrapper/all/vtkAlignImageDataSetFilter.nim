## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAlignImageDataSetFilter.h
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
##  @class vtkAlignImageDataSetFilter
##  @brief align collection of image datasets to use a global origin
##
##  When dealing with a collection of image datasets, either in a composite
##  dataset or in a distributed environment, it is not uncommon to have each
##  dataset have its own unique origin such that the extents for each start at 0.
##  However, if the images are parts of a whole, then several filters like
##  vtkExtractVOI that simply use extents fail to execute correctly. Such
##  filters require that all parts use the same global origin and set local
##  extents accordingly. This filter can be used to align such image
##  datasets. Essentially, this filter ensures all image datasets have the same
##  origin and each blocks extents are set relative to that origin. This requires
##  that all images have the same spacing.
##

## !!!Ignored construct:  # vtkAlignImageDataSetFilter_h [NewLine] # vtkAlignImageDataSetFilter_h [NewLine] # vtkFiltersParallelModule.h  for export macros # vtkPassInputTypeAlgorithm.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkAlignImageDataSetFilter : public vtkPassInputTypeAlgorithm { public : static vtkAlignImageDataSetFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAlignImageDataSetFilter :: IsTypeOf ( type ) ; } static vtkAlignImageDataSetFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAlignImageDataSetFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAlignImageDataSetFilter * NewInstance ( ) const { return vtkAlignImageDataSetFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAlignImageDataSetFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAlignImageDataSetFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the controller to use. By default
##  vtkMultiProcessController::GlobalController will be used.
##  void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  Specify the global minimum extent to use. By default this is set to `(0,0,0)`.
##  virtual void SetMinimumExtent ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinimumExtent  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> MinimumExtent [ 0 ] != _arg1 ) || ( this -> MinimumExtent [ 1 ] != _arg2 ) || ( this -> MinimumExtent [ 2 ] != _arg3 ) ) { this -> MinimumExtent [ 0 ] = _arg1 ; this -> MinimumExtent [ 1 ] = _arg2 ; this -> MinimumExtent [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetMinimumExtent ( const int _arg [ 3 ] ) { this -> SetMinimumExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetMinimumExtent ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumExtent  pointer  << this -> MinimumExtent ) ; return this -> MinimumExtent ; } VTK_WRAPEXCLUDE virtual void GetMinimumExtent ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> MinimumExtent [ 0 ] ; _arg2 = this -> MinimumExtent [ 1 ] ; _arg3 = this -> MinimumExtent [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MinimumExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMinimumExtent ( int _arg [ 3 ] ) { this -> GetMinimumExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} protected : vtkAlignImageDataSetFilter ( ) ; ~ vtkAlignImageDataSetFilter ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkAlignImageDataSetFilter ( const vtkAlignImageDataSetFilter & ) = delete ; void operator = ( const vtkAlignImageDataSetFilter & ) = delete ; vtkMultiProcessController * Controller ; int MinimumExtent [ 3 ] ; } ;
## Error: token expected: ; but got: [identifier]!!!

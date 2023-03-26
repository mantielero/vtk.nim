## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImagePermute.h
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
##  @class   vtkImagePermute
##  @brief    Permutes axes of input.
##
##  vtkImagePermute reorders the axes of the input. Filtered axes specify
##  the input axes which become X, Y, Z.  The input has to have the
##  same scalar type of the output. The filter does copy the
##  data when it executes. This filter is actually a very thin wrapper
##  around vtkImageReslice.
##

## !!!Ignored construct:  # vtkImagePermute_h [NewLine] # vtkImagePermute_h [NewLine] # vtkImageReslice.h [NewLine] # vtkImagingCoreModule.h  For export macro [NewLine] class VTKIMAGINGCORE_EXPORT vtkImagePermute : public vtkImageReslice { public : static vtkImagePermute * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageReslice Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageReslice :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImagePermute :: IsTypeOf ( type ) ; } static vtkImagePermute * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImagePermute * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImagePermute * NewInstance ( ) const { return vtkImagePermute :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReslice :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImagePermute :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImagePermute :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The filtered axes are the input axes that get relabeled to X,Y,Z.
##  void SetFilteredAxes ( int x , int y , int z ) ; void SetFilteredAxes ( const int xyz [ 3 ] ) { this -> SetFilteredAxes ( xyz [ 0 ] , xyz [ 1 ] , xyz [ 2 ] ) ; } virtual int * GetFilteredAxes ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FilteredAxes  pointer  << this -> FilteredAxes ) ; return this -> FilteredAxes ; } VTK_WRAPEXCLUDE virtual void GetFilteredAxes ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> FilteredAxes [ 0 ] ; _arg2 = this -> FilteredAxes [ 1 ] ; _arg3 = this -> FilteredAxes [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FilteredAxes  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFilteredAxes ( int _arg [ 3 ] ) { this -> GetFilteredAxes ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} protected : vtkImagePermute ( ) ; ~ vtkImagePermute ( ) override = default ; int FilteredAxes [ 3 ] ; private : vtkImagePermute ( const vtkImagePermute & ) = delete ; void operator = ( const vtkImagePermute & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

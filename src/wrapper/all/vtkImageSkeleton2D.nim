## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSkeleton2D.h
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
##  @class   vtkImageSkeleton2D
##  @brief   Skeleton of 2D images.
##
##  vtkImageSkeleton2D should leave only single pixel width lines
##  of non-zero-valued pixels (values of 1 are not allowed).
##  It works by erosion on a 3x3 neighborhood with special rules.
##  The number of iterations determines how far the filter can erode.
##  There are three pruning levels:
##   prune == 0 will leave traces on all angles...
##   prune == 1 will not leave traces on 135 degree angles, but will on 90.
##   prune == 2 does not leave traces on any angles leaving only closed loops.
##  Prune defaults to zero. The output scalar type is the same as the input.
##

## !!!Ignored construct:  # vtkImageSkeleton2D_h [NewLine] # vtkImageSkeleton2D_h [NewLine] # vtkImageIterateFilter.h [NewLine] # vtkImagingMorphologicalModule.h  For export macro [NewLine] class VTKIMAGINGMORPHOLOGICAL_EXPORT vtkImageSkeleton2D : public vtkImageIterateFilter { public : static vtkImageSkeleton2D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageIterateFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageIterateFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageSkeleton2D :: IsTypeOf ( type ) ; } static vtkImageSkeleton2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageSkeleton2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageSkeleton2D * NewInstance ( ) const { return vtkImageSkeleton2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageIterateFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSkeleton2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSkeleton2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  When prune is on, only closed loops are left unchanged.
##  virtual void SetPrune ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Prune  to  << _arg ) ; if ( this -> Prune != _arg ) { this -> Prune = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPrune ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Prune  of  << this -> Prune ) ; return this -> Prune ; } ; virtual void PruneOn ( ) { this -> SetPrune ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PruneOff ( ) { this -> SetPrune ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Sets the number of cycles in the erosion.
##  void SetNumberOfIterations ( int num ) override ; protected : vtkImageSkeleton2D ( ) ; ~ vtkImageSkeleton2D ( ) override = default ; vtkTypeBool Prune ; int IterativeRequestUpdateExtent ( vtkInformation * in , vtkInformation * out ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inDataV , vtkImageData * * outDataV , int outExt [ 6 ] , int id ) override ; private : vtkImageSkeleton2D ( const vtkImageSkeleton2D & ) = delete ; void operator = ( const vtkImageSkeleton2D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

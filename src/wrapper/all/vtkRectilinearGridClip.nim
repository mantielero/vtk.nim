## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGridClip.h
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
##  @class   vtkRectilinearGridClip
##  @brief   Reduces the image extent of the input.
##
##  vtkRectilinearGridClip  will make an image smaller.  The output must have
##  an image extent which is the subset of the input.  The filter has two
##  modes of operation:
##  1: By default, the data is not copied in this filter.
##  Only the whole extent is modified.
##  2: If ClipDataOn is set, then you will get no more that the clipped
##  extent.
##

## !!!Ignored construct:  # vtkRectilinearGridClip_h [NewLine] # vtkRectilinearGridClip_h [NewLine]  I did not make this a subclass of in place filter because
##  the references on the data do not matter. I make no modifications
##  to the data. # vtkFiltersGeneralModule.h  For export macro # vtkRectilinearGridAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkRectilinearGridClip : public vtkRectilinearGridAlgorithm { public : static vtkRectilinearGridClip * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkRectilinearGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkRectilinearGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRectilinearGridClip :: IsTypeOf ( type ) ; } static vtkRectilinearGridClip * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRectilinearGridClip * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRectilinearGridClip * NewInstance ( ) const { return vtkRectilinearGridClip :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRectilinearGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGridClip :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGridClip :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The whole extent of the output has to be set explicitly.
##  void SetOutputWholeExtent ( int extent [ 6 ] , vtkInformation * outInfo = nullptr ) ; void SetOutputWholeExtent ( int minX , int maxX , int minY , int maxY , int minZ , int maxZ ) ; void GetOutputWholeExtent ( int extent [ 6 ] ) ; int * GetOutputWholeExtent ( ) { return this -> OutputWholeExtent ; } /@} void ResetOutputWholeExtent ( ) ; /@{ *
##  By default, ClipData is off, and only the WholeExtent is modified.
##  the data's extent may actually be larger.  When this flag is on,
##  the data extent will be no more than the OutputWholeExtent.
##  virtual void SetClipData ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ClipData  to  << _arg ) ; if ( this -> ClipData != _arg ) { this -> ClipData = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetClipData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClipData  of  << this -> ClipData ) ; return this -> ClipData ; } ; virtual void ClipDataOn ( ) { this -> SetClipData ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ClipDataOff ( ) { this -> SetClipData ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkRectilinearGridClip ( ) ; ~ vtkRectilinearGridClip ( ) override = default ;  Time when OutputImageExtent was computed. vtkTimeStamp CTime ; int Initialized ;  Set the OutputImageExtent for the first time. int OutputWholeExtent [ 6 ] ; vtkTypeBool ClipData ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void CopyData ( vtkRectilinearGrid * inData , vtkRectilinearGrid * outData , int * ext ) ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkRectilinearGridClip ( const vtkRectilinearGridClip & ) = delete ; void operator = ( const vtkRectilinearGridClip & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

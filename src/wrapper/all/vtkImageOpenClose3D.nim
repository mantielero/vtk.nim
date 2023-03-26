## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageOpenClose3D.h
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
##  @class   vtkImageOpenClose3D
##  @brief   Will perform opening or closing.
##
##  vtkImageOpenClose3D performs opening or closing by having two
##  vtkImageErodeDilates in series.  The size of operation
##  is determined by the method SetKernelSize, and the operator is an ellipse.
##  OpenValue and CloseValue determine how the filter behaves.  For binary
##  images Opening and closing behaves as expected.
##  Close value is first dilated, and then eroded.
##  Open value is first eroded, and then dilated.
##  Degenerate two dimensional opening/closing can be achieved by setting the
##  one axis the 3D KernelSize to 1.
##  Values other than open value and close value are not touched.
##  This enables the filter to processes segmented images containing more than
##  two tags.
##

## !!!Ignored construct:  # vtkImageOpenClose3D_h [NewLine] # vtkImageOpenClose3D_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingMorphologicalModule.h  For export macro [NewLine] class vtkImageDilateErode3D ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIMAGINGMORPHOLOGICAL_EXPORT vtkImageOpenClose3D : public vtkImageAlgorithm { public : /@{ *
##  Default open value is 0, and default close value is 255.
##  static vtkImageOpenClose3D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageOpenClose3D :: IsTypeOf ( type ) ; } static vtkImageOpenClose3D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageOpenClose3D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageOpenClose3D * NewInstance ( ) const { return vtkImageOpenClose3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageOpenClose3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageOpenClose3D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  This method considers the sub filters MTimes when computing this objects
##  modified time.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Turn debugging output on. (in sub filters also)
##  void DebugOn ( ) override ; void DebugOff ( ) override ; /@} *
##  Pass modified message to sub filters.
##  void Modified ( ) override ;  Forward Source messages to filter1 *
##  Selects the size of gaps or objects removed.
##  void SetKernelSize ( int size0 , int size1 , int size2 ) ; /@{ *
##  Determines the value that will opened.
##  Open value is first eroded, and then dilated.
##  void SetOpenValue ( double value ) ; double GetOpenValue ( ) ; /@} /@{ *
##  Determines the value that will closed.
##  Close value is first dilated, and then eroded
##  void SetCloseValue ( double value ) ; double GetCloseValue ( ) ; /@} /@{ *
##  Needed for Progress functions
##  virtual vtkImageDilateErode3D * GetnameFilter0 ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Filter0  address  << static_cast < vtkImageDilateErode3D * > ( this -> Filter0 ) ) ; return this -> Filter0 ; } ; virtual vtkImageDilateErode3D * GetnameFilter0Filter1 ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Filter1  address  << static_cast < vtkImageDilateErode3D * > ( this -> Filter1 ) ) ; return this -> Filter1 ; } ; /@} *
##  see vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Override to send the request to internal pipeline.
##  int ComputePipelineMTime ( vtkInformation * request , vtkInformationVector * * inInfoVec , vtkInformationVector * outInfoVec , int requestFromOutputPort , vtkMTimeType * mtime ) override ; protected : vtkImageOpenClose3D ( ) ; ~ vtkImageOpenClose3D ( ) override ; vtkImageDilateErode3D * Filter0 ; vtkImageDilateErode3D * Filter1 ; void ReportReferences ( vtkGarbageCollector * ) override ; private : vtkImageOpenClose3D ( const vtkImageOpenClose3D & ) = delete ; void operator = ( const vtkImageOpenClose3D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

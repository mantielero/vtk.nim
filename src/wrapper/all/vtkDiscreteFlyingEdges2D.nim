## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDiscreteFlyingEdges2D.h
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
##  @class   vtkDiscreteFlyingEdges2D
##  @brief   generate isoline(s) from 2D image data
##
##  vtkDiscreteFlyingEdges2D creates output representations of label maps
##  (e.g., segmented images) using a variation of the flying edges
##  algorithm. The input is a 2D image where each point is labeled (integer
##  labels are preferred to real values), and the output data is polygonal
##  data representing labeled regions. (Note that on output each region
##  [corresponding to a different contour value] is represented independently;
##  i.e., points are not shared between regions even if they are coincident.)
##
##  @warning
##  This filter is specialized to 2D images. This implementation can produce
##  degenerate line segments (i.e., zero-length line segments).
##
##  @warning
##  Use vtkContourLoopExtraction if you wish to create polygons from the line
##  segments.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkDiscreteMarchingCubes vtkContourLoopExtraction
##

## !!!Ignored construct:  # vtkDiscreteFlyingEdges2D_h [NewLine] # vtkDiscreteFlyingEdges2D_h [NewLine] # vtkContourValues.h  Needed for direct access to ContourValues # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkDiscreteFlyingEdges2D : public vtkPolyDataAlgorithm { public : *
##  Standard methods for instantiation, printing, and type information.
##  static vtkDiscreteFlyingEdges2D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDiscreteFlyingEdges2D :: IsTypeOf ( type ) ; } static vtkDiscreteFlyingEdges2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDiscreteFlyingEdges2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDiscreteFlyingEdges2D * NewInstance ( ) const { return vtkDiscreteFlyingEdges2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDiscreteFlyingEdges2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDiscreteFlyingEdges2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Because we delegate to vtkContourValues.
##  vtkMTimeType GetMTime ( ) override ; *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##  void SetValue ( int i , double value ) { this -> ContourValues -> SetValue ( i , value ) ; } *
##  Get the ith contour value.
##  double GetValue ( int i ) { return this -> ContourValues -> GetValue ( i ) ; } *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##  double * GetValues ( ) { return this -> ContourValues -> GetValues ( ) ; } *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##  void GetValues ( double * contourValues ) { this -> ContourValues -> GetValues ( contourValues ) ; } *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##  void SetNumberOfContours ( int number ) { this -> ContourValues -> SetNumberOfContours ( number ) ; } *
##  Get the number of contours in the list of contour values.
##  vtkIdType GetNumberOfContours ( ) { return this -> ContourValues -> GetNumberOfContours ( ) ; } /@{ *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##  void GenerateValues ( int numContours , double range [ 2 ] ) { this -> ContourValues -> GenerateValues ( numContours , range ) ; } void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) { this -> ContourValues -> GenerateValues ( numContours , rangeStart , rangeEnd ) ; } /@} /@{ *
##  Option to set the point scalars of the output.  The scalars will be the
##  label values.  By default this flag is on.
##  virtual void SetComputeScalars ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeScalars  to  << _arg ) ; if ( this -> ComputeScalars != _arg ) { this -> ComputeScalars = _arg ; this -> Modified ( ) ; } } ; virtual int GetComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ; virtual void ComputeScalarsOn ( ) { this -> SetComputeScalars ( static_cast < int > ( 1 ) ) ; } virtual void ComputeScalarsOff ( ) { this -> SetComputeScalars ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get which component of the scalar array to contour on; defaults to 0.
##  virtual void SetComputeScalarsArrayComponent ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ArrayComponent  to  << _arg ) ; if ( this -> ArrayComponent != _arg ) { this -> ArrayComponent = _arg ; this -> Modified ( ) ; } } ; virtual int GetComputeScalarsArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ; /@} protected : vtkDiscreteFlyingEdges2D ( ) ; ~ vtkDiscreteFlyingEdges2D ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkContourValues * ContourValues ; int ComputeScalars ; int ArrayComponent ; private : vtkDiscreteFlyingEdges2D ( const vtkDiscreteFlyingEdges2D & ) = delete ; void operator = ( const vtkDiscreteFlyingEdges2D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

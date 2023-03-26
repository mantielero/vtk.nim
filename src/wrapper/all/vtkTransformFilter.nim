## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransformFilter.h
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
##  @class   vtkTransformFilter
##  @brief   transform points and associated normals and vectors
##
##  vtkTransformFilter is a filter to transform point coordinates, and
##  associated point normals and vectors, as well as cell normals and vectors.
##  Transformed data array will be stored in a float array or a double array.
##  Other point and cell data are passed through the filter, unless
##  TransformAllInputVectors is set to true, in this case all other 3
##  components arrays from point and cell data will be transformed as well.
##
##  An alternative method of transformation is to use vtkActor's methods
##  to scale, rotate, and translate objects. The difference between the
##  two methods is that vtkActor's transformation simply effects where
##  objects are rendered (via the graphics pipeline), whereas
##  vtkTransformFilter actually modifies point coordinates in the
##  visualization pipeline. This is necessary for some objects
##  (e.g., vtkProbeFilter) that require point coordinates as input.
##
##  @sa
##  vtkAbstractTransform vtkTransformPolyDataFilter vtkActor
##

## !!!Ignored construct:  # vtkTransformFilter_h [NewLine] # vtkTransformFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class vtkAbstractTransform ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkTransformFilter : public vtkPointSetAlgorithm { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and
##  printing.
##  static vtkTransformFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTransformFilter :: IsTypeOf ( type ) ; } static vtkTransformFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTransformFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTransformFilter * NewInstance ( ) const { return vtkTransformFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransformFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransformFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Return the MTime also considering the transform.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Specify the transform object used to transform points.
##  virtual void SetTransform ( vtkAbstractTransform * ) ; virtual vtkAbstractTransform * GetnameTransform ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Transform  address  << static_cast < vtkAbstractTransform * > ( this -> Transform ) ) ; return this -> Transform ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} /@{ *
##  If off (the default), only Vectors and Normals will be transformed.  If
##  on, all 3-component data arrays (treated as 3D vectors) will be
##  transformed, while other non-3-component data arrays will be passed
##  through to the output unchanged.
##  virtual void SetOutputPointsPrecisionTransformAllInputVectors ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TransformAllInputVectors  to  << _arg ) ; if ( this -> TransformAllInputVectors != _arg ) { this -> TransformAllInputVectors = _arg ; this -> Modified ( ) ; } } ; virtual bool GetOutputPointsPrecisionTransformAllInputVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TransformAllInputVectors  of  << this -> TransformAllInputVectors ) ; return this -> TransformAllInputVectors ; } ; virtual void TransformAllInputVectorsOn ( ) { this -> SetTransformAllInputVectors ( static_cast < bool > ( 1 ) ) ; } virtual void TransformAllInputVectorsOff ( ) { this -> SetTransformAllInputVectors ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkTransformFilter ( ) ; ~ vtkTransformFilter ( ) override ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  Specifies that the filter only takes input dataset types of vtkPointSet, vtkImageData,
##  and vtkRectilinearGrid. int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkDataArray * CreateNewDataArray ( vtkDataArray * input = nullptr ) ; vtkAbstractTransform * Transform ; int OutputPointsPrecision ; bool TransformAllInputVectors ; private : vtkTransformFilter ( const vtkTransformFilter & ) = delete ; void operator = ( const vtkTransformFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

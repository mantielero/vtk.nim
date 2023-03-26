## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAreaContourSpectrumFilter.h
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
##  @class   vtkAreaContourSpectrumFilter
##  @brief   compute an approximation of the area
##  contour signature (evolution of the area of the input surface along an arc of
##  the Reeb graph).
##
##  The filter takes a vtkPolyData as an input (port 0), along with a
##  vtkReebGraph (port 1).
##  The Reeb graph arc to consider can be specified with SetArcId() (default: 0).
##  The number of (evenly distributed) samples of the signature can be defined
##  with SetNumberOfSamples() (default value: 100).
##  The filter will first try to pull as a scalar field the vtkDataArray with Id
##  'FieldId' of the vtkPolyData, see SetFieldId (default: 0). The filter will
##  abort if this field does not exist.
##
##  The filter outputs a vtkTable with the area contour signature
##  approximation, each sample being evenly distributed in the function span of
##  the arc.
##
##  This filter is a typical example for designing your own contour signature
##  filter (with customized metrics). It also shows typical vtkReebGraph
##  traversals.
##
##  Reference:
##  C. Bajaj, V. Pascucci, D. Schikore,
##  "The contour spectrum",
##  IEEE Visualization, 167-174, 1997.
##

## !!!Ignored construct:  # vtkAreaContourSpectrumFilter_h [NewLine] # vtkAreaContourSpectrumFilter_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersGeneralModule.h  For export macro [NewLine] class vtkTable ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkAreaContourSpectrumFilter : public vtkDataObjectAlgorithm { public : static vtkAreaContourSpectrumFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAreaContourSpectrumFilter :: IsTypeOf ( type ) ; } static vtkAreaContourSpectrumFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAreaContourSpectrumFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAreaContourSpectrumFilter * NewInstance ( ) const { return vtkAreaContourSpectrumFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAreaContourSpectrumFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAreaContourSpectrumFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the arc Id for which the contour signature has to be computed.
##  Default value: 0
##  virtual void SetArcId ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ArcId  to  << _arg ) ; if ( this -> ArcId != _arg ) { this -> ArcId = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetArcId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcId  of  << this -> ArcId ) ; return this -> ArcId ; } ; /@} /@{ *
##  Set the number of samples in the output signature
##  Default value: 100
##  virtual void SetArcIdNumberOfSamples ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfSamples  to  << _arg ) ; if ( this -> NumberOfSamples != _arg ) { this -> NumberOfSamples = _arg ; this -> Modified ( ) ; } } ; virtual int GetArcIdNumberOfSamples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSamples  of  << this -> NumberOfSamples ) ; return this -> NumberOfSamples ; } ; /@} /@{ *
##  Set the scalar field Id
##  Default value: 0
##  virtual void SetArcIdNumberOfSamplesFieldId ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FieldId  to  << _arg ) ; if ( this -> FieldId != _arg ) { this -> FieldId = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetArcIdNumberOfSamplesFieldId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldId  of  << this -> FieldId ) ; return this -> FieldId ; } ; /@} vtkTable * GetOutput ( ) ; protected : vtkAreaContourSpectrumFilter ( ) ; ~ vtkAreaContourSpectrumFilter ( ) override ; vtkIdType ArcId , FieldId ; int NumberOfSamples ; int FillInputPortInformation ( int portNumber , vtkInformation * ) override ; int FillOutputPortInformation ( int portNumber , vtkInformation * info ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkAreaContourSpectrumFilter ( const vtkAreaContourSpectrumFilter & ) = delete ; void operator = ( const vtkAreaContourSpectrumFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

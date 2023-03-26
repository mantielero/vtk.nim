## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkReebGraphSurfaceSkeletonFilter.h
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
##  @class   vtkReebGraphSurfaceSkeletonFilter
##  @brief   compute a skeletal embedding of the
##  Reeb graph of a scalar field defined on a triangulated surface (vtkPolyData).
##
##  The filter takes a vtkPolyData as an input (port 0), along with a
##  vtkReebGraph (port 1).
##  The filter samples each arc of the Reeb graph and embeds the samples on the
##  barycenter of the corresponding field contour.
##  The number of (evenly distributed) arc samples can be defined with
##  SetNumberOfSamples() (default value: 10).
##  The skeleton can be optionally smoothed with SetNumberOfSmoothingIterations()
##  (default value: 10).
##  The filter will first try to pull as a scalar field the vtkDataArray with Id
##  'FieldId' of the vtkPolyData, see SetFieldId() (default: 0). The filter will
##  abort if this field does not exist.
##
##  The filter outputs a vtkTable of points (double[3]). Each column contains the
##  samples (sorted by function value) of the corresponding arc. The first and
##  the last entry of the column corresponds to the critical nodes at the
##  extremity of the arc (each column has NumberOfSamples + 2 entries).
##
##  The skeleton can be rendered by linking the samples with geometrical
##  primitives (for instance, spheres at critical nodes and cylinders between
##  intermediary samples, see Graphics/Testing/Cxx/TestReebGraph.cxx).
##
##

## !!!Ignored construct:  # vtkReebGraphSurfaceSkeletonFilter_h [NewLine] # vtkReebGraphSurfaceSkeletonFilter_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersReebGraphModule.h  For export macro [NewLine] class vtkReebGraph ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkTable"
## !!!Ignored construct:  class VTKFILTERSREEBGRAPH_EXPORT vtkReebGraphSurfaceSkeletonFilter : public vtkDataObjectAlgorithm { public : static vtkReebGraphSurfaceSkeletonFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkReebGraphSurfaceSkeletonFilter :: IsTypeOf ( type ) ; } static vtkReebGraphSurfaceSkeletonFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkReebGraphSurfaceSkeletonFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkReebGraphSurfaceSkeletonFilter * NewInstance ( ) const { return vtkReebGraphSurfaceSkeletonFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkReebGraphSurfaceSkeletonFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkReebGraphSurfaceSkeletonFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the number of samples along each arc of the Reeb graph
##  Default value: 5
##  virtual void SetNumberOfSamples ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfSamples  to  << _arg ) ; if ( this -> NumberOfSamples != _arg ) { this -> NumberOfSamples = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfSamples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSamples  of  << this -> NumberOfSamples ) ; return this -> NumberOfSamples ; } ; /@} /@{ *
##  Set the number of optional smoothing iterations
##  Default value: 30
##  virtual void SetNumberOfSamplesNumberOfSmoothingIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfSmoothingIterations  to  << _arg ) ; if ( this -> NumberOfSmoothingIterations != _arg ) { this -> NumberOfSmoothingIterations = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfSamplesNumberOfSmoothingIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSmoothingIterations  of  << this -> NumberOfSmoothingIterations ) ; return this -> NumberOfSmoothingIterations ; } ; /@} /@{ *
##  Set the scalar field Id
##  Default value: 0
##  virtual void SetNumberOfSamplesNumberOfSmoothingIterationsFieldId ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FieldId  to  << _arg ) ; if ( this -> FieldId != _arg ) { this -> FieldId = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetNumberOfSamplesNumberOfSmoothingIterationsFieldId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldId  of  << this -> FieldId ) ; return this -> FieldId ; } ; /@} vtkTable * GetOutput ( ) ; protected : vtkReebGraphSurfaceSkeletonFilter ( ) ; ~ vtkReebGraphSurfaceSkeletonFilter ( ) override ; vtkIdType FieldId ; int NumberOfSamples , NumberOfSmoothingIterations ; int FillInputPortInformation ( int portNumber , vtkInformation * ) override ; int FillOutputPortInformation ( int portNumber , vtkInformation * info ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkReebGraphSurfaceSkeletonFilter ( const vtkReebGraphSurfaceSkeletonFilter & ) = delete ; void operator = ( const vtkReebGraphSurfaceSkeletonFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

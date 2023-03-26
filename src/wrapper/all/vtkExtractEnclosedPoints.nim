## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractEnclosedPoints.h
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
##  @class   vtkExtractEnclosedPoints
##  @brief   extract points inside of a closed polygonal surface
##
##  vtkExtractEnclosedPoints is a filter that evaluates all the input points
##  to determine whether they are contained within an enclosing surface. Those
##  within the surface are sent to the output. The enclosing surface is
##  specified through a second input to the filter.
##
##  Note: as a derived class of vtkPointCloudFilter, additional methods are
##  available for generating an in/out mask, and also extracting points
##  outside of the enclosing surface.
##
##  @warning
##  The filter assumes that the surface is closed and manifold. A boolean flag
##  can be set to force the filter to first check whether this is true. If false,
##  all points will be marked outside. Note that if this check is not performed
##  and the surface is not closed, the results are undefined.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @warning
##  The filter vtkSelectEnclosedPoints marks points as to in/out of the
##  enclosing surface, and operates on any dataset type, producing an output
##  dataset of the same type as the input. Then, thresholding and masking
##  filters can be used to extract parts of the dataset. This filter
##  (vtkExtractEnclosedPoints) is meant to operate on point clouds represented
##  by vtkPolyData, and produces vtkPolyData on output, so it is more
##  efficient for point processing. Note that this filter delegates many of
##  its methods to vtkSelectEnclosedPoints.
##
##  @sa
##  vtkSelectEnclosedPoints vtkExtractPoints
##

## !!!Ignored construct:  # vtkExtractEnclosedPoints_h [NewLine] # vtkExtractEnclosedPoints_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPointCloudFilter.h [NewLine] class VTKFILTERSPOINTS_EXPORT vtkExtractEnclosedPoints : public vtkPointCloudFilter { public : /@{ *
##  Standard methods for instantiation, type information, and printing.
##  static vtkExtractEnclosedPoints * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointCloudFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointCloudFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractEnclosedPoints :: IsTypeOf ( type ) ; } static vtkExtractEnclosedPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractEnclosedPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractEnclosedPoints * NewInstance ( ) const { return vtkExtractEnclosedPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractEnclosedPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractEnclosedPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set the surface to be used to test for containment. Two methods are
##  provided: one directly for vtkPolyData, and one for the output of a
##  filter.
##  void SetSurfaceData ( vtkPolyData * pd ) ; void SetSurfaceConnection ( vtkAlgorithmOutput * algOutput ) ; /@} /@{ *
##  Return a pointer to the enclosing surface.
##  vtkPolyData * GetSurface ( ) ; vtkPolyData * GetSurface ( vtkInformationVector * sourceInfo ) ; /@} /@{ *
##  Specify whether to check the surface for closure. If on, then the
##  algorithm first checks to see if the surface is closed and manifold.
##  virtual void SetCheckSurface ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CheckSurface  to  << _arg ) ; if ( this -> CheckSurface != _arg ) { this -> CheckSurface = _arg ; this -> Modified ( ) ; } } ; virtual void CheckSurfaceOn ( ) { this -> SetCheckSurface ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CheckSurfaceOff ( ) { this -> SetCheckSurface ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetCheckSurface ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CheckSurface  of  << this -> CheckSurface ) ; return this -> CheckSurface ; } ; /@} /@{ *
##  Specify the tolerance on the intersection. The tolerance is expressed as
##  a fraction of the diagonal of the bounding box of the enclosing surface.
##  virtual void SetTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Tolerance  to  << _arg ) ; if ( this -> Tolerance != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Tolerance = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetToleranceMinValue ( ) { return 0.0 ; } virtual double GetToleranceMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetCheckSurfaceTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} protected : vtkExtractEnclosedPoints ( ) ; ~ vtkExtractEnclosedPoints ( ) override ; vtkTypeBool CheckSurface ; double Tolerance ;  Internal structures for managing the intersection testing vtkPolyData * Surface ;  Satisfy vtkPointCloudFilter superclass API int FilterPoints ( vtkPointSet * input ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkExtractEnclosedPoints ( const vtkExtractEnclosedPoints & ) = delete ; void operator = ( const vtkExtractEnclosedPoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

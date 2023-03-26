## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointInterpolator2D.h
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
##  @class   vtkPointInterpolator2D
##  @brief   interpolate point cloud attribute data
##  onto x-y plane using various kernels
##
##
##  vtkPointInterpolator2D probes a point cloud Pc (the filter Source) with a
##  set of points P (the filter Input), interpolating the data values from Pc
##  onto P. Note however that the descriptive phrase "point cloud" is a
##  misnomer: Pc can be represented by any vtkDataSet type, with the points of
##  the dataset forming Pc. Similarly, the output P can also be represented by
##  any vtkDataSet type; and the topology/geometry structure of P is passed
##  through to the output along with the newly interpolated arrays. However,
##  this filter presumes that P lies on a plane z=0.0, thus z-coordinates
##  are set accordingly during the interpolation process.
##
##  The optional boolean flag InterpolateZ is provided for convenience. In
##  effect it turns the source z coordinates into an additional array that is
##  interpolated onto the output data. For example, if the source is a x-y-z
##  LIDAR point cloud, then z can be interpolated onto the output dataset as a
##  vertical elevation(z-coordinate).
##
##  A key input to this filter is the specification of the interpolation
##  kernel, and the parameters which control the associated interpolation
##  process. Interpolation kernels include Voronoi, Gaussian, Shepard, and SPH
##  (smoothed particle hydrodynamics), with additional kernels to be added in
##  the future. See vtkPointInterpolator for more information.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @warning
##  For widely spaced points in Pc, or when p is located outside the bounding
##  region of Pc, the interpolation may behave badly and the interpolation
##  process will adapt as necessary to produce output. For example, if the N
##  closest points within R are requested to interpolate p, if N=0 then the
##  interpolation will switch to a different strategy (which can be controlled
##  as in the NullPointsStrategy).
##
##  @sa
##  vtkPointInterpolator
##

## !!!Ignored construct:  # vtkPointInterpolator2D_h [NewLine] # vtkPointInterpolator2D_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPointInterpolator.h [NewLine] # vtkStdString.h  For vtkStdString ivars [NewLine] class VTKFILTERSPOINTS_EXPORT vtkPointInterpolator2D : public vtkPointInterpolator { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing.
##  static vtkPointInterpolator2D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointInterpolator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointInterpolator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointInterpolator2D :: IsTypeOf ( type ) ; } static vtkPointInterpolator2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointInterpolator2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointInterpolator2D * NewInstance ( ) const { return vtkPointInterpolator2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointInterpolator2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointInterpolator2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify whether to take the z-coordinate values of the source points as
##  attributes to be interpolated. This is in addition to any other point
##  attribute data associated with the source. By default this is enabled.
##  virtual void SetInterpolateZ ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InterpolateZ  to  << _arg ) ; if ( this -> InterpolateZ != _arg ) { this -> InterpolateZ = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInterpolateZ ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateZ  of  << this -> InterpolateZ ) ; return this -> InterpolateZ ; } ; virtual void InterpolateZOn ( ) { this -> SetInterpolateZ ( static_cast < bool > ( 1 ) ) ; } virtual void InterpolateZOff ( ) { this -> SetInterpolateZ ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the name of the output array containing z values. This method is
##  only applicable when InterpolateZ is enabled. By default the output
##  array name is "Elevation".
##  virtual void SetInterpolateZZArrayName ( vtkStdString _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ZArrayName  to  << _arg ) ; if ( this -> ZArrayName != _arg ) { this -> ZArrayName = _arg ; this -> Modified ( ) ; } } ; virtual vtkStdString GetInterpolateZZArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZArrayName  of  << this -> ZArrayName ) ; return this -> ZArrayName ; } ; /@} protected : vtkPointInterpolator2D ( ) ; ~ vtkPointInterpolator2D ( ) override ;  Interpolate z values? bool InterpolateZ ;  Name of output array vtkStdString ZArrayName ;  The driver of the algorithm void Probe ( vtkDataSet * input , vtkDataSet * source , vtkDataSet * output ) override ; private : vtkPointInterpolator2D ( const vtkPointInterpolator2D & ) = delete ; void operator = ( const vtkPointInterpolator2D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

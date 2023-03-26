## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFitImplicitFunction.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkFitImplicitFunction
##  @brief   extract points on the surface of an implicit function
##
##
##  vtkFitImplicitFunction extract points that are on the surface of an
##  implicit function (within some threshold). Implicit functions in VTK are
##  any function of the form f(x,y,z)=c, where values c==0 are considered the
##  surface of the implicit function. Typical examples of implicit functions
##  include planes, spheres, cylinders, cones, etc. plus boolean combinations
##  of these functions. In this implementation, a threshold is used to create
##  a fuzzy region considered "on" the surface. In essence, this is a very
##  poor man's RANSAC algorithm, where the user picks a function on which to
##  fit some points. Thus it is possible to use this filter to define a
##  proposed model and place it into an optimization loop to best fit it to a
##  set of points.
##
##  Note that while any vtkPointSet type can be provided as input, the output is
##  represented by an explicit representation of points via a
##  vtkPolyData. This output polydata will populate its instance of vtkPoints,
##  but no cells will be defined (i.e., no vtkVertex or vtkPolyVertex are
##  contained in the output). Also, after filter execution, the user can
##  request a vtkIdType* map which indicates how the input points were mapped
##  to the output. A value of map[i] (where i is the ith input point) less
##  than 0 means that the ith input point was removed. (See also the
##  superclass documentation for accessing the removed points through the
##  filter's second output.)
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkPointCloudFilter vtkExtractPoints vtkImplicitFunction
##

## !!!Ignored construct:  # vtkFitImplicitFunction_h [NewLine] # vtkFitImplicitFunction_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPointCloudFilter.h [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointSet"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkFitImplicitFunction : public vtkPointCloudFilter { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkFitImplicitFunction * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointCloudFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointCloudFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFitImplicitFunction :: IsTypeOf ( type ) ; } static vtkFitImplicitFunction * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFitImplicitFunction * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFitImplicitFunction * NewInstance ( ) const { return vtkFitImplicitFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFitImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFitImplicitFunction :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the implicit function defining a surface on which points
##  are to be extracted.
##  virtual void SetImplicitFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameImplicitFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ImplicitFunction  address  << static_cast < vtkImplicitFunction * > ( this -> ImplicitFunction ) ) ; return this -> ImplicitFunction ; } ; /@} /@{ *
##  Specify a threshold value which defines a fuzzy extraction surface.
##  Since in this filter the implicit surface is defined as f(x,y,z)=0;
##  the extracted points are (-Threshold <= f(x,y,z) < Threshold).
##  virtual void SetThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Threshold  to  << _arg ) ; if ( this -> Threshold != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Threshold = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetThresholdMinValue ( ) { return 0.0 ; } virtual double GetThresholdMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Threshold  of  << this -> Threshold ) ; return this -> Threshold ; } ; /@} *
##  Return the MTime taking into account changes to the implicit function.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkFitImplicitFunction ( ) ; ~ vtkFitImplicitFunction ( ) override ; vtkImplicitFunction * ImplicitFunction ; double Threshold ;  All derived classes must implement this method. Note that a side effect of
##  the class is to populate the PointMap. Zero is returned if there is a failure. int FilterPoints ( vtkPointSet * input ) override ; private : vtkFitImplicitFunction ( const vtkFitImplicitFunction & ) = delete ; void operator = ( const vtkFitImplicitFunction & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

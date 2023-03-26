## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRadiusOutlierRemoval.h
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
##  @class   vtkRadiusOutlierRemoval
##  @brief   remove isolated points
##
##
##  vtkRadiusOutlierRemoval removes isolated points; i.e., those points that
##  have few neighbors within a specified radius. The user must specify the
##  radius defining the local region, as well as the isolation threshold
##  (i.e., number of neighboring points required for the point to be
##  considered isolated). Optionally, users can specify a point locator to
##  accelerate local neighborhood search operations. (By default a
##  vtkStaticPointLocator will be created.)
##
##  Note that while any vtkPointSet type can be provided as input, the output
##  is represented by an explicit representation of points via a
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
##  vtkPointCloudFilter vtkStatisticalOutlierRemoval vtkExtractPoints
##  vtkThresholdPoints vtkImplicitFunction
##

## !!!Ignored construct:  # vtkRadiusOutlierRemoval_h [NewLine] # vtkRadiusOutlierRemoval_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPointCloudFilter.h [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointSet"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkRadiusOutlierRemoval : public vtkPointCloudFilter { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkRadiusOutlierRemoval * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointCloudFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointCloudFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRadiusOutlierRemoval :: IsTypeOf ( type ) ; } static vtkRadiusOutlierRemoval * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRadiusOutlierRemoval * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRadiusOutlierRemoval * NewInstance ( ) const { return vtkRadiusOutlierRemoval :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRadiusOutlierRemoval :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRadiusOutlierRemoval :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the local search radius.
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Specify the number of neighbors that a point must have, within
##  the specified radius, for the point to not be considered isolated.
##  virtual void SetRadiusNumberOfNeighbors ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfNeighbors  to  << _arg ) ; if ( this -> NumberOfNeighbors != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfNeighbors = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueNumberOfNeighborsMinValue ( ) { return 1 ; } virtual int GetRadiusMaxValueNumberOfNeighborsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetRadiusNumberOfNeighbors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfNeighbors  of  << this -> NumberOfNeighbors ) ; return this -> NumberOfNeighbors ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate near a
##  specified interpolation position.
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} protected : vtkRadiusOutlierRemoval ( ) ; ~ vtkRadiusOutlierRemoval ( ) override ; double Radius ; int NumberOfNeighbors ; vtkAbstractPointLocator * Locator ;  All derived classes must implement this method. Note that a side effect of
##  the class is to populate the PointMap. Zero is returned if there is a failure. int FilterPoints ( vtkPointSet * input ) override ; private : vtkRadiusOutlierRemoval ( const vtkRadiusOutlierRemoval & ) = delete ; void operator = ( const vtkRadiusOutlierRemoval & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

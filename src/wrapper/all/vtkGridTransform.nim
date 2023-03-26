## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGridTransform.h
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
##  @class   vtkGridTransform
##  @brief   a nonlinear warp transformation
##
##  vtkGridTransform describes a nonlinear warp transformation as a set
##  of displacement vectors sampled along a uniform 3D grid.
##  @warning
##  The inverse grid transform is calculated using an iterative method,
##  and is several times more expensive than the forward transform.
##  @sa
##  vtkThinPlateSplineTransform vtkGeneralTransform vtkTransformToGrid
##

## !!!Ignored construct:  # vtkGridTransform_h [NewLine] # vtkGridTransform_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkWarpTransform.h [NewLine] class vtkAlgorithmOutput ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkGridTransformConnectionHolder"
discard "forward decl of vtkImageData"
const
  VTK_GRID_NEAREST* = VTK_NEAREST_INTERPOLATION
  VTK_GRID_LINEAR* = VTK_LINEAR_INTERPOLATION
  VTK_GRID_CUBIC* = VTK_CUBIC_INTERPOLATION

## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkGridTransform : public vtkWarpTransform { public : static vtkGridTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWarpTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWarpTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGridTransform :: IsTypeOf ( type ) ; } static vtkGridTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGridTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGridTransform * NewInstance ( ) const { return vtkGridTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWarpTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGridTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGridTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the grid transform (the grid transform must have three
##  components for displacement in x, y, and z respectively).
##  The vtkGridTransform class will never modify the data.
##  Note that SetDisplacementGridData() does not setup a pipeline
##  connection whereas SetDisplacementGridConnection does.
##  virtual void SetDisplacementGridConnection ( vtkAlgorithmOutput * ) ; virtual void SetDisplacementGridData ( vtkImageData * ) ; virtual vtkImageData * GetDisplacementGrid ( ) ; /@} /@{ *
##  Set scale factor to be applied to the displacements.
##  This is used primarily for grids which contain integer
##  data types.  Default: 1
##  virtual void SetDisplacementScale ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisplacementScale  to  << _arg ) ; if ( this -> DisplacementScale != _arg ) { this -> DisplacementScale = _arg ; this -> Modified ( ) ; } } ; virtual double GetDisplacementScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplacementScale  of  << this -> DisplacementScale ) ; return this -> DisplacementScale ; } ; /@} /@{ *
##  Set a shift to be applied to the displacements.  The shift
##  is applied after the scale, i.e. x = scale*y + shift.
##  Default: 0
##  virtual void SetDisplacementScaleDisplacementShift ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisplacementShift  to  << _arg ) ; if ( this -> DisplacementShift != _arg ) { this -> DisplacementShift = _arg ; this -> Modified ( ) ; } } ; virtual double GetDisplacementScaleDisplacementShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplacementShift  of  << this -> DisplacementShift ) ; return this -> DisplacementShift ; } ; /@} /@{ *
##  Set interpolation mode for sampling the grid.  Higher-order
##  interpolation allows you to use a sparser grid.
##  Default: Linear.
##  void SetInterpolationMode ( int mode ) ; virtual int GetDisplacementScaleDisplacementShiftInterpolationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationMode  of  << this -> InterpolationMode ) ; return this -> InterpolationMode ; } ; void SetInterpolationModeToNearestNeighbor ( ) { this -> SetInterpolationMode ( VTK_NEAREST_INTERPOLATION ) ; } void SetInterpolationModeToLinear ( ) { this -> SetInterpolationMode ( VTK_LINEAR_INTERPOLATION ) ; } void SetInterpolationModeToCubic ( ) { this -> SetInterpolationMode ( VTK_CUBIC_INTERPOLATION ) ; } const char * GetInterpolationModeAsString ( ) ; /@} *
##  Make another transform of the same type.
##  vtkAbstractTransform * MakeTransform ( ) override ; *
##  Get the MTime.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkGridTransform ( ) ; ~ vtkGridTransform ( ) override ; *
##  Update the displacement grid.
##  void InternalUpdate ( ) override ; *
##  Copy this transform from another of the same type.
##  void InternalDeepCopy ( vtkAbstractTransform * transform ) override ; /@{ *
##  Internal functions for calculating the transformation.
##  void ForwardTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void ForwardTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} void ForwardTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void ForwardTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; void InverseTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void InverseTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; void InverseTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void InverseTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; void ( * InterpolationFunction ) ( double point [ 3 ] , double displacement [ 3 ] , double derivatives [ 3 ] [ 3 ] , void * gridPtr , int gridType , int inExt [ 6 ] , vtkIdType inInc [ 3 ] ) ; int InterpolationMode ; double DisplacementScale ; double DisplacementShift ; void * GridPointer ; int GridScalarType ; double GridSpacing [ 3 ] ; double GridOrigin [ 3 ] ; int GridExtent [ 6 ] ; vtkIdType GridIncrements [ 3 ] ; private : vtkGridTransform ( const vtkGridTransform & ) = delete ; void operator = ( const vtkGridTransform & ) = delete ; vtkGridTransformConnectionHolder * ConnectionHolder ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc GetInterpolationModeAsString*(): cstring {.
    importcpp: "VTKFILTERSHYBRID_EXPORT::GetInterpolationModeAsString(@)",
    header: "vtkGridTransform.h".}
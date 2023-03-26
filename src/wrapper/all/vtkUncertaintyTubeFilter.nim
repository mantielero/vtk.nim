## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUncertaintyTubeFilter.h
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
##  @class   vtkUncertaintyTubeFilter
##  @brief   generate uncertainty tubes along a polyline
##
##  vtkUncertaintyTubeFilter is a filter that generates ellipsoidal (in cross
##  section) tubes that follows a polyline. The input is a vtkPolyData with
##  polylines that have associated vector point data. The vector data represents
##  the uncertainty of the polyline in the x-y-z directions.
##
##  @warning
##  The vector uncertainty values define an axis-aligned ellipsoid at each
##  polyline point. The uncertainty tubes can be envisioned as the
##  interpolation of these ellipsoids between the points defining the
##  polyline (or rather, the interpolation of the cross section of the
##  ellipsoids along the polyline).
##
##  @sa
##  vtkTensorGlyph vtkStreamTracer
##

## !!!Ignored construct:  # vtkUncertaintyTubeFilter_h [NewLine] # vtkUncertaintyTubeFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkTubeArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkUncertaintyTubeFilter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for printing and obtaining type information for instances of this class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUncertaintyTubeFilter :: IsTypeOf ( type ) ; } static vtkUncertaintyTubeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUncertaintyTubeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUncertaintyTubeFilter * NewInstance ( ) const { return vtkUncertaintyTubeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUncertaintyTubeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUncertaintyTubeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Object factory method to instantiate this class.
##  static vtkUncertaintyTubeFilter * New ( ) ; /@{ *
##  Set / get the number of sides for the tube. At a minimum,
##  the number of sides is 3.
##  virtual void SetNumberOfSides ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfSides  to  << _arg ) ; if ( this -> NumberOfSides != ( _arg < 3 ? 3 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfSides = ( _arg < 3 ? 3 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNumberOfSidesMinValue ( ) { return 3 ; } virtual int GetNumberOfSidesMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetNumberOfSides ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSides  of  << this -> NumberOfSides ) ; return this -> NumberOfSides ; } ; /@} protected : vtkUncertaintyTubeFilter ( ) ; ~ vtkUncertaintyTubeFilter ( ) override ;  Integrate data int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int BuildTubes ( vtkPointData * pd , vtkPointData * outPD , vtkCellData * cd , vtkCellData * outCD , vtkPolyData * output ) ;  array of uncertainty tubes vtkTubeArray * Tubes ; int NumberOfTubes ;  number of sides of tube int NumberOfSides ; private : vtkUncertaintyTubeFilter ( const vtkUncertaintyTubeFilter & ) = delete ; void operator = ( const vtkUncertaintyTubeFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

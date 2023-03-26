## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuantizePolyDataPoints.h
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
##  @class   vtkQuantizePolyDataPoints
##  @brief   quantizes x,y,z coordinates of points
##
##  vtkQuantizePolyDataPoints is a subclass of vtkCleanPolyData and
##  inherits the functionality of vtkCleanPolyData with the addition that
##  it quantizes the point coordinates before inserting into the point list.
##  The user should set QFactor to a positive value (0.25 by default) and all
##  {x,y,z} coordinates will be quantized to that grain size.
##
##  A tolerance of zero is expected, though positive values may be used, the
##  quantization will take place before the tolerance is applied.
##
##  @warning
##  Merging points can alter topology, including introducing non-manifold
##  forms. Handling of degenerate cells is controlled by switches in
##  vtkCleanPolyData.
##
##  @warning
##  If you wish to operate on a set of coordinates that has no cells, you must
##  add a vtkPolyVertex cell with all of the points to the PolyData
##  (or use a vtkVertexGlyphFilter) before using the vtkCleanPolyData filter.
##
##  @sa
##  vtkCleanPolyData
##

## !!!Ignored construct:  # vtkQuantizePolyDataPoints_h [NewLine] # vtkQuantizePolyDataPoints_h [NewLine] # vtkCleanPolyData.h [NewLine] # vtkFiltersGeneralModule.h  For export macro [NewLine] class VTKFILTERSGENERAL_EXPORT vtkQuantizePolyDataPoints : public vtkCleanPolyData { public : static vtkQuantizePolyDataPoints * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCleanPolyData Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCleanPolyData :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQuantizePolyDataPoints :: IsTypeOf ( type ) ; } static vtkQuantizePolyDataPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQuantizePolyDataPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQuantizePolyDataPoints * NewInstance ( ) const { return vtkQuantizePolyDataPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCleanPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuantizePolyDataPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuantizePolyDataPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify quantization grain size. Default is 0.25
##  virtual void SetQFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << QFactor  to  << _arg ) ; if ( this -> QFactor != ( _arg < 1E-5 ? 1E-5 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> QFactor = ( _arg < 1E-5 ? 1E-5 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetQFactorMinValue ( ) { return 1E-5 ; } virtual double GetQFactorMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetQFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << QFactor  of  << this -> QFactor ) ; return this -> QFactor ; } ; /@} *
##  Perform quantization on a point
##  void OperateOnPoint ( double in [ 3 ] , double out [ 3 ] ) override ; *
##  Perform quantization on bounds
##  void OperateOnBounds ( double in [ 6 ] , double out [ 6 ] ) override ; protected : vtkQuantizePolyDataPoints ( ) ; ~ vtkQuantizePolyDataPoints ( ) override = default ; double QFactor ; private : vtkQuantizePolyDataPoints ( const vtkQuantizePolyDataPoints & ) = delete ; void operator = ( const vtkQuantizePolyDataPoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

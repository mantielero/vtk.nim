## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFillHolesFilter.h
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
##  @class   vtkFillHolesFilter
##  @brief   identify and fill holes in meshes
##
##  vtkFillHolesFilter is a filter that identifies and fills holes in
##  input vtkPolyData meshes. Holes are identified by locating
##  boundary edges, linking them together into loops, and then
##  triangulating the resulting loops. Note that you can specify
##  an approximate limit to the size of the hole that can be filled.
##
##  @warning
##  Note that any mesh with boundary edges by definition has a
##  topological hole. This even includes a reactangular grid
##  (e.g., the output of vtkPlaneSource). In such situations, if
##  the outer hole is filled, retriangulation of the hole will cause
##  geometric overlap of the mesh. This can be prevented by using
##  the hole size instance variable to prevent the larger holes
##  from being triangulated.
##
##  @warning
##  Note this filter only operates on polygons and triangle strips.
##  Vertices and polylines are passed through untouched.
##

## !!!Ignored construct:  # vtkFillHolesFilter_h [NewLine] # vtkFillHolesFilter_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkAbstractTransform ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSMODELING_EXPORT vtkFillHolesFilter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiation, type information and printing.
##  static vtkFillHolesFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFillHolesFilter :: IsTypeOf ( type ) ; } static vtkFillHolesFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFillHolesFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFillHolesFilter * NewInstance ( ) const { return vtkFillHolesFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFillHolesFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFillHolesFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the maximum hole size to fill. This is represented as a radius
##  to the bounding circumsphere containing the hole.  Note that this is an
##  approximate area; the actual area cannot be computed without first
##  triangulating the hole.
##  virtual void SetHoleSize ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << HoleSize  to  << _arg ) ; if ( this -> HoleSize != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> HoleSize = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetHoleSizeMinValue ( ) { return 0.0 ; } virtual double GetHoleSizeMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetHoleSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HoleSize  of  << this -> HoleSize ) ; return this -> HoleSize ; } ; /@} protected : vtkFillHolesFilter ( ) ; ~ vtkFillHolesFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double HoleSize ; private : vtkFillHolesFilter ( const vtkFillHolesFilter & ) = delete ; void operator = ( const vtkFillHolesFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

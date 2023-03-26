## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNonLinearCell.h
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
##  @class   vtkNonLinearCell
##  @brief   abstract superclass for non-linear cells
##
##  vtkNonLinearCell is an abstract superclass for non-linear cell types.
##  Cells that are a direct subclass of vtkCell or vtkCell3D are linear;
##  cells that are a subclass of vtkNonLinearCell have non-linear interpolation
##  functions. Non-linear cells require special treatment when tessellating
##  or converting to graphics primitives. Note that the linearity of the cell
##  is a function of whether the cell needs tessellation, which does not
##  strictly correlate with interpolation order (e.g., vtkHexahedron has
##  non-linear interpolation functions (a product of three linear functions
##  in r-s-t) even thought vtkHexahedron is considered linear.)
##

## !!!Ignored construct:  # vtkNonLinearCell_h [NewLine] # vtkNonLinearCell_h [NewLine] # vtkCell.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkNonLinearCell : public vtkCell { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkNonLinearCell :: IsTypeOf ( type ) ; } static vtkNonLinearCell * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkNonLinearCell * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkNonLinearCell * NewInstance ( ) const { return vtkNonLinearCell :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNonLinearCell :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Non-linear cells require special treatment (tessellation) when
##  converting to graphics primitives (during mapping). The vtkCell
##  API IsLinear() is modified to indicate this requirement.
##  int IsLinear ( ) override { return 0 ; } protected : vtkNonLinearCell ( ) ; ~ vtkNonLinearCell ( ) override = default ; private : vtkNonLinearCell ( const vtkNonLinearCell & ) = delete ; void operator = ( const vtkNonLinearCell & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

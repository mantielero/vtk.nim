## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDensifyPolyData.h
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
##  @class   vtkDensifyPolyData
##  @brief   Densify the input by adding points at the
##  centroid
##
##
##  The filter takes any polygonal data as input and will tessellate cells that
##  are planar polygons present by fanning out triangles from its centroid.
##  Other cells are simply passed through to the output.  PointData, if present,
##  is interpolated via linear interpolation. CellData for any tessellated cell
##  is simply copied over from its parent cell. Planar polygons are assumed to
##  be convex. Funny things will happen if they are not.
##
##  The number of subdivisions can be controlled by the parameter
##  NumberOfSubdivisions.
##

## !!!Ignored construct:  # vtkDensifyPolyData_h [NewLine] # vtkDensifyPolyData_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkDensifyPolyData : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDensifyPolyData :: IsTypeOf ( type ) ; } static vtkDensifyPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDensifyPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDensifyPolyData * NewInstance ( ) const { return vtkDensifyPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDensifyPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDensifyPolyData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkDensifyPolyData * New ( ) ; /@{ *
##  Number of recursive subdivisions. Initial value is 1.
##  virtual void SetNumberOfSubdivisions ( unsigned int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfSubdivisions  to  << _arg ) ; if ( this -> NumberOfSubdivisions != _arg ) { this -> NumberOfSubdivisions = _arg ; this -> Modified ( ) ; } } ; virtual unsigned int GetNumberOfSubdivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSubdivisions  of  << this -> NumberOfSubdivisions ) ; return this -> NumberOfSubdivisions ; } ; /@} protected : vtkDensifyPolyData ( ) ; ~ vtkDensifyPolyData ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; unsigned int NumberOfSubdivisions ; private : int FillInputPortInformation ( int , vtkInformation * ) override ; vtkDensifyPolyData ( const vtkDensifyPolyData & ) = delete ; void operator = ( const vtkDensifyPolyData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

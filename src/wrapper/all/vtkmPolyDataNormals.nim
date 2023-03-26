## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkmPolyDataNormals.h
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
##  @class   vtkmPolyDataNormals
##  @brief   compute normals for polygonal mesh
##
##  vtkmPolyDataNormals is a filter that computes point and/or cell normals
##  for a polygonal mesh. The user specifies if they would like the point
##  and/or cell normals to be computed by setting the ComputeCellNormals
##  and ComputePointNormals flags.
##
##  The computed normals (a vtkFloatArray) are set to be the active normals
##  (using SetNormals()) of the PointData and/or the CellData (respectively)
##  of the output PolyData. The name of these arrays is "Normals".
##
##  The algorithm works by determining normals for each polygon and then
##  averaging them at shared points.
##
##  @warning
##  Normals are computed only for polygons and triangles. Normals are
##  not computed for lines, vertices, or triangle strips.
##
##  @sa
##  For high-performance rendering, you could use vtkmTriangleMeshPointNormals
##  if you know that you have a triangle mesh which does not require splitting
##  nor consistency check on the cell orientations.
##
##

## !!!Ignored construct:  # vtkmPolyDataNormals_h [NewLine] # vtkmPolyDataNormals_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h  for export macro # vtkPolyDataNormals.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmPolyDataNormals : public vtkPolyDataNormals { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataNormals Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataNormals :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmPolyDataNormals :: IsTypeOf ( type ) ; } static vtkmPolyDataNormals * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmPolyDataNormals * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmPolyDataNormals * NewInstance ( ) const { return vtkmPolyDataNormals :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmPolyDataNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmPolyDataNormals :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmPolyDataNormals * New ( ) ; /@{ *
##  When this flag is off (the default), then the computation will fall back
##  to the serial VTK version if VTK-m fails to run. When the flag is on,
##  the filter will generate an error if VTK-m fails to run. This is mostly
##  useful in testing to make sure the expected algorithm is run.
##  virtual vtkTypeBool GetForceVTKm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceVTKm  of  << this -> ForceVTKm ) ; return this -> ForceVTKm ; } ; virtual void SetForceVTKm ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForceVTKm  to  << _arg ) ; if ( this -> ForceVTKm != _arg ) { this -> ForceVTKm = _arg ; this -> Modified ( ) ; } } ; virtual void ForceVTKmOn ( ) { this -> SetForceVTKm ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ForceVTKmOff ( ) { this -> SetForceVTKm ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkmPolyDataNormals ( ) ; ~ vtkmPolyDataNormals ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool ForceVTKm = false ; private : vtkmPolyDataNormals ( const vtkmPolyDataNormals & ) = delete ; void operator = ( const vtkmPolyDataNormals & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

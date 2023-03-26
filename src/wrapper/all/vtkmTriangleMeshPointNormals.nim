## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkmTriangleMeshPointNormals.h
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
##  @class   vtkmTriangleMeshPointNormals
##  @brief   compute point normals for triangle mesh
##
##  vtkmTriangleMeshPointNormals is a filter that computes point normals for
##  a triangle mesh to enable high-performance rendering. It is a fast-path
##  version of the vtkmPolyDataNormals filter in order to be able to compute
##  normals for triangle meshes deforming rapidly.
##
##  The computed normals (a vtkFloatArray) are set to be the active normals
##  (using SetNormals()) of the PointData. The array name is "Normals".
##
##  The algorithm works by determining normals for each triangle and adding
##  these vectors to the triangle points. The resulting vectors at each
##  point are then normalized.
##
##  @warning
##  Normals are computed only for triangular polygons: the filter can not
##  handle meshes with other types of cells (Verts, Lines, Strips) or Polys
##  with the wrong number of components (not equal to 3).
##
##  @warning
##  Unlike the vtkPolyDataNormals filter, this filter does not apply any
##  splitting nor checks for cell orientation consistency in order to speed
##  up the computation. Moreover, normals are not calculated the exact same
##  way as the vtkPolyDataNormals filter since the triangle normals are not
##  normalized before being added to the point normals: those cell normals
##  are therefore weighted by the triangle area. This is not more nor less
##  correct than normalizing them before adding them, but it is much faster.
##
##

## !!!Ignored construct:  # vtkmTriangleMeshPointNormals_h [NewLine] # vtkmTriangleMeshPointNormals_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h  for export macro # vtkTriangleMeshPointNormals.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmTriangleMeshPointNormals : public vtkTriangleMeshPointNormals { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTriangleMeshPointNormals Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTriangleMeshPointNormals :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmTriangleMeshPointNormals :: IsTypeOf ( type ) ; } static vtkmTriangleMeshPointNormals * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmTriangleMeshPointNormals * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmTriangleMeshPointNormals * NewInstance ( ) const { return vtkmTriangleMeshPointNormals :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTriangleMeshPointNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmTriangleMeshPointNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmTriangleMeshPointNormals :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmTriangleMeshPointNormals * New ( ) ; /@{ *
##  When this flag is off (the default), then the computation will fall back
##  to the serial VTK version if VTK-m fails to run. When the flag is on,
##  the filter will generate an error if VTK-m fails to run. This is mostly
##  useful in testing to make sure the expected algorithm is run.
##  virtual vtkTypeBool GetForceVTKm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceVTKm  of  << this -> ForceVTKm ) ; return this -> ForceVTKm ; } ; virtual void SetForceVTKm ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForceVTKm  to  << _arg ) ; if ( this -> ForceVTKm != _arg ) { this -> ForceVTKm = _arg ; this -> Modified ( ) ; } } ; virtual void ForceVTKmOn ( ) { this -> SetForceVTKm ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ForceVTKmOff ( ) { this -> SetForceVTKm ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkmTriangleMeshPointNormals ( ) ; ~ vtkmTriangleMeshPointNormals ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool ForceVTKm = false ; private : vtkmTriangleMeshPointNormals ( const vtkmTriangleMeshPointNormals & ) = delete ; void operator = ( const vtkmTriangleMeshPointNormals & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

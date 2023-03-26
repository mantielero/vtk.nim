## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWebGLPolyData.h
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
##  @class   vtkWebGLPolyData
##  @brief   PolyData representation for WebGL.
##

## !!!Ignored construct:  # vtkWebGLPolyData_h [NewLine] # vtkWebGLPolyData_h [NewLine] # vtkWebGLExporterModule.h  needed for export macro # vtkWebGLObject.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkMapper"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkTriangleFilter"
## !!!Ignored construct:  class VTKWEBGLEXPORTER_EXPORT vtkWebGLPolyData : public vtkWebGLObject { public : static vtkWebGLPolyData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWebGLObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWebGLObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkWebGLPolyData :: IsTypeOf ( type ) ; } static vtkWebGLPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkWebGLPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkWebGLPolyData * NewInstance ( ) const { return vtkWebGLPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWebGLObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWebGLPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWebGLPolyData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void GenerateBinaryData ( ) override ; unsigned char * GetBinaryData ( int part ) override ; int GetBinarySize ( int part ) override ; int GetNumberOfParts ( ) override ; void GetPoints ( vtkTriangleFilter * polydata , vtkActor * actor , int maxSize ) ; void GetLinesFromPolygon ( vtkMapper * mapper , vtkActor * actor , int lineMaxSize , double * edgeColor ) ; void GetLines ( vtkTriangleFilter * polydata , vtkActor * actor , int lineMaxSize ) ; void GetColorsFromPolyData ( unsigned char * color , vtkPolyData * polydata , vtkActor * actor ) ;  Get following data from the actor void GetPolygonsFromPointData ( vtkTriangleFilter * polydata , vtkActor * actor , int maxSize ) ; void GetPolygonsFromCellData ( vtkTriangleFilter * polydata , vtkActor * actor , int maxSize ) ; void GetColorsFromPointData ( unsigned char * color , vtkPointData * pointdata , vtkPolyData * polydata , vtkActor * actor ) ; void SetMesh ( float * _vertices , int _numberOfVertices , int * _index , int _numberOfIndexes , float * _normals , unsigned char * _colors , float * _tcoords , int maxSize ) ; void SetLine ( float * _points , int _numberOfPoints , int * _index , int _numberOfIndex , unsigned char * _colors , int maxSize ) ; void SetPoints ( float * points , int numberOfPoints , unsigned char * colors , int maxSize ) ; void SetTransformationMatrix ( vtkMatrix4x4 * m ) ; protected : vtkWebGLPolyData ( ) ; ~ vtkWebGLPolyData ( ) override ; private : vtkWebGLPolyData ( const vtkWebGLPolyData & ) = delete ; void operator = ( const vtkWebGLPolyData & ) = delete ; class vtkInternal ; vtkInternal * Internal ; } ;
## Error: token expected: ; but got: [identifier]!!!

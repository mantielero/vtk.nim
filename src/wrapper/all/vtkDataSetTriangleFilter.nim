## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetTriangleFilter.h
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
##  @class   vtkDataSetTriangleFilter
##  @brief   triangulate any type of dataset
##
##  vtkDataSetTriangleFilter generates n-dimensional simplices from any input
##  dataset. That is, 3D cells are converted to tetrahedral meshes, 2D cells
##  to triangles, and so on. The triangulation is guaranteed to be compatible.
##
##  This filter uses simple 1D and 2D triangulation techniques for cells
##  that are of topological dimension 2 or less. For 3D cells--due to the
##  issue of face compatibility across quadrilateral faces (which way to
##  orient the diagonal?)--a fancier ordered Delaunay triangulation is used.
##  This approach produces templates on the fly for triangulating the
##  cells. The templates are then used to do the actual triangulation.
##
##  @sa
##  vtkOrderedTriangulator vtkTriangleFilter
##

## !!!Ignored construct:  # vtkDataSetTriangleFilter_h [NewLine] # vtkDataSetTriangleFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkOrderedTriangulator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkDataSetTriangleFilter : public vtkUnstructuredGridAlgorithm { public : static vtkDataSetTriangleFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataSetTriangleFilter :: IsTypeOf ( type ) ; } static vtkDataSetTriangleFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataSetTriangleFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataSetTriangleFilter * NewInstance ( ) const { return vtkDataSetTriangleFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetTriangleFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetTriangleFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  When On this filter will cull all 1D and 2D cells from the output.
##  The default is Off.
##  virtual void SetTetrahedraOnly ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TetrahedraOnly  to  << _arg ) ; if ( this -> TetrahedraOnly != _arg ) { this -> TetrahedraOnly = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTetrahedraOnly ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TetrahedraOnly  of  << this -> TetrahedraOnly ) ; return this -> TetrahedraOnly ; } ; virtual void TetrahedraOnlyOn ( ) { this -> SetTetrahedraOnly ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TetrahedraOnlyOff ( ) { this -> SetTetrahedraOnly ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkDataSetTriangleFilter ( ) ; ~ vtkDataSetTriangleFilter ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ;  Used to triangulate 3D cells vtkOrderedTriangulator * Triangulator ;  Different execute methods depending on whether input is structured or not void StructuredExecute ( vtkDataSet * , vtkUnstructuredGrid * ) ; void UnstructuredExecute ( vtkDataSet * , vtkUnstructuredGrid * ) ; vtkTypeBool TetrahedraOnly ; private : vtkDataSetTriangleFilter ( const vtkDataSetTriangleFilter & ) = delete ; void operator = ( const vtkDataSetTriangleFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

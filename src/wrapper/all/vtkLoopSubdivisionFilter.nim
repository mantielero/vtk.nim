## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLoopSubdivisionFilter.h
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
##  @class   vtkLoopSubdivisionFilter
##  @brief   generate a subdivision surface using the Loop Scheme
##
##  vtkLoopSubdivisionFilter is an approximating subdivision scheme that
##  creates four new triangles for each triangle in the mesh. The user can
##  specify the NumberOfSubdivisions. Loop's subdivision scheme is
##  described in: Loop, C., "Smooth Subdivision surfaces based on
##  triangles,", Masters Thesis, University of Utah, August 1987.
##  For a nice summary of the technique see, Hoppe, H., et. al,
##  "Piecewise Smooth Surface Reconstruction,:, Proceedings of Siggraph 94
##  (Orlando, Florida, July 24-29, 1994). In Computer Graphics
##  Proceedings, Annual Conference Series, 1994, ACM SIGGRAPH,
##  pp. 295-302.
##  <P>
##  The filter only operates on triangles. Users should use the
##  vtkTriangleFilter to triangulate meshes that contain polygons or
##  triangle strips.
##  <P>
##  The filter approximates point data using the same scheme. New
##  triangles create at a subdivision step will have the cell data of
##  their parent cell.
##
##  @par Thanks:
##  This work was supported by PHS Research Grant No. 1 P41 RR13218-01
##  from the National Center for Research Resources.
##
##  @sa
##  vtkApproximatingSubdivisionFilter
##

## !!!Ignored construct:  # vtkLoopSubdivisionFilter_h [NewLine] # vtkLoopSubdivisionFilter_h [NewLine] # vtkApproximatingSubdivisionFilter.h [NewLine] # vtkFiltersModelingModule.h  For export macro [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIntArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkIdList"
## !!!Ignored construct:  class VTKFILTERSMODELING_EXPORT vtkLoopSubdivisionFilter : public vtkApproximatingSubdivisionFilter { public : /@{ *
##  Construct object with NumberOfSubdivisions set to 1.
##  static vtkLoopSubdivisionFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkApproximatingSubdivisionFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkApproximatingSubdivisionFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLoopSubdivisionFilter :: IsTypeOf ( type ) ; } static vtkLoopSubdivisionFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLoopSubdivisionFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLoopSubdivisionFilter * NewInstance ( ) const { return vtkLoopSubdivisionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkApproximatingSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLoopSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLoopSubdivisionFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} protected : vtkLoopSubdivisionFilter ( ) = default ; ~ vtkLoopSubdivisionFilter ( ) override = default ; int GenerateSubdivisionPoints ( vtkPolyData * inputDS , vtkIntArray * edgeData , vtkPoints * outputPts , vtkPointData * outputPD ) override ; int GenerateEvenStencil ( vtkIdType p1 , vtkPolyData * polys , vtkIdList * stencilIds , double * weights ) ; void GenerateOddStencil ( vtkIdType p1 , vtkIdType p2 , vtkPolyData * polys , vtkIdList * stencilIds , double * weights ) ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkLoopSubdivisionFilter ( const vtkLoopSubdivisionFilter & ) = delete ; void operator = ( const vtkLoopSubdivisionFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

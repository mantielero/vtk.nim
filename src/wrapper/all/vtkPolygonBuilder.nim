## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolygonBuilder.h
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
##  @class   vtkPolygonBuilder
##
##
##   The polygon output is the boundary of the union of the triangles.
##   It is assumed that the input triangles form a simple polygon. It is
##   currently used to compute polygons for slicing.
##
##

## !!!Ignored construct:  # vtkPolygonBuilder_h [NewLine] # vtkPolygonBuilder_h [NewLine] # vtkCommonMiscModule.h  For export macro # vtkIdList.h [NewLine] # vtkObject.h [NewLine] # vtkType.h for basic types # < cstddef > for size_t # < map > for private data members # < utility > for private data members # < vector >  for private data members [NewLine] class vtkIdListCollection ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONMISC_EXPORT vtkPolygonBuilder { public : vtkPolygonBuilder ( ) ; *
##  Insert a triangle as a triplet of point IDs.
##  void InsertTriangle ( const vtkIdType * abc ) ; *
##  Populate polys with lists of polygons, defined as sequential external
##  vertices. It is the responsibility of the user to delete these generated
##  lists in order to avoid memory leaks.
##  void GetPolygons ( vtkIdListCollection * polys ) ; *
##  Prepare the builder for a new set of inputs.
##  void Reset ( ) ; private : typedef std :: pair < vtkIdType , vtkIdType > Edge ; typedef std :: map < Edge , size_t > EdgeHistogram ; typedef std :: multimap < vtkIdType , vtkIdType > EdgeMap ; typedef std :: vector < vtkIdType > Triangle ; typedef std :: vector < Triangle > Triangles ; typedef std :: map < vtkIdType , Triangles > TriangleMap ; TriangleMap Tris ; EdgeHistogram EdgeCounter ; EdgeMap Edges ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkPolygonBuilder.h

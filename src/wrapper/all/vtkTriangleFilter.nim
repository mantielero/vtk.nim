## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTriangleFilter.h
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
##  @class   vtkTriangleFilter
##  @brief   convert input polygons and strips to triangles
##
##  vtkTriangleFilter generates triangles from input polygons and triangle
##  strips.  It also generates line segments from polylines unless PassLines
##  is off, and generates individual vertex cells from vtkVertex point lists
##  unless PassVerts is off.
##

## !!!Ignored construct:  # vtkTriangleFilter_h [NewLine] # vtkTriangleFilter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkTriangleFilter : public vtkPolyDataAlgorithm { public : static vtkTriangleFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTriangleFilter :: IsTypeOf ( type ) ; } static vtkTriangleFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTriangleFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTriangleFilter * NewInstance ( ) const { return vtkTriangleFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTriangleFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTriangleFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Turn on/off passing vertices through filter (default: on).
##  If this is on, then the input vertex cells will be broken
##  into individual vertex cells (one point per cell).  If it
##  is off, the input vertex cells will be ignored.
##  virtual void PassVertsOn ( ) { this -> SetPassVerts ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassVertsOff ( ) { this -> SetPassVerts ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetPassVerts ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassVerts  to  << _arg ) ; if ( this -> PassVerts != _arg ) { this -> PassVerts = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPassVerts ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassVerts  of  << this -> PassVerts ) ; return this -> PassVerts ; } ; /@} /@{ *
##  Turn on/off passing lines through filter (default: on).
##  If this is on, then the input polylines will be broken
##  into line segments.  If it is off, then the input lines
##  will be ignored and the output will have no lines.
##  virtual void PassLinesOn ( ) { this -> SetPassVertsPassLines ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassLinesOff ( ) { this -> SetPassVertsPassLines ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetPassVertsPassLines ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassLines  to  << _arg ) ; if ( this -> PassLines != _arg ) { this -> PassLines = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPassVertsPassLines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassLines  of  << this -> PassLines ) ; return this -> PassLines ; } ; /@} /@{ *
##  Optionally specify the polygon triangulation tolerance to use.  This
##  simply passes the tolerance to the internal vtkPolygon::Tolerance used
##  for triangulation of polygons.  This is for advanced usage, and
##  generally does not need to be set unless tessellation of n-sided
##  polygons with n>4 is required, and special accuracy requirements are
##  needed.  Note that by default if a value <=0 is specified, then the
##  default vtkPolygon::Tolerance is used.
##  virtual void SetPassVertsPassLinesTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetPassVertsPassLinesTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} protected : vtkTriangleFilter ( ) : PassVerts ( 1 ) , PassLines ( 1 ) , Tolerance ( - 1.0 )  use default vtkPolygon::Tolerance { } ~ vtkTriangleFilter ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool PassVerts ; vtkTypeBool PassLines ; double Tolerance ; private : vtkTriangleFilter ( const vtkTriangleFilter & ) = delete ; void operator = ( const vtkTriangleFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellValidator.h
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
##  @class   vtkCellValidator
##  @brief   validates cells in a dataset
##
##
##  vtkCellValidator accepts as input a dataset and adds integral cell data
##  to it corresponding to the "validity" of each cell. The validity field
##  encodes a bitfield for identifying problems that prevent a cell from standard
##  use, including:
##
##    WrongNumberOfPoints: filters assume that a cell has access to the
##                         appropriate number of points that comprise it. This
##                         assumption is often tacit, resulting in unexpected
##                         behavior when the condition is not met. This check
##                         simply confirms that the cell has the minimum number
##                         of points needed to describe it.
##
##    IntersectingEdges: cells that incorrectly describe the order of their
##                       points often manifest with intersecting edges or
##                       intersecting faces. Given a tolerance, this check
##                       ensures that two edges from a two-dimensional cell
##                       are separated by at least the tolerance (discounting
##                       end-to-end connections).
##
##    IntersectingFaces: cells that incorrectly describe the order of their
##                       points often manifest with intersecting edges or
##                       intersecting faces. Given a tolerance, this check
##                       ensures that two faces from a three-dimensional cell
##                       do not intersect.
##
##    NoncontiguousEdges: another symptom of incorrect point ordering within a
##                        cell is the presence of noncontiguous edges where
##                        contiguous edges are otherwise expected. Given a
##                        tolerance, this check ensures that edges around the
##                        perimeter of a two-dimensional cell are contiguous.
##
##    Nonconvex: many algorithms implicitly require that all input three-
##               dimensional cells be convex. This check uses the generic
##               convexity checkers implemented in vtkPolygon and vtkPolyhedron
##               to test this requirement.
##
##    FacesAreOrientedIncorrectly: All three-dimensional cells have an implicit
##                                 expectation for the orientation of their
##                                 faces. While the convention is unfortunately
##                                 inconsistent across cell types, it is usually
##                                 required that cell faces point outward. This
##                                 check tests that the faces of a cell point in
##                                 the direction required by the cell type,
##                                 taking into account the cell types with
##                                 nonstandard orientation requirements.
##
##
##  @sa
##  vtkCellQuality
##

## !!!Ignored construct:  # vtkCellValidator_h [NewLine] # vtkCellValidator_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersGeneralModule.h  For export macro [NewLine] class vtkCell ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkGenericCell"
discard "forward decl of vtkEmptyCell"
discard "forward decl of vtkVertex"
discard "forward decl of vtkPolyVertex"
discard "forward decl of vtkLine"
discard "forward decl of vtkPolyLine"
discard "forward decl of vtkTriangle"
discard "forward decl of vtkTriangleStrip"
discard "forward decl of vtkPolygon"
discard "forward decl of vtkPixel"
discard "forward decl of vtkQuad"
discard "forward decl of vtkTetra"
discard "forward decl of vtkVoxel"
discard "forward decl of vtkHexahedron"
discard "forward decl of vtkWedge"
discard "forward decl of vtkPyramid"
discard "forward decl of vtkPentagonalPrism"
discard "forward decl of vtkHexagonalPrism"
discard "forward decl of vtkQuadraticEdge"
discard "forward decl of vtkQuadraticTriangle"
discard "forward decl of vtkQuadraticQuad"
discard "forward decl of vtkQuadraticPolygon"
discard "forward decl of vtkQuadraticTetra"
discard "forward decl of vtkQuadraticHexahedron"
discard "forward decl of vtkQuadraticWedge"
discard "forward decl of vtkQuadraticPyramid"
discard "forward decl of vtkBiQuadraticQuad"
discard "forward decl of vtkTriQuadraticHexahedron"
discard "forward decl of vtkTriQuadraticPyramid"
discard "forward decl of vtkQuadraticLinearQuad"
discard "forward decl of vtkQuadraticLinearWedge"
discard "forward decl of vtkBiQuadraticQuadraticWedge"
discard "forward decl of vtkBiQuadraticQuadraticHexahedron"
discard "forward decl of vtkBiQuadraticTriangle"
discard "forward decl of vtkCubicLine"
discard "forward decl of vtkConvexPointSet"
discard "forward decl of vtkPolyhedron"
discard "forward decl of vtkLagrangeCurve"
discard "forward decl of vtkLagrangeTriangle"
discard "forward decl of vtkLagrangeQuadrilateral"
discard "forward decl of vtkLagrangeTetra"
discard "forward decl of vtkLagrangeHexahedron"
discard "forward decl of vtkLagrangeWedge"
discard "forward decl of vtkBezierCurve"
discard "forward decl of vtkBezierTriangle"
discard "forward decl of vtkBezierQuadrilateral"
discard "forward decl of vtkBezierTetra"
discard "forward decl of vtkBezierHexahedron"
discard "forward decl of vtkBezierWedge"
## !!!Ignored construct:  class vtkCellValidator : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCellValidator :: IsTypeOf ( type ) ; } static vtkCellValidator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCellValidator * > [end of template] ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCellValidator * NewInstance ( ) const { return vtkCellValidator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellValidator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellValidator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Description:
##  Construct to compute the validity of cells. static vtkCellValidator * New ( ) ; enum State : short { Valid = 0x0 , WrongNumberOfPoints = 0x01 , IntersectingEdges = 0x02 , IntersectingFaces = 0x04 , NoncontiguousEdges = 0x08 , Nonconvex = 0x10 , FacesAreOrientedIncorrectly = 0x20 , } ; friend inline State operator & ( State a , State b ) { return static_cast < State > ( static_cast < short > ( a ) & static_cast < short > ( b ) ) ; } friend inline State operator | ( State a , State b ) { return static_cast < State > ( static_cast < short > ( a ) | static_cast < short > ( b ) ) ; } friend inline State & operator &= ( State & a , State b ) { return a = a & b ; } friend inline State & operator |= ( State & a , State b ) { return a = a | b ; } static void PrintState ( State state , ostream & os , vtkIndent indent ) ; static State Check ( vtkGenericCell * , double tolerance ) ; static State Check ( vtkCell * , double tolerance ) ; static State Check ( vtkEmptyCell * , double tolerance ) ; static State Check ( vtkVertex * , double tolerance ) ; static State Check ( vtkPolyVertex * , double tolerance ) ; static State Check ( vtkLine * , double tolerance ) ; static State Check ( vtkPolyLine * , double tolerance ) ; static State Check ( vtkTriangle * , double tolerance ) ; static State Check ( vtkTriangleStrip * , double tolerance ) ; static State Check ( vtkPolygon * , double tolerance ) ; static State Check ( vtkPixel * , double tolerance ) ; static State Check ( vtkQuad * , double tolerance ) ; static State Check ( vtkTetra * , double tolerance ) ; static State Check ( vtkVoxel * , double tolerance ) ; static State Check ( vtkHexahedron * , double tolerance ) ; static State Check ( vtkWedge * , double tolerance ) ; static State Check ( vtkPyramid * , double tolerance ) ; static State Check ( vtkPentagonalPrism * , double tolerance ) ; static State Check ( vtkHexagonalPrism * , double tolerance ) ; static State Check ( vtkQuadraticEdge * , double tolerance ) ; static State Check ( vtkQuadraticTriangle * , double tolerance ) ; static State Check ( vtkQuadraticQuad * , double tolerance ) ; static State Check ( vtkQuadraticPolygon * , double tolerance ) ; static State Check ( vtkQuadraticTetra * , double tolerance ) ; static State Check ( vtkQuadraticHexahedron * , double tolerance ) ; static State Check ( vtkQuadraticWedge * , double tolerance ) ; static State Check ( vtkQuadraticPyramid * , double tolerance ) ; static State Check ( vtkBiQuadraticQuad * , double tolerance ) ; static State Check ( vtkTriQuadraticHexahedron * , double tolerance ) ; static State Check ( vtkTriQuadraticPyramid * , double tolerance ) ; static State Check ( vtkQuadraticLinearQuad * , double tolerance ) ; static State Check ( vtkQuadraticLinearWedge * , double tolerance ) ; static State Check ( vtkBiQuadraticQuadraticWedge * , double tolerance ) ; static State Check ( vtkBiQuadraticQuadraticHexahedron * , double tolerance ) ; static State Check ( vtkBiQuadraticTriangle * , double tolerance ) ; static State Check ( vtkCubicLine * , double tolerance ) ; static State Check ( vtkConvexPointSet * , double tolerance ) ; static State Check ( vtkPolyhedron * , double tolerance ) ; static State Check ( vtkLagrangeCurve * , double tolerance ) ; static State Check ( vtkLagrangeTriangle * , double tolerance ) ; static State Check ( vtkLagrangeQuadrilateral * , double tolerance ) ; static State Check ( vtkLagrangeTetra * , double tolerance ) ; static State Check ( vtkLagrangeHexahedron * , double tolerance ) ; static State Check ( vtkLagrangeWedge * , double tolerance ) ; static State Check ( vtkBezierCurve * , double tolerance ) ; static State Check ( vtkBezierTriangle * , double tolerance ) ; static State Check ( vtkBezierQuadrilateral * , double tolerance ) ; static State Check ( vtkBezierTetra * , double tolerance ) ; static State Check ( vtkBezierHexahedron * , double tolerance ) ; static State Check ( vtkBezierWedge * , double tolerance ) ; /@{ *
##  Set/Get the tolerance. This value is used as an epsilon for floating point
##  equality checks throughout the cell checking process. The default value is
##  FLT_EPSILON.
##  virtual void SetTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Tolerance  to  << _arg ) ; if ( this -> Tolerance != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Tolerance = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetToleranceMinValue ( ) { return 0.0 ; } virtual double GetToleranceMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} protected : vtkCellValidator ( ) ; ~ vtkCellValidator ( ) override = default ; double Tolerance ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; static bool NoIntersectingEdges ( vtkCell * cell , double tolerance ) ; static bool NoIntersectingFaces ( vtkCell * cell , double tolerance ) ; static bool ContiguousEdges ( vtkCell * twoDimensionalCell , double tolerance ) ; static bool Convex ( vtkCell * cell , double tolerance ) ; static bool FacesAreOrientedCorrectly ( vtkCell * threeDimensionalCell , double tolerance ) ; private : vtkCellValidator ( const vtkCellValidator & ) = delete ; void operator = ( const vtkCellValidator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

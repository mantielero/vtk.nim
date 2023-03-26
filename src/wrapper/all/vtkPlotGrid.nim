## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotGrid.h
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
##  @class   vtkPlotGrid
##  @brief   takes care of drawing the plot grid
##
##
##  The vtkPlotGrid is drawn in screen coordinates. It is usually one of the
##  first elements of a chart to be drawn, and will generally be obscured
##  by all other elements of the chart. It builds up its own plot locations
##  from the parameters of the x and y axis of the plot.
##

## !!!Ignored construct:  # vtkPlotGrid_h [NewLine] # vtkPlotGrid_h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkContextItem.h [NewLine] class vtkStdString ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkContext2D"
discard "forward decl of vtkPoints2D"
discard "forward decl of vtkAxis"
## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkPlotGrid : public vtkContextItem { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkContextItem Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkContextItem :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPlotGrid :: IsTypeOf ( type ) ; } static vtkPlotGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPlotGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPlotGrid * NewInstance ( ) const { return vtkPlotGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates a 2D Chart object.
##  static vtkPlotGrid * New ( ) ; *
##  Set the X axis of the grid.
##  virtual void SetXAxis ( vtkAxis * axis ) ; *
##  Set the X axis of the grid.
##  virtual void SetYAxis ( vtkAxis * axis ) ; *
##  Paint event for the axis, called whenever the axis needs to be drawn
##  bool Paint ( vtkContext2D * painter ) override ; protected : vtkPlotGrid ( ) ; ~ vtkPlotGrid ( ) override ; /@{ *
##  The vtkAxis objects are used to figure out where the grid lines should be
##  drawn.
##  vtkAxis * XAxis ; vtkAxis * YAxis ; /@} private : vtkPlotGrid ( const vtkPlotGrid & ) = delete ; void operator = ( const vtkPlotGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

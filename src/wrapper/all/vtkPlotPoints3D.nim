## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotPoints3D.h
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
##  @class   vtkPlotPoints3D
##  @brief   3D scatter plot.
##
##
##  3D scatter plot.
##
##  @sa
##  vtkPlotLine3D
##  vtkPlotPoints
##
##

## !!!Ignored construct:  # vtkPlotPoints3D_h [NewLine] # vtkPlotPoints3D_h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkPlot3D.h [NewLine] class vtkContext2D ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkPlotPoints3D : public vtkPlot3D { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPlot3D Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPlot3D :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPlotPoints3D :: IsTypeOf ( type ) ; } static vtkPlotPoints3D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPlotPoints3D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPlotPoints3D * NewInstance ( ) const { return vtkPlotPoints3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotPoints3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotPoints3D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPlotPoints3D * New ( ) ; *
##  Paint event for the XY plot, called whenever the chart needs to be drawn
##  bool Paint ( vtkContext2D * painter ) override ; protected : vtkPlotPoints3D ( ) ; ~ vtkPlotPoints3D ( ) override ; *
##  The selected points.
##  std :: vector < vtkVector3f > SelectedPoints ; *
##  The selected points.
##  vtkTimeStamp SelectedPointsBuildTime ; private : vtkPlotPoints3D ( const vtkPlotPoints3D & ) = delete ; void operator = ( const vtkPlotPoints3D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

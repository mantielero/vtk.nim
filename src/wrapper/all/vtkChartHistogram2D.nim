## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkChart2DHistogram.h
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
##  @class   vtkChart2DHistogram
##  @brief   Chart for 2D histograms.
##
##
##  This defines the interface for a 2D histogram chart.
##

## !!!Ignored construct:  # vtkChartHistogram2D_h [NewLine] # vtkChartHistogram2D_h [NewLine] # vtkChartXY.h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkSmartPointer.h  For SP ivars [NewLine] class vtkColorLegend ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPlotHistogram2D"
discard "forward decl of vtkImageData"
discard "forward decl of vtkScalarsToColors"
## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkChartHistogram2D : public vtkChartXY { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkChartXY Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkChartXY :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkChartHistogram2D :: IsTypeOf ( type ) ; } static vtkChartHistogram2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkChartHistogram2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkChartHistogram2D * NewInstance ( ) const { return vtkChartHistogram2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkChartXY :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkChartHistogram2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkChartHistogram2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates a 2D histogram chart
##  static vtkChartHistogram2D * New ( ) ; *
##  Perform any updates to the item that may be necessary before rendering.
##  The scene should take care of calling this on all items before their
##  Paint function is invoked.
##  void Update ( ) override ; virtual void SetInputData ( vtkImageData * data , vtkIdType z = 0 ) ; virtual void SetTransferFunction ( vtkScalarsToColors * function ) ; *
##  Return true if the supplied x, y coordinate is inside the item.
##  bool Hit ( const vtkContextMouseEvent & mouse ) override ; *
##  Get the plot at the specified index, returns null if the index is invalid.
##  vtkPlot * GetPlot ( vtkIdType index ) override ; protected : vtkChartHistogram2D ( ) ; ~ vtkChartHistogram2D ( ) override ; vtkSmartPointer < vtkPlotHistogram2D > Histogram ; *
##  The point cache is marked dirty until it has been initialized.
##  vtkTimeStamp BuildTime ; class Private ; Private * Storage ; bool UpdateLayout ( vtkContext2D * painter ) override ; private : vtkChartHistogram2D ( const vtkChartHistogram2D & ) = delete ; void operator = ( const vtkChartHistogram2D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

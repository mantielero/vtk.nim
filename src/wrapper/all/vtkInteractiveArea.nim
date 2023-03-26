## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractiveArea.h
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
##  @class   vtkInteractiveArea
##  @brief   Implements zooming and panning in a vtkContextArea.
##
##  Implements zooming and panning in a vtkContextArea.
##

## !!!Ignored construct:  # vtkInteractiveArea_h [NewLine] # vtkInteractiveArea_h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkContextArea.h [NewLine] # vtkNew.h  For vtkNew [NewLine] class vtkContextTransform ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkRectd"
## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkInteractiveArea : public vtkContextArea { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkContextArea Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkContextArea :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInteractiveArea :: IsTypeOf ( type ) ; } static vtkInteractiveArea * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInteractiveArea * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInteractiveArea * NewInstance ( ) const { return vtkInteractiveArea :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextArea :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractiveArea :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractiveArea :: New ( ) ; } public : ; static vtkInteractiveArea * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; //@{ *
##  \brief vtkAbstractContextItem API
##  bool Paint ( vtkContext2D * painter ) override ; bool Hit ( const vtkContextMouseEvent & mouse ) override ; bool MouseWheelEvent ( const vtkContextMouseEvent & mouse , int delta ) override ; bool MouseMoveEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseButtonPressEvent ( const vtkContextMouseEvent & mouse ) override ; //@} protected : vtkInteractiveArea ( ) ; ~ vtkInteractiveArea ( ) override ; //@{ *
##  \brief vtkContextArea API
##  void SetAxisRange ( vtkRectd const & data ) override ; private : *
##  Re-scale axis when interacting.
##  void RecalculateTickSpacing ( vtkAxis * axis , int const numClicks ) ; *
##  Re-computes the transformation expressing the current zoom, panning, etc.
##  void ComputeViewTransform ( ) override ; void ComputeZoom ( vtkVector2d const & origin , vtkVector2d & scale , vtkVector2d & shift , vtkVector2d & factor ) ; class MouseActions ; MouseActions * Actions ; vtkInteractiveArea ( const vtkInteractiveArea & ) = delete ; void operator = ( const vtkInteractiveArea & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

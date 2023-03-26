## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkConvexHull2D.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkConvexHull2D
##  @brief   Produce filled convex hulls around a set of points.
##
##
##  Produces a vtkPolyData comprised of a filled polygon of the convex hull
##  of the input points. You may alternatively choose to output a bounding
##  rectangle. Static methods are provided that calculate a (counter-clockwise)
##  hull based on a set of input points.
##
##  To help maintain the property of <i>guaranteed visibility</i> hulls may be
##  artificially scaled by setting MinHullSizeInWorld. This is particularly
##  helpful in the case that there are only one or two points as it avoids
##  producing a degenerate polygon. This setting is also available as an
##  argument to the static methods.
##
##  Setting a vtkRenderer on the filter enables the possibility to set
##  MinHullSizeInDisplay to the desired number of display pixels to cover in
##  each of the x- and y-dimensions.
##
##  Setting OutlineOn() additionally produces an outline of the hull on output
##  port 1.
##
##  @attention
##  This filter operates in the x,y-plane and as such works best with an
##  interactor style that does not permit camera rotation such as
##  vtkInteractorStyleRubberBand2D.
##
##  @par Thanks:
##  Thanks to Colin Myers, University of Leeds for providing this implementation.
##

## !!!Ignored construct:  # vtkConvexHull2D_h [NewLine] # vtkConvexHull2D_h [NewLine] # vtkPolyDataAlgorithm.h [NewLine] # vtkRenderingAnnotationModule.h  For export macro # vtkSmartPointer.h  needed for ivars [NewLine] class vtkCoordinate ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPoints"
discard "forward decl of vtkPolygon"
discard "forward decl of vtkPolyLine"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTransformPolyDataFilter"
## !!!Ignored construct:  class VTKRENDERINGANNOTATION_EXPORT vtkConvexHull2D : public vtkPolyDataAlgorithm { public : static vtkConvexHull2D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConvexHull2D :: IsTypeOf ( type ) ; } static vtkConvexHull2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConvexHull2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConvexHull2D * NewInstance ( ) const { return vtkConvexHull2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConvexHull2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConvexHull2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Scale the hull by the amount specified. Defaults to 1.0.
##  virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; virtual void SetScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != _arg ) { this -> ScaleFactor = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Produce an outline (polyline) of the hull on output port 1.
##  virtual bool GetScaleFactorOutline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Outline  of  << this -> Outline ) ; return this -> Outline ; } ; virtual void SetScaleFactorOutline ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Outline  to  << _arg ) ; if ( this -> Outline != _arg ) { this -> Outline = _arg ; this -> Modified ( ) ; } } ; virtual void OutlineOn ( ) { this -> SetOutline ( static_cast < bool > ( 1 ) ) ; } virtual void OutlineOff ( ) { this -> SetOutline ( static_cast < bool > ( 0 ) ) ; } ; /@} enum HullShapes { BoundingRectangle = 0 , ConvexHull } ; /@{ *
##  Set the shape of the hull to BoundingRectangle or ConvexHull.
##  virtual int GetScaleFactorOutlineHullShape ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HullShape  of  << this -> HullShape ) ; return this -> HullShape ; } ; virtual void SetHullShape ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << HullShape  to  << _arg ) ; if ( this -> HullShape != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> HullShape = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetHullShapeMinValue ( ) { return 0 ; } virtual int GetHullShapeMaxValue ( ) { return 1 ; } ; /@} /@{ *
##  Set the minimum x,y-dimensions of each hull in world coordinates. Defaults
##  to 1.0. Set to 0.0 to disable.
##  virtual void SetHullShapeMinHullSizeInWorld ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinHullSizeInWorld  to  << _arg ) ; if ( this -> MinHullSizeInWorld != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> MinHullSizeInWorld = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetHullShapeMinValueMinHullSizeInWorldMinValue ( ) { return 0.0 ; } virtual double GetHullShapeMaxValueMinHullSizeInWorldMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetScaleFactorOutlineHullShapeMinHullSizeInWorld ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinHullSizeInWorld  of  << this -> MinHullSizeInWorld ) ; return this -> MinHullSizeInWorld ; } ; /@} /@{ *
##  Set the minimum x,y-dimensions of each hull in pixels. You must also set a
##  vtkRenderer. Defaults to 1. Set to 0 to disable.
##  virtual void SetHullShapeMinHullSizeInWorldMinHullSizeInDisplay ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinHullSizeInDisplay  to  << _arg ) ; if ( this -> MinHullSizeInDisplay != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> MinHullSizeInDisplay = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetHullShapeMinValueMinHullSizeInWorldMinValueMinHullSizeInDisplayMinValue ( ) { return 0 ; } virtual int GetHullShapeMaxValueMinHullSizeInWorldMaxValueMinHullSizeInDisplayMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetScaleFactorOutlineHullShapeMinHullSizeInWorldMinHullSizeInDisplay ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinHullSizeInDisplay  of  << this -> MinHullSizeInDisplay ) ; return this -> MinHullSizeInDisplay ; } ; /@} /@{ *
##  Renderer needed for MinHullSizeInDisplay calculation. Not reference counted.
##  void SetRenderer ( vtkRenderer * renderer ) ; vtkRenderer * GetRenderer ( ) ; /@} *
##  The modified time of this filter.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Convenience methods to calculate a convex hull from a set of vtkPointS.
##  static void CalculateBoundingRectangle ( vtkPoints * inPoints , vtkPoints * outPoints , double minimumHullSize = 1.0 ) ; static void CalculateConvexHull ( vtkPoints * inPoints , vtkPoints * outPoints , double minimumHullSize = 1.0 ) ; /@} protected : vtkConvexHull2D ( ) ; ~ vtkConvexHull2D ( ) override ; *
##  This is called by the superclass. This is the method you should override.
##  int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkConvexHull2D ( const vtkConvexHull2D & ) = delete ; void operator = ( const vtkConvexHull2D & ) = delete ; void ResizeHullToMinimumInDisplay ( vtkPolyData * hullPolyData ) ; double ScaleFactor ; bool Outline ; int HullShape ; int MinHullSizeInDisplay ; double MinHullSizeInWorld ; vtkRenderer * Renderer ; vtkSmartPointer < vtkCoordinate > Coordinate ; vtkSmartPointer < vtkTransform > Transform ; vtkSmartPointer < vtkTransform > OutputTransform ; vtkSmartPointer < vtkTransformPolyDataFilter > OutputTransformFilter ; vtkSmartPointer < vtkPolyLine > OutlineSource ; vtkSmartPointer < vtkPolygon > HullSource ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractPolyDataGeometry.h
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
##  @class   vtkExtractPolyDataGeometry
##  @brief   extract vtkPolyData cells that lies either entirely inside or outside of a specified
##  implicit function
##
##
##  vtkExtractPolyDataGeometry extracts from its input vtkPolyData all cells
##  that are either completely inside or outside of a specified implicit
##  function. This filter is specialized to vtkPolyData. On output the
##  filter generates vtkPolyData.
##
##  To use this filter you must specify an implicit function. You must also
##  specify whether to extract cells laying inside or outside of the implicit
##  function. (The inside of an implicit function is the negative values
##  region.) An option exists to extract cells that are neither inside nor
##  outside (i.e., boundary).
##
##  Note that this filter also has the option to directly pass all points or cull
##  the points that do not satisfy the implicit function test. Passing all points
##  is a tad faster, but then points remain that do not pass the test and may mess
##  up subsequent glyphing operations and so on. By default points are culled.
##
##  A more general version of this filter is available for arbitrary
##  vtkDataSet input (see vtkExtractGeometry).
##
##  @sa
##  vtkExtractGeometry vtkClipPolyData vtkImplicitFunction
##

## !!!Ignored construct:  # vtkExtractPolyDataGeometry_h [NewLine] # vtkExtractPolyDataGeometry_h [NewLine] # vtkFiltersExtractionModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSEXTRACTION_EXPORT vtkExtractPolyDataGeometry : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractPolyDataGeometry :: IsTypeOf ( type ) ; } static vtkExtractPolyDataGeometry * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractPolyDataGeometry * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractPolyDataGeometry * NewInstance ( ) const { return vtkExtractPolyDataGeometry :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractPolyDataGeometry :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractPolyDataGeometry :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with ExtractInside turned on.
##  static vtkExtractPolyDataGeometry * New ( ) ; *
##  Return the MTime taking into account changes to the implicit function
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Specify the implicit function for inside/outside checks.
##  virtual void SetImplicitFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameImplicitFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ImplicitFunction  address  << static_cast < vtkImplicitFunction * > ( this -> ImplicitFunction ) ) ; return this -> ImplicitFunction ; } ; /@} /@{ *
##  Boolean controls whether to extract cells that are inside of implicit
##  function (ExtractInside == 1) or outside of implicit function
##  (ExtractInside == 0).
##  virtual void SetExtractInside ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtractInside  to  << _arg ) ; if ( this -> ExtractInside != _arg ) { this -> ExtractInside = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetExtractInside ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractInside  of  << this -> ExtractInside ) ; return this -> ExtractInside ; } ; virtual void ExtractInsideOn ( ) { this -> SetExtractInside ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ExtractInsideOff ( ) { this -> SetExtractInside ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Boolean controls whether to extract cells that are partially inside.
##  By default, ExtractBoundaryCells is off.
##  virtual void SetExtractInsideExtractBoundaryCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtractBoundaryCells  to  << _arg ) ; if ( this -> ExtractBoundaryCells != _arg ) { this -> ExtractBoundaryCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetExtractInsideExtractBoundaryCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractBoundaryCells  of  << this -> ExtractBoundaryCells ) ; return this -> ExtractBoundaryCells ; } ; virtual void ExtractBoundaryCellsOn ( ) { this -> SetExtractInsideExtractBoundaryCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ExtractBoundaryCellsOff ( ) { this -> SetExtractInsideExtractBoundaryCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Boolean controls whether points are culled or simply passed through
##  to the output.
##  virtual void SetExtractInsideExtractBoundaryCellsPassPoints ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassPoints  to  << _arg ) ; if ( this -> PassPoints != _arg ) { this -> PassPoints = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetExtractInsideExtractBoundaryCellsPassPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPoints  of  << this -> PassPoints ) ; return this -> PassPoints ; } ; virtual void PassPointsOn ( ) { this -> SetExtractInsideExtractBoundaryCellsPassPoints ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassPointsOff ( ) { this -> SetExtractInsideExtractBoundaryCellsPassPoints ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkExtractPolyDataGeometry ( vtkImplicitFunction * f = nullptr ) ; ~ vtkExtractPolyDataGeometry ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkImplicitFunction * ImplicitFunction ; vtkTypeBool ExtractInside ; vtkTypeBool ExtractBoundaryCells ; vtkTypeBool PassPoints ; vtkIdType InsertPointInMap ( vtkIdType i , vtkPoints * inPts , vtkPoints * newPts , vtkIdType * pointMap ) ; private : vtkExtractPolyDataGeometry ( const vtkExtractPolyDataGeometry & ) = delete ; void operator = ( const vtkExtractPolyDataGeometry & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## /@{
## *
##  When not passing points, have to use a point map to keep track of things.
##

proc InsertPointInMap*(i: vtkIdType; inPts: ptr vtkPoints; newPts: ptr vtkPoints;
                      pointMap: ptr vtkIdType): vtkIdType {.
    importcpp: "VTKFILTERSEXTRACTION_EXPORT::InsertPointInMap(@)",
    header: "vtkExtractPolyDataGeometry.h".}
## /@}

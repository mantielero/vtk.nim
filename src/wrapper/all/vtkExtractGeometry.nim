## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractGeometry.h
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
##  @class   vtkExtractGeometry
##  @brief   extract cells that lie either entirely inside or outside of a specified implicit
##  function
##
##
##  vtkExtractGeometry extracts from its input dataset all cells that are either
##  completely inside or outside of a specified implicit function. Any type of
##  dataset can be input to this filter. On output the filter generates an
##  unstructured grid.
##
##  To use this filter you must specify an implicit function. You must also
##  specify whether to extract cells laying inside or outside of the implicit
##  function. (The inside of an implicit function is the negative values
##  region.) An option exists to extract cells that are neither inside or
##  outside (i.e., boundary).
##
##  A more efficient version of this filter is available for vtkPolyData input.
##  See vtkExtractPolyDataGeometry.
##
##  @sa
##  vtkExtractPolyDataGeometry vtkGeometryFilter vtkExtractVOI
##

## !!!Ignored construct:  # vtkExtractGeometry_h [NewLine] # vtkExtractGeometry_h [NewLine] # vtkFiltersExtractionModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSEXTRACTION_EXPORT vtkExtractGeometry : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractGeometry :: IsTypeOf ( type ) ; } static vtkExtractGeometry * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractGeometry * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractGeometry * NewInstance ( ) const { return vtkExtractGeometry :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractGeometry :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractGeometry :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with ExtractInside turned on.
##  static vtkExtractGeometry * New ( ) ; *
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
##  virtual void SetExtractInsideExtractBoundaryCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtractBoundaryCells  to  << _arg ) ; if ( this -> ExtractBoundaryCells != _arg ) { this -> ExtractBoundaryCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetExtractInsideExtractBoundaryCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractBoundaryCells  of  << this -> ExtractBoundaryCells ) ; return this -> ExtractBoundaryCells ; } ; virtual void ExtractBoundaryCellsOn ( ) { this -> SetExtractInsideExtractBoundaryCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ExtractBoundaryCellsOff ( ) { this -> SetExtractInsideExtractBoundaryCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetExtractInsideExtractBoundaryCellsExtractOnlyBoundaryCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtractOnlyBoundaryCells  to  << _arg ) ; if ( this -> ExtractOnlyBoundaryCells != _arg ) { this -> ExtractOnlyBoundaryCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetExtractInsideExtractBoundaryCellsExtractOnlyBoundaryCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractOnlyBoundaryCells  of  << this -> ExtractOnlyBoundaryCells ) ; return this -> ExtractOnlyBoundaryCells ; } ; virtual void ExtractOnlyBoundaryCellsOn ( ) { this -> SetExtractInsideExtractBoundaryCellsExtractOnlyBoundaryCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ExtractOnlyBoundaryCellsOff ( ) { this -> SetExtractInsideExtractBoundaryCellsExtractOnlyBoundaryCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkExtractGeometry ( vtkImplicitFunction * f = nullptr ) ; ~ vtkExtractGeometry ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkImplicitFunction * ImplicitFunction ; vtkTypeBool ExtractInside ; vtkTypeBool ExtractBoundaryCells ; vtkTypeBool ExtractOnlyBoundaryCells ; private : vtkExtractGeometry ( const vtkExtractGeometry & ) = delete ; void operator = ( const vtkExtractGeometry & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

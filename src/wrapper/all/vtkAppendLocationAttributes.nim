## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAppendLocationAttributes.h
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
##  @class   vtkAppendLocationAttributes
##  @brief   add point locations to point data and/or cell centers cell data, respectively
##
##  vtkAppendLocationAttributes is a filter that takes as input any dataset and
##  optionally adds points as point data and optionally adds cell center locations as
##  cell data in the output. The center of a cell is its parametric center, not necessarily
##  the geometric or bounding box center. Point and cell attributes in the input can optionally
##  be copied to the output.
##
##  @note
##  Empty cells will have their center set to (0, 0, 0).
##
##  @sa
##  vtkCellCenters
##

## !!!Ignored construct:  # vtkAppendLocationAttributes_h [NewLine] # vtkAppendLocationAttributes_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkAppendLocationAttributes : public vtkPassInputTypeAlgorithm { public : static vtkAppendLocationAttributes * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAppendLocationAttributes :: IsTypeOf ( type ) ; } static vtkAppendLocationAttributes * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAppendLocationAttributes * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAppendLocationAttributes * NewInstance ( ) const { return vtkAppendLocationAttributes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAppendLocationAttributes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAppendLocationAttributes :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Enable/disable whether input point locations should be saved as a point data array.
##  Default is `true` i.e. the points will be propagated as a point data array named
##  "PointLocations".
##  virtual void SetAppendPointLocations ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AppendPointLocations  to  << _arg ) ; if ( this -> AppendPointLocations != _arg ) { this -> AppendPointLocations = _arg ; this -> Modified ( ) ; } } ; virtual bool GetAppendPointLocations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AppendPointLocations  of  << this -> AppendPointLocations ) ; return this -> AppendPointLocations ; } ; virtual void AppendPointLocationsOn ( ) { this -> SetAppendPointLocations ( static_cast < bool > ( 1 ) ) ; } virtual void AppendPointLocationsOff ( ) { this -> SetAppendPointLocations ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable whether input cell center locations should be saved as a cell data array.
##  Default is `true` i.e. the cell centers will be propagated as a cell data array named
##  "CellCenters".
##  virtual void SetAppendPointLocationsAppendCellCenters ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AppendCellCenters  to  << _arg ) ; if ( this -> AppendCellCenters != _arg ) { this -> AppendCellCenters = _arg ; this -> Modified ( ) ; } } ; virtual bool GetAppendPointLocationsAppendCellCenters ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AppendCellCenters  of  << this -> AppendCellCenters ) ; return this -> AppendCellCenters ; } ; virtual void AppendCellCentersOn ( ) { this -> SetAppendPointLocationsAppendCellCenters ( static_cast < bool > ( 1 ) ) ; } virtual void AppendCellCentersOff ( ) { this -> SetAppendPointLocationsAppendCellCenters ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkAppendLocationAttributes ( ) = default ; ~ vtkAppendLocationAttributes ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; bool AppendPointLocations = true ; bool AppendCellCenters = true ; private : vtkAppendLocationAttributes ( const vtkAppendLocationAttributes & ) = delete ; void operator = ( const vtkAppendLocationAttributes & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

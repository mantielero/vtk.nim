## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLinearToQuadraticCellsFilter.h
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
##  @class   vtkLinearToQuadraticCellsFilter
##  @brief   degree elevate the cells of a linear unstructured grid.
##
##
##  vtkLinearToQuadraticCellsFilter takes an unstructured grid comprised of
##  linear cells and degree elevates each of the cells to quadratic. Additional
##  points are simply interpolated from the existing points (there is no snapping
##  to an external model).
##

## !!!Ignored construct:  # vtkLinearToQuadraticCellsFilter_h [NewLine] # vtkLinearToQuadraticCellsFilter_h [NewLine] # vtkFiltersGeometryModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkIncrementalPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGEOMETRY_EXPORT vtkLinearToQuadraticCellsFilter : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLinearToQuadraticCellsFilter :: IsTypeOf ( type ) ; } static vtkLinearToQuadraticCellsFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLinearToQuadraticCellsFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLinearToQuadraticCellsFilter * NewInstance ( ) const { return vtkLinearToQuadraticCellsFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLinearToQuadraticCellsFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLinearToQuadraticCellsFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkLinearToQuadraticCellsFilter * New ( ) ; /@{ *
##  Specify a spatial locator for merging points. By default, an
##  instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified. The
##  locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  OutputPointsPrecision is DEFAULT_PRECISION by default.
##  virtual void SetOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} *
##  Return the mtime also considering the locator.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkLinearToQuadraticCellsFilter ( ) ; ~ vtkLinearToQuadraticCellsFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkIncrementalPointLocator * Locator ; int OutputPointsPrecision ; private : vtkLinearToQuadraticCellsFilter ( const vtkLinearToQuadraticCellsFilter & ) = delete ; void operator = ( const vtkLinearToQuadraticCellsFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

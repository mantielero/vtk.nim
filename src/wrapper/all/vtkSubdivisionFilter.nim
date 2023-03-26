## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSubdivisionFilter.h
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
##  @class   vtkSubdivisionFilter
##  @brief   base class for subvision filters
##
##  vtkSubdivisionFilter is an abstract class that defines
##  the protocol for subdivision surface filters.
##
##

## !!!Ignored construct:  # vtkSubdivisionFilter_h [NewLine] # vtkSubdivisionFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellData"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPointData"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkSubdivisionFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSubdivisionFilter :: IsTypeOf ( type ) ; } static vtkSubdivisionFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSubdivisionFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSubdivisionFilter * NewInstance ( ) const { return vtkSubdivisionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSubdivisionFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/get the number of subdivisions.
##  Default is 1.
##  virtual void SetNumberOfSubdivisions ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfSubdivisions  to  << _arg ) ; if ( this -> NumberOfSubdivisions != _arg ) { this -> NumberOfSubdivisions = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfSubdivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSubdivisions  of  << this -> NumberOfSubdivisions ) ; return this -> NumberOfSubdivisions ; } ; /@} /@{ *
##  Set/get CheckForTriangles
##  Should subdivision check that the dataset only contains triangles?
##  Default is On (1).
##  virtual void SetCheckForTriangles ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CheckForTriangles  to  << _arg ) ; if ( this -> CheckForTriangles != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> CheckForTriangles = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetCheckForTrianglesMinValue ( ) { return 0 ; } virtual vtkTypeBool GetCheckForTrianglesMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetNumberOfSubdivisionsCheckForTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CheckForTriangles  of  << this -> CheckForTriangles ) ; return this -> CheckForTriangles ; } ; virtual void CheckForTrianglesOn ( ) { this -> SetCheckForTriangles ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CheckForTrianglesOff ( ) { this -> SetCheckForTriangles ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkSubdivisionFilter ( ) ; ~ vtkSubdivisionFilter ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int NumberOfSubdivisions ; vtkTypeBool CheckForTriangles ; private : vtkSubdivisionFilter ( const vtkSubdivisionFilter & ) = delete ; void operator = ( const vtkSubdivisionFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

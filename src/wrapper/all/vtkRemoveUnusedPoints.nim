## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRemoveUnusedPoints.h
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
##  @class vtkRemoveUnusedPoints
##  @brief remove points not used by any cell.
##
##  vtkRemoveUnusedPoints is a filter that removes any points that are not used by the
##  cells. Currently, this filter only supports vtkUnstructuredGrid.
##

## !!!Ignored construct:  # vtkRemoveUnusedPoints_h [NewLine] # vtkRemoveUnusedPoints_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkRemoveUnusedPoints : public vtkUnstructuredGridAlgorithm { public : static vtkRemoveUnusedPoints * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRemoveUnusedPoints :: IsTypeOf ( type ) ; } static vtkRemoveUnusedPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRemoveUnusedPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRemoveUnusedPoints * NewInstance ( ) const { return vtkRemoveUnusedPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRemoveUnusedPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRemoveUnusedPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Enable adding a `vtkOriginalPointIds` array to the point data
##  which identifies the original point index. Default is true.
##  virtual void SetGenerateOriginalPointIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateOriginalPointIds  to  << _arg ) ; if ( this -> GenerateOriginalPointIds != _arg ) { this -> GenerateOriginalPointIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetGenerateOriginalPointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateOriginalPointIds  of  << this -> GenerateOriginalPointIds ) ; return this -> GenerateOriginalPointIds ; } ; virtual void GenerateOriginalPointIdsOn ( ) { this -> SetGenerateOriginalPointIds ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateOriginalPointIdsOff ( ) { this -> SetGenerateOriginalPointIds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Choose the name to use for the original point ids array. Default is `vtkOriginalPointIds`.
##  This is used only when `GenerateOriginalPointIds` is true.
##  virtual void SetOriginalPointIdsArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OriginalPointIdsArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OriginalPointIdsArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> OriginalPointIdsArrayName && _arg && ( ! strcmp ( this -> OriginalPointIdsArrayName , _arg ) ) ) { return ; } delete [ ] this -> OriginalPointIdsArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OriginalPointIdsArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OriginalPointIdsArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOriginalPointIdsArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << OriginalPointIdsArrayName  of  << ( this -> OriginalPointIdsArrayName ? this -> OriginalPointIdsArrayName : (null) ) ) ; return this -> OriginalPointIdsArrayName ; } ; /@} protected : vtkRemoveUnusedPoints ( ) ; ~ vtkRemoveUnusedPoints ( ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkRemoveUnusedPoints ( const vtkRemoveUnusedPoints & ) = delete ; void operator = ( const vtkRemoveUnusedPoints & ) = delete ; bool GenerateOriginalPointIds ; char * OriginalPointIdsArrayName ; } ;
## Error: token expected: ; but got: [identifier]!!!

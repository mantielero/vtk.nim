## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCountFaces.h
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
##  @class   vtkCountFaces
##  @brief   Add a cell data array containing the number of faces
##  per cell.
##
##
##  This filter adds a cell data array containing the number of faces per cell.
##

## !!!Ignored construct:  # vtkCountFaces_h [NewLine] # vtkCountFaces_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkCountFaces : public vtkPassInputTypeAlgorithm { public : static vtkCountFaces * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCountFaces :: IsTypeOf ( type ) ; } static vtkCountFaces * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCountFaces * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCountFaces * NewInstance ( ) const { return vtkCountFaces :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCountFaces :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCountFaces :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The name of the new output array containing the face counts.
##  virtual void SetOutputArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OutputArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> OutputArrayName && _arg && ( ! strcmp ( this -> OutputArrayName , _arg ) ) ) { return ; } delete [ ] this -> OutputArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OutputArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OutputArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputArrayName  of  << ( this -> OutputArrayName ? this -> OutputArrayName : (null) ) ) ; return this -> OutputArrayName ; } ; /@} protected : vtkCountFaces ( ) ; ~ vtkCountFaces ( ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inInfoVec , vtkInformationVector * outInfoVec ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; char * OutputArrayName ; private : vtkCountFaces ( const vtkCountFaces & ) = delete ; void operator = ( const vtkCountFaces & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

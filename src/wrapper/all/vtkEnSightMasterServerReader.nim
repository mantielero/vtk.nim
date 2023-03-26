## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEnSightMasterServerReader.h
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
##  @class   vtkEnSightMasterServerReader
##  @brief   reader for compound EnSight files
##

## !!!Ignored construct:  # vtkEnSightMasterServerReader_h [NewLine] # vtkEnSightMasterServerReader_h [NewLine] # vtkGenericEnSightReader.h [NewLine] # vtkIOEnSightModule.h  For export macro [NewLine] class vtkCollection ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOENSIGHT_EXPORT vtkEnSightMasterServerReader : public vtkGenericEnSightReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGenericEnSightReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGenericEnSightReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEnSightMasterServerReader :: IsTypeOf ( type ) ; } static vtkEnSightMasterServerReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEnSightMasterServerReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEnSightMasterServerReader * NewInstance ( ) const { return vtkEnSightMasterServerReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGenericEnSightReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEnSightMasterServerReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEnSightMasterServerReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkEnSightMasterServerReader * New ( ) ; *
##  Determine which file should be read for piece
##  int DetermineFileName ( int piece ) ; /@{ *
##  Get the file name that will be read.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetPieceCaseFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceCaseFileName  of  << ( this -> PieceCaseFileName ? this -> PieceCaseFileName : (null) ) ) ; return this -> PieceCaseFileName ; } ; /@} /@{ *
##  Set or get the current piece.
##  virtual void SetCurrentPiece ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CurrentPiece  to  << _arg ) ; if ( this -> CurrentPiece != _arg ) { this -> CurrentPiece = _arg ; this -> Modified ( ) ; } } ; virtual int GetCurrentPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentPiece  of  << this -> CurrentPiece ) ; return this -> CurrentPiece ; } ; /@} int CanReadFile ( VTK_FILEPATH const char * fname ) override ; protected : vtkEnSightMasterServerReader ( ) ; ~ vtkEnSightMasterServerReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; virtual void SetPieceCaseFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PieceCaseFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> PieceCaseFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> PieceCaseFileName && _arg && ( ! strcmp ( this -> PieceCaseFileName , _arg ) ) ) { return ; } delete [ ] this -> PieceCaseFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> PieceCaseFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> PieceCaseFileName = nullptr ; } this -> Modified ( ) ; } ; char * PieceCaseFileName ; int MaxNumberOfPieces ; int CurrentPiece ; private : vtkEnSightMasterServerReader ( const vtkEnSightMasterServerReader & ) = delete ; void operator = ( const vtkEnSightMasterServerReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

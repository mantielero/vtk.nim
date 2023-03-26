## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPDataSetWriter.h
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
##  @class   vtkPDataSetWriter
##  @brief   Manages writing pieces of a data set.
##
##  vtkPDataSetWriter will write a piece of a file, and will also create
##  a metadata file that lists all of the files in a data set.
##

## !!!Ignored construct:  # vtkPDataSetWriter_h [NewLine] # vtkPDataSetWriter_h [NewLine] # vtkDataSetWriter.h [NewLine] # vtkIOParallelModule.h  For export macro [NewLine] # < map >  for keeping track of extents # < vector >  for keeping track of extents [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKIOPARALLEL_EXPORT vtkPDataSetWriter : public vtkDataSetWriter { public : void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPDataSetWriter :: IsTypeOf ( type ) ; } static vtkPDataSetWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPDataSetWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPDataSetWriter * NewInstance ( ) const { return vtkPDataSetWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPDataSetWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPDataSetWriter :: New ( ) ; } public : ; static vtkPDataSetWriter * New ( ) ; *
##  Write the pvtk file and cooresponding vtk files.
##  int Write ( ) override ; /@{ *
##  This is how many pieces the whole data set will be divided into.
##  void SetNumberOfPieces ( int num ) ; virtual int GetNumberOfPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPieces  of  << this -> NumberOfPieces ) ; return this -> NumberOfPieces ; } ; /@} /@{ *
##  Extra ghost cells will be written out to each piece file
##  if this value is larger than 0.
##  virtual void SetGhostLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GhostLevel  to  << _arg ) ; if ( this -> GhostLevel != _arg ) { this -> GhostLevel = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPiecesGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostLevel  of  << this -> GhostLevel ) ; return this -> GhostLevel ; } ; /@} /@{ *
##  This is the range of pieces that that this writer is
##  responsible for writing.  All pieces must be written
##  by some process.  The process that writes piece 0 also
##  writes the pvtk file that lists all the piece file names.
##  virtual void SetGhostLevelStartPiece ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StartPiece  to  << _arg ) ; if ( this -> StartPiece != _arg ) { this -> StartPiece = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPiecesGhostLevelStartPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartPiece  of  << this -> StartPiece ) ; return this -> StartPiece ; } ; virtual void SetGhostLevelStartPieceEndPiece ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EndPiece  to  << _arg ) ; if ( this -> EndPiece != _arg ) { this -> EndPiece = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPiecesGhostLevelStartPieceEndPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndPiece  of  << this -> EndPiece ) ; return this -> EndPiece ; } ; /@} /@{ *
##  This file pattern uses the file name and piece number
##  to construct a file name for the piece file.
##  virtual void SetFilePattern ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePattern  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePattern == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePattern && _arg && ( ! strcmp ( this -> FilePattern , _arg ) ) ) { return ; } delete [ ] this -> FilePattern ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePattern = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePattern = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFilePattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePattern  of  << ( this -> FilePattern ? this -> FilePattern : (null) ) ) ; return this -> FilePattern ; } ; /@} /@{ *
##  This flag determines whether to use absolute paths for the piece files.
##  By default the pieces are put in the main directory, and the piece file
##  names in the meta data pvtk file are relative to this directory.
##  This should make moving the whole lot to another directory, an easier task.
##  virtual void SetGhostLevelStartPieceEndPieceUseRelativeFileNames ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseRelativeFileNames  to  << _arg ) ; if ( this -> UseRelativeFileNames != _arg ) { this -> UseRelativeFileNames = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfPiecesGhostLevelStartPieceEndPieceUseRelativeFileNames ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRelativeFileNames  of  << this -> UseRelativeFileNames ) ; return this -> UseRelativeFileNames ; } ; virtual void UseRelativeFileNamesOn ( ) { this -> SetUseRelativeFileNames ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseRelativeFileNamesOff ( ) { this -> SetUseRelativeFileNames ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Controller used to communicate data type of blocks.
##  By default, the global controller is used. If you want another
##  controller to be used, set it with this.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkPDataSetWriter ( ) ; ~ vtkPDataSetWriter ( ) override ; ostream * OpenFile ( ) ; int WriteUnstructuredMetaData ( vtkDataSet * input , char * root , char * str , size_t strSize , ostream * fptr ) ; int WriteImageMetaData ( vtkImageData * input , char * root , char * str , size_t strSize , ostream * fptr ) ; int WriteRectilinearGridMetaData ( vtkRectilinearGrid * input , char * root , char * str , size_t strSize , ostream * fptr ) ; int WriteStructuredGridMetaData ( vtkStructuredGrid * input , char * root , char * str , size_t strSize , ostream * fptr ) ; int StartPiece ; int EndPiece ; int NumberOfPieces ; int GhostLevel ; vtkTypeBool UseRelativeFileNames ; char * FilePattern ; void DeleteFiles ( ) ; typedef std :: map < int , std :: vector < int >> ExtentsType ; ExtentsType Extents ; vtkMultiProcessController * Controller ; private : vtkPDataSetWriter ( const vtkPDataSetWriter & ) = delete ; void operator = ( const vtkPDataSetWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

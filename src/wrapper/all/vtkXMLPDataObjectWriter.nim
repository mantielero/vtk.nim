## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPDataObjectWriter.h
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
##  @class   vtkXMLPDataObjectWriter
##  @brief   Write data in a parallel XML format.
##
##  vtkXMLPDataWriter is the superclass for all XML parallel data object
##  writers.  It provides functionality needed for writing parallel
##  formats, such as the selection of which writer writes the summary
##  file and what range of pieces are assigned to each serial writer.
##
##  @sa
##  vtkXMLDataObjectWriter
##

## !!!Ignored construct:  # vtkXMLPDataObjectWriter_h [NewLine] # vtkXMLPDataObjectWriter_h [NewLine] # vtkIOParallelXMLModule.h  For export macro # vtkXMLWriter.h [NewLine] class vtkCallbackCommand ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKIOPARALLELXML_EXPORT vtkXMLPDataObjectWriter : public vtkXMLWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPDataObjectWriter :: IsTypeOf ( type ) ; } static vtkXMLPDataObjectWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPDataObjectWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPDataObjectWriter * NewInstance ( ) const { return vtkXMLPDataObjectWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPDataObjectWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPDataObjectWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the number of pieces that are being written in parallel.
##  virtual void SetNumberOfPieces ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfPieces  to  << _arg ) ; if ( this -> NumberOfPieces != _arg ) { this -> NumberOfPieces = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPieces  of  << this -> NumberOfPieces ) ; return this -> NumberOfPieces ; } ; /@} /@{ *
##  Get/Set the range of pieces assigned to this writer.
##  virtual void SetNumberOfPiecesStartPiece ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StartPiece  to  << _arg ) ; if ( this -> StartPiece != _arg ) { this -> StartPiece = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPiecesStartPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartPiece  of  << this -> StartPiece ) ; return this -> StartPiece ; } ; virtual void SetNumberOfPiecesStartPieceEndPiece ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EndPiece  to  << _arg ) ; if ( this -> EndPiece != _arg ) { this -> EndPiece = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPiecesStartPieceEndPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndPiece  of  << this -> EndPiece ) ; return this -> EndPiece ; } ; /@} /@{ *
##  Get/Set the ghost level used for this writer's piece.
##  virtual void SetNumberOfPiecesStartPieceEndPieceGhostLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GhostLevel  to  << _arg ) ; if ( this -> GhostLevel != _arg ) { this -> GhostLevel = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPiecesStartPieceEndPieceGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostLevel  of  << this -> GhostLevel ) ; return this -> GhostLevel ; } ; /@} /@{ *
##  Get/Set whether to use a subdirectory to store the pieces
##  virtual void SetNumberOfPiecesStartPieceEndPieceGhostLevelUseSubdirectory ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseSubdirectory  to  << _arg ) ; if ( this -> UseSubdirectory != _arg ) { this -> UseSubdirectory = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNumberOfPiecesStartPieceEndPieceGhostLevelUseSubdirectory ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSubdirectory  of  << this -> UseSubdirectory ) ; return this -> UseSubdirectory ; } ; /@} /@{ *
##  Get/Set whether the writer should write the summary file that
##  refers to all of the pieces' individual files.
##  This is on by default. Note that only the first process writes
##  the summary file.
##  virtual void SetWriteSummaryFile ( int flag ) ; virtual int GetNumberOfPiecesStartPieceEndPieceGhostLevelUseSubdirectoryWriteSummaryFile ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteSummaryFile  of  << this -> WriteSummaryFile ) ; return this -> WriteSummaryFile ; } ; virtual void WriteSummaryFileOn ( ) { this -> SetWriteSummaryFile ( static_cast < int > ( 1 ) ) ; } virtual void WriteSummaryFileOff ( ) { this -> SetWriteSummaryFile ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  Controller used to communicate data type of blocks.
##  By default, the global controller is used. If you want another
##  controller to be used, set it with this.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Overridden to handle passing the CONTINUE_EXECUTING() flags to the
##  executive.
##  vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; protected : vtkXMLPDataObjectWriter ( ) ; ~ vtkXMLPDataObjectWriter ( ) override ; *
##  Override writing method from superclass.
##  int WriteInternal ( ) override ; *
##  Write data from the input dataset. Call WritePData(vtkIndent indent)
##  int WriteData ( ) override ; *
##  Write Data associated with the input dataset. It needs to be overridden by subclass
##  virtual void WritePData ( vtkIndent indent ) = 0 ; *
##  Write a piece of the dataset on disk. Called by WritePieceInternal().
##  It needs to be overridden by subclass
##  virtual int WritePiece ( int index ) = 0 ; *
##  Method called by WriteInternal(). It's used for writing a piece of the dataset.
##  It needs to be overridden by subclass.
##  virtual int WritePieceInternal ( ) = 0 ; *
##  Overridden to make appropriate piece request from upstream.
##  virtual int RequestUpdateExtent ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; *
##  Collect information between ranks before writing the summary file.
##  This method is called on all ranks while summary file is only written on 1
##  rank (rank 0).
##  virtual void PrepareSummaryFile ( ) ; *
##  Write the attributes of the piece at the given index
##  virtual void WritePPieceAttributes ( int index ) ; /@{ *
##  Methods for creating a filename for each piece in the dataset
##  char * CreatePieceFileName ( int index , const char * path = nullptr ) ; void SplitFileName ( ) ; /@} *
##  Callback registered with the InternalProgressObserver.
##  static void ProgressCallbackFunction ( vtkObject * , unsigned long , void * , void * ) ; *
##  Valid at end of WriteInternal to indicate if we're going to continue
##  execution.
##  virtual bool GetNumberOfPiecesStartPieceEndPieceGhostLevelUseSubdirectoryWriteSummaryFileContinuingExecution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ContinuingExecution  of  << this -> ContinuingExecution ) ; return this -> ContinuingExecution ; } ; *
##  Get the current piece to write
##  virtual int GetNumberOfPiecesStartPieceEndPieceGhostLevelUseSubdirectoryWriteSummaryFileContinuingExecutionCurrentPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentPiece  of  << this -> CurrentPiece ) ; return this -> CurrentPiece ; } ; *
##  Progress callback from internal writer.
##  virtual void ProgressCallback ( vtkAlgorithm * w ) ; *
##  Method used to delete all written files.
##  void DeleteFiles ( ) ; *
##  The observer to report progress from the internal writer.
##  vtkCallbackCommand * InternalProgressObserver ; vtkMultiProcessController * Controller ; int StartPiece ; int EndPiece ; int NumberOfPieces ; int GhostLevel ; int WriteSummaryFile ; bool UseSubdirectory ; char * PathName ; char * FileNameBase ; char * FileNameExtension ; char * PieceFileNameExtension ; *
##  Flags used to keep track of which pieces were written out.
##  unsigned char * PieceWrittenFlags ; *
##  Initializes PieceFileNameExtension.
##  virtual void SetupPieceFileNameExtension ( ) ; private : vtkXMLPDataObjectWriter ( const vtkXMLPDataObjectWriter & ) = delete ; void operator = ( const vtkXMLPDataObjectWriter & ) = delete ; *
##  Indicates the piece currently being written.
##  int CurrentPiece ; *
##  Set in WriteInternal() to request continued execution from the executive to
##  write more pieces.
##  bool ContinuingExecution ; } ;
## Error: token expected: ; but got: [identifier]!!!

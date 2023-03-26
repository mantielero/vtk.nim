## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataStreamer.h
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
##  @class   vtkPolyDataStreamer
##  @brief   Streamer appends input pieces to the output.
##
##  vtkPolyDataStreamer initiates streaming by requesting pieces from its
##  single input it appends these pieces to the requested output.
##  Note that since vtkPolyDataStreamer uses an append filter, all the
##  polygons generated have to be kept in memory before rendering. If
##  these do not fit in the memory, it is possible to make the vtkPolyDataMapper
##  stream. Since the mapper will render each piece separately, all the
##  polygons do not have to stored in memory.
##  @attention
##  The output may be slightly different if the pipeline does not handle
##  ghost cells properly (i.e. you might see seames between the pieces).
##  @sa
##  vtkAppendFilter
##

## !!!Ignored construct:  # vtkPolyDataStreamer_h [NewLine] # vtkPolyDataStreamer_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkStreamerBase.h [NewLine] class vtkAppendPolyData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkPolyDataStreamer : public vtkStreamerBase { public : static vtkPolyDataStreamer * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStreamerBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStreamerBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyDataStreamer :: IsTypeOf ( type ) ; } static vtkPolyDataStreamer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyDataStreamer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyDataStreamer * NewInstance ( ) const { return vtkPolyDataStreamer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStreamerBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataStreamer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataStreamer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the number of pieces to divide the problem into.
##  void SetNumberOfStreamDivisions ( int num ) ; int GetNumberOfStreamDivisions ( ) { return this -> NumberOfPasses ; } /@} /@{ *
##  By default, this option is off.  When it is on, cell scalars are generated
##  based on which piece they are in.
##  virtual void SetColorByPiece ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ColorByPiece  to  << _arg ) ; if ( this -> ColorByPiece != _arg ) { this -> ColorByPiece = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetColorByPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorByPiece  of  << this -> ColorByPiece ) ; return this -> ColorByPiece ; } ; virtual void ColorByPieceOn ( ) { this -> SetColorByPiece ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ColorByPieceOff ( ) { this -> SetColorByPiece ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkPolyDataStreamer ( ) ; ~ vtkPolyDataStreamer ( ) override ;  see algorithm for more info int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int ExecutePass ( vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int PostExecute ( vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; vtkTypeBool ColorByPiece ; private : vtkPolyDataStreamer ( const vtkPolyDataStreamer & ) = delete ; void operator = ( const vtkPolyDataStreamer & ) = delete ; vtkAppendPolyData * Append ; } ;
## Error: token expected: ; but got: [identifier]!!!

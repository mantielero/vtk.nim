## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPExodusIIReader.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkPExodusIIReader
##  @brief   Read Exodus II files (.exii)
##
##  vtkPExodusIIReader is a unstructured grid source object that reads
##  ExodusII files. Most of the meta data associated with the
##  file is loaded when UpdateInformation is called. This includes
##  information like Title, number of blocks, number and names of
##  arrays. This data can be retrieved from methods in this
##  reader. Separate arrays that are meant to be a single vector, are
##  combined internally for convenience. To be combined, the array
##  names have to be identical except for a trailing X,Y and Z (or
##  x,y,z). By default all cell and point arrays are loaded. However,
##  the user can flag arrays not to load with the methods
##  "SetPointDataArrayLoadFlag" and "SetCellDataArrayLoadFlag". The
##  reader responds to piece requests by loading only a range of the
##  possible blocks. Unused points are filtered out internally.
##

## !!!Ignored construct:  # vtkPExodusIIReader_h [NewLine] # vtkPExodusIIReader_h [NewLine] # vtkExodusIIReader.h [NewLine] # vtkIOParallelExodusModule.h  For export macro [NewLine] # < vector >  Required for vector [NewLine] class vtkTimerLog ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKIOPARALLELEXODUS_EXPORT vtkPExodusIIReader : public vtkExodusIIReader { public : static vtkPExodusIIReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExodusIIReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExodusIIReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPExodusIIReader :: IsTypeOf ( type ) ; } static vtkPExodusIIReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPExodusIIReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPExodusIIReader * NewInstance ( ) const { return vtkPExodusIIReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExodusIIReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPExodusIIReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPExodusIIReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/get the communication object used to relay a list of files
##  from the rank 0 process to all others. This is the only interprocess
##  communication required by vtkPExodusIIReader.
##  void SetController ( vtkMultiProcessController * c ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  These methods tell the reader that the data is distributed across
##  multiple files. This is for distributed execution. It this case,
##  pieces are mapped to files. The pattern should have one %d to
##  format the file number. FileNumberRange is used to generate file
##  numbers. I was thinking of having an arbitrary list of file
##  numbers. This may happen in the future. (That is why there is no
##  GetFileNumberRange method.
##  virtual void SetFilePattern ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePattern  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePattern == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePattern && _arg && ( ! strcmp ( this -> FilePattern , _arg ) ) ) { return ; } delete [ ] this -> FilePattern ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePattern = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePattern = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFilePattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePattern  of  << ( this -> FilePattern ? this -> FilePattern : (null) ) ) ; return this -> FilePattern ; } ; virtual void SetFilePatternFilePrefix ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePrefix  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePrefix == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePrefix && _arg && ( ! strcmp ( this -> FilePrefix , _arg ) ) ) { return ; } delete [ ] this -> FilePrefix ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePrefix = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePrefix = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFilePatternFilePrefix ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePrefix  of  << ( this -> FilePrefix ? this -> FilePrefix : (null) ) ) ; return this -> FilePrefix ; } ; /@} /@{ *
##  Set the range of files that are being loaded. The range for single
##  file should add to 0.
##  void SetFileRange ( int , int ) ; void SetFileRange ( int * r ) { this -> SetFileRange ( r [ 0 ] , r [ 1 ] ) ; } virtual int * GetFileRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FileRange  pointer  << this -> FileRange ) ; return this -> FileRange ; } VTK_WRAPEXCLUDE virtual void GetFileRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> FileRange [ 0 ] ; _arg2 = this -> FileRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FileRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFileRange ( int _arg [ 2 ] ) { this -> GetFileRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} *
##  Provide an arbitrary list of file names instead of a prefix,
##  pattern and range.  Overrides any prefix, pattern and range
##  that is specified.  vtkPExodusIIReader makes it's own copy
##  of your file names.
##  void SetFileNames ( int nfiles , const char * * names ) ; void SetFileName ( VTK_FILEPATH const char * name ) override ; *
##  Return pointer to list of file names set in SetFileNames
##  char * * GetFileNames ( ) { return this -> FileNames ; } *
##  Return number of file names set in SetFileNames
##  int GetNumberOfFileNames ( ) { return this -> NumberOfFileNames ; } /@{ *
##  Return the number of files to be read.
##  virtual int GetNumberOfFiles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfFiles  of  << this -> NumberOfFiles ) ; return this -> NumberOfFiles ; } ; /@} vtkIdType GetTotalNumberOfElements ( ) override ; vtkIdType GetTotalNumberOfNodes ( ) override ; *
##  Sends metadata (that read from the input file, not settings modified
##  through this API) from the rank 0 node to all other processes in a job.
##  virtual void Broadcast ( vtkMultiProcessController * ctrl ) ; /@{ *
##  The size of the variable cache in MegaByes. This represents the maximum
##  size of cache that a single partition reader can have while reading. When
##  a reader is finished its cache size will be set to a fraction of this based
##  on the number of partitions.
##  The Default for this is 100MiB.
##  Note that because each reader still holds
##  a fraction of the cache size after reading the total amount of data cached
##  can be at most twice this size.
##  virtual double GetNumberOfFilesVariableCacheSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VariableCacheSize  of  << this -> VariableCacheSize ) ; return this -> VariableCacheSize ; } ; virtual void SetVariableCacheSize ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VariableCacheSize  to  << _arg ) ; if ( this -> VariableCacheSize != _arg ) { this -> VariableCacheSize = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkPExodusIIReader ( ) ; ~ vtkPExodusIIReader ( ) override ; /@{ *
##  Try to "guess" the pattern of files.
##  int DeterminePattern ( const char * file ) ; static int DetermineFileId ( const char * file ) ; /@}  holds the size of the variable cache in GigaBytes double VariableCacheSize ;  **KEN** Previous discussions concluded with std classes in header
##  files is bad.  Perhaps we should change ReaderList. vtkMultiProcessController * Controller ; vtkIdType ProcRank ; vtkIdType ProcSize ; char * FilePattern ; char * CurrentFilePattern ; char * FilePrefix ; char * CurrentFilePrefix ; char * MultiFileName ; int FileRange [ 2 ] ; int CurrentFileRange [ 2 ] ; int NumberOfFiles ; char * * FileNames ; int NumberOfFileNames ; std :: vector < vtkExodusIIReader * > ReaderList ; std :: vector < int > NumberOfPointsPerFile ; std :: vector < int > NumberOfCellsPerFile ; int LastCommonTimeStep ; int Timing ; vtkTimerLog * TimerLog ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkPExodusIIReader ( const vtkPExodusIIReader & ) = delete ; void operator = ( const vtkPExodusIIReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataWriter.h
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
##  @class   vtkDataWriter
##  @brief   helper class for objects that write VTK data files
##
##  vtkDataWriter is a helper class that opens and writes the VTK header and
##  point data (e.g., scalars, vectors, normals, etc.) from a vtk data file.
##  See the VTK textbook and online resources for various formats.
##
##  @sa
##  vtkDataSetWriter vtkPolyDataWriter vtkStructuredGridWriter
##  vtkStructuredPointsWriter vtkUnstructuredGridWriter
##  vtkFieldDataWriter vtkRectilinearGridWriter
##

## !!!Ignored construct:  # vtkDataWriter_h [NewLine] # vtkDataWriter_h [NewLine] # vtkIOLegacyModule.h  For export macro # vtkWriter.h [NewLine] # < locale >  For locale settings [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkGraph"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationKey"
discard "forward decl of vtkPoints"
discard "forward decl of vtkTable"
## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkDataWriter : public vtkWriter { public : /@{ *
##  Standard methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataWriter :: IsTypeOf ( type ) ; } static vtkDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataWriter * NewInstance ( ) const { return vtkDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Create object with default header, ASCII format, and default names for
##  scalars, vectors, tensors, normals, and texture coordinates.
##  static vtkDataWriter * New ( ) ; /@{ *
##  Specify the file name of VTK data file to write.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@}  Currently VTK can write out two different versions of file format: files
##  of VTK reader version 4.2 and previous; and VTK reader version 5.1 and
##  later. This will likely change in the future. (Note: the major
##  difference in the two formats is the way cell arrays are written out.)
##  By default, Version 5.1 files are written out. enum VTKFileVersion { VTK_LEGACY_READER_VERSION_4_2 = 42 , VTK_LEGACY_READER_VERSION_5_1 = 51 } ; /@{ *
##  Specify the VTK file version to write. See the enum documentaion above
##  (VTKFileVersion) for additional information about supported versions.
##  It is possible to get the file major and minor versions separately.  See
##  also vtkDataReader for related methods. (Note, the parsing of the
##  FileVersion into major and minor version is as follows: the least
##  significant digit is the minor version; the remaining digits are the
##  major version.
##  void SetFileVersion ( int ) ; virtual int GetFileVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileVersion  of  << this -> FileVersion ) ; return this -> FileVersion ; } ; virtual int GetFileVersionFileMajorVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileMajorVersion  of  << this -> FileMajorVersion ) ; return this -> FileMajorVersion ; } ; virtual int GetFileVersionFileMajorVersionFileMinorVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileMinorVersion  of  << this -> FileMinorVersion ) ; return this -> FileMinorVersion ; } ; /@} /@{ *
##  Enable writing to an OutputString instead of the default, a file.
##  virtual void SetWriteToOutputString ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WriteToOutputString  to  << _arg ) ; if ( this -> WriteToOutputString != _arg ) { this -> WriteToOutputString = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionWriteToOutputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToOutputString  of  << this -> WriteToOutputString ) ; return this -> WriteToOutputString ; } ; virtual void WriteToOutputStringOn ( ) { this -> SetWriteToOutputString ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void WriteToOutputStringOff ( ) { this -> SetWriteToOutputString ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  When WriteToOutputString in on, then a string is allocated, written to,
##  and can be retrieved with these methods.  The string is deleted during
##  the next call to write ...
##  virtual vtkIdType GetFileVersionFileMajorVersionFileMinorVersionWriteToOutputStringOutputStringLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputStringLength  of  << this -> OutputStringLength ) ; return this -> OutputStringLength ; } ; virtual char * GetOutputString ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputString  of  << ( this -> OutputString ? this -> OutputString : (null) ) ) ; return this -> OutputString ; } ; unsigned char * GetBinaryOutputString ( ) { return reinterpret_cast < unsigned char * > ( this -> OutputString ) ; } /@} *
##  When WriteToOutputString is on, this method returns a copy of the
##  output string in a vtkStdString.
##  vtkStdString GetOutputStdString ( ) ; *
##  This convenience method returns the string, sets the IVAR to nullptr,
##  so that the user is responsible for deleting the string.
##  I am not sure what the name should be, so it may change in the future.
##  char * RegisterAndGetOutputString ( ) ; /@{ *
##  Specify the header for the VTK data file.
##  virtual void SetHeader ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Header  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Header == nullptr && _arg == nullptr ) { return ; } if ( this -> Header && _arg && ( ! strcmp ( this -> Header , _arg ) ) ) { return ; } delete [ ] this -> Header ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Header = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Header = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeader ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Header  of  << ( this -> Header ? this -> Header : (null) ) ) ; return this -> Header ; } ; /@} /@{ *
##  If true, vtkInformation objects attached to arrays and array component
##  nameswill be written to the output. The default is true.
##  virtual void SetWriteToOutputStringWriteArrayMetaData ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WriteArrayMetaData  to  << _arg ) ; if ( this -> WriteArrayMetaData != _arg ) { this -> WriteArrayMetaData = _arg ; this -> Modified ( ) ; } } ; virtual bool GetFileVersionFileMajorVersionFileMinorVersionWriteToOutputStringOutputStringLengthWriteArrayMetaData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteArrayMetaData  of  << this -> WriteArrayMetaData ) ; return this -> WriteArrayMetaData ; } ; virtual void WriteArrayMetaDataOn ( ) { this -> SetWriteToOutputStringWriteArrayMetaData ( static_cast < bool > ( 1 ) ) ; } virtual void WriteArrayMetaDataOff ( ) { this -> SetWriteToOutputStringWriteArrayMetaData ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the file type (ASCII or BINARY) of the VTK data file.
##  virtual void SetFileType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileType  to  << _arg ) ; if ( this -> FileType != ( _arg < VTK_ASCII ? VTK_ASCII : ( _arg > VTK_BINARY ? VTK_BINARY : _arg ) ) ) { this -> FileType = ( _arg < VTK_ASCII ? VTK_ASCII : ( _arg > VTK_BINARY ? VTK_BINARY : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFileTypeMinValue ( ) { return VTK_ASCII ; } virtual int GetFileTypeMaxValue ( ) { return VTK_BINARY ; } ; virtual int GetFileVersionFileMajorVersionFileMinorVersionWriteToOutputStringOutputStringLengthWriteArrayMetaDataFileType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileType  of  << this -> FileType ) ; return this -> FileType ; } ; void SetFileTypeToASCII ( ) { this -> SetFileType ( VTK_ASCII ) ; } void SetFileTypeToBinary ( ) { this -> SetFileType ( VTK_BINARY ) ; } /@} /@{ *
##  Give a name to the scalar data. If not specified, uses default
##  name "scalars".
##  virtual void SetHeaderScalarsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ScalarsName == nullptr && _arg == nullptr ) { return ; } if ( this -> ScalarsName && _arg && ( ! strcmp ( this -> ScalarsName , _arg ) ) ) { return ; } delete [ ] this -> ScalarsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ScalarsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ScalarsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarsName  of  << ( this -> ScalarsName ? this -> ScalarsName : (null) ) ) ; return this -> ScalarsName ; } ; /@} /@{ *
##  Give a name to the vector data. If not specified, uses default
##  name "vectors".
##  virtual void SetHeaderScalarsNameVectorsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VectorsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> VectorsName == nullptr && _arg == nullptr ) { return ; } if ( this -> VectorsName && _arg && ( ! strcmp ( this -> VectorsName , _arg ) ) ) { return ; } delete [ ] this -> VectorsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> VectorsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> VectorsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << VectorsName  of  << ( this -> VectorsName ? this -> VectorsName : (null) ) ) ; return this -> VectorsName ; } ; /@} /@{ *
##  Give a name to the tensors data. If not specified, uses default
##  name "tensors".
##  virtual void SetHeaderScalarsNameVectorsNameTensorsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TensorsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> TensorsName == nullptr && _arg == nullptr ) { return ; } if ( this -> TensorsName && _arg && ( ! strcmp ( this -> TensorsName , _arg ) ) ) { return ; } delete [ ] this -> TensorsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> TensorsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> TensorsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsNameTensorsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << TensorsName  of  << ( this -> TensorsName ? this -> TensorsName : (null) ) ) ; return this -> TensorsName ; } ; /@} /@{ *
##  Give a name to the normals data. If not specified, uses default
##  name "normals".
##  virtual void SetHeaderScalarsNameVectorsNameTensorsNameNormalsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NormalsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> NormalsName == nullptr && _arg == nullptr ) { return ; } if ( this -> NormalsName && _arg && ( ! strcmp ( this -> NormalsName , _arg ) ) ) { return ; } delete [ ] this -> NormalsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> NormalsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> NormalsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsNameTensorsNameNormalsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << NormalsName  of  << ( this -> NormalsName ? this -> NormalsName : (null) ) ) ; return this -> NormalsName ; } ; /@} /@{ *
##  Give a name to the texture coordinates data. If not specified, uses
##  default name "textureCoords".
##  virtual void SetHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TCoordsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> TCoordsName == nullptr && _arg == nullptr ) { return ; } if ( this -> TCoordsName && _arg && ( ! strcmp ( this -> TCoordsName , _arg ) ) ) { return ; } delete [ ] this -> TCoordsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> TCoordsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> TCoordsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << TCoordsName  of  << ( this -> TCoordsName ? this -> TCoordsName : (null) ) ) ; return this -> TCoordsName ; } ; /@} /@{ *
##  Give a name to the global ids data. If not specified, uses
##  default name "global_ids".
##  virtual void SetHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GlobalIdsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> GlobalIdsName == nullptr && _arg == nullptr ) { return ; } if ( this -> GlobalIdsName && _arg && ( ! strcmp ( this -> GlobalIdsName , _arg ) ) ) { return ; } delete [ ] this -> GlobalIdsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> GlobalIdsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> GlobalIdsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << GlobalIdsName  of  << ( this -> GlobalIdsName ? this -> GlobalIdsName : (null) ) ) ; return this -> GlobalIdsName ; } ; /@} /@{ *
##  Give a name to the pedigree ids data. If not specified, uses
##  default name "pedigree_ids".
##  virtual void SetHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsNamePedigreeIdsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PedigreeIdsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> PedigreeIdsName == nullptr && _arg == nullptr ) { return ; } if ( this -> PedigreeIdsName && _arg && ( ! strcmp ( this -> PedigreeIdsName , _arg ) ) ) { return ; } delete [ ] this -> PedigreeIdsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> PedigreeIdsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> PedigreeIdsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsNamePedigreeIdsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << PedigreeIdsName  of  << ( this -> PedigreeIdsName ? this -> PedigreeIdsName : (null) ) ) ; return this -> PedigreeIdsName ; } ; /@} /@{ *
##  Give a name to the edge flags data. If not specified, uses
##  default name "edge_flags".
##  virtual void SetHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsNamePedigreeIdsNameEdgeFlagsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EdgeFlagsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> EdgeFlagsName == nullptr && _arg == nullptr ) { return ; } if ( this -> EdgeFlagsName && _arg && ( ! strcmp ( this -> EdgeFlagsName , _arg ) ) ) { return ; } delete [ ] this -> EdgeFlagsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> EdgeFlagsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> EdgeFlagsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsNamePedigreeIdsNameEdgeFlagsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeFlagsName  of  << ( this -> EdgeFlagsName ? this -> EdgeFlagsName : (null) ) ) ; return this -> EdgeFlagsName ; } ; /@} /@{ *
##  Give a name to the lookup table. If not specified, uses default
##  name "lookupTable".
##  virtual void SetHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsNamePedigreeIdsNameEdgeFlagsNameLookupTableName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LookupTableName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LookupTableName == nullptr && _arg == nullptr ) { return ; } if ( this -> LookupTableName && _arg && ( ! strcmp ( this -> LookupTableName , _arg ) ) ) { return ; } delete [ ] this -> LookupTableName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LookupTableName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LookupTableName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsNamePedigreeIdsNameEdgeFlagsNameLookupTableName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << LookupTableName  of  << ( this -> LookupTableName ? this -> LookupTableName : (null) ) ) ; return this -> LookupTableName ; } ; /@} /@{ *
##  Give a name to the field data. If not specified, uses default
##  name "field".
##  virtual void SetHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsNamePedigreeIdsNameEdgeFlagsNameLookupTableNameFieldDataName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FieldDataName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FieldDataName == nullptr && _arg == nullptr ) { return ; } if ( this -> FieldDataName && _arg && ( ! strcmp ( this -> FieldDataName , _arg ) ) ) { return ; } delete [ ] this -> FieldDataName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FieldDataName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FieldDataName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameGlobalIdsNamePedigreeIdsNameEdgeFlagsNameLookupTableNameFieldDataName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << FieldDataName  of  << ( this -> FieldDataName ? this -> FieldDataName : (null) ) ) ; return this -> FieldDataName ; } ; /@} *
##  Open a vtk data file. Returns nullptr if error.
##  virtual ostream * OpenVTKFile ( ) ; *
##  Write the header of a vtk data file. Returns 0 if error.
##  int WriteHeader ( ostream * fp ) ; *
##  Write out the points of the data set.
##  int WritePoints ( ostream * fp , vtkPoints * p ) ; *
##  Write out coordinates for rectilinear grids.
##  int WriteCoordinates ( ostream * fp , vtkDataArray * coords , int axes ) ; *
##  Write out the cells of the data set.
##  int WriteCells ( ostream * fp , vtkCellArray * cells , const char * label ) ; *
##  Write out the cells of the data set.
##  @note Legacy implementation for file version < 5.0.
##  int WriteCellsLegacy ( ostream * fp , vtkCellArray * cells , const char * label ) ; *
##  Write the cell data (e.g., scalars, vectors, ...) of a vtk dataset.
##  Returns 0 if error.
##  int WriteCellData ( ostream * fp , vtkDataSet * ds ) ; *
##  Write the point data (e.g., scalars, vectors, ...) of a vtk dataset.
##  Returns 0 if error.
##  int WritePointData ( ostream * fp , vtkDataSet * ds ) ; *
##  Write the edge data (e.g., scalars, vectors, ...) of a vtk graph.
##  Returns 0 if error.
##  int WriteEdgeData ( ostream * fp , vtkGraph * g ) ; *
##  Write the vertex data (e.g., scalars, vectors, ...) of a vtk graph.
##  Returns 0 if error.
##  int WriteVertexData ( ostream * fp , vtkGraph * g ) ; *
##  Write the row data (e.g., scalars, vectors, ...) of a vtk table.
##  Returns 0 if error.
##  int WriteRowData ( ostream * fp , vtkTable * g ) ; *
##  Write out the field data.
##  int WriteFieldData ( ostream * fp , vtkFieldData * f ) ; *
##  Write out the data associated with the dataset (i.e. field data owned by
##  the dataset itself - distinct from that owned by the cells or points).
##  int WriteDataSetData ( ostream * fp , vtkDataSet * ds ) ; *
##  Close a vtk file.
##  void CloseVTKFile ( ostream * fp ) ; protected : vtkDataWriter ( ) ; ~ vtkDataWriter ( ) override ; vtkTypeBool WriteToOutputString ; char * OutputString ; vtkIdType OutputStringLength ; void WriteData ( ) override ;  dummy method to allow this class to be instantiated and delegated to char * FileName ; int FileVersion ; int FileMajorVersion ; int FileMinorVersion ; char * Header ; int FileType ; bool WriteArrayMetaData ; char * ScalarsName ; char * VectorsName ; char * TensorsName ; char * TCoordsName ; char * NormalsName ; char * LookupTableName ; char * FieldDataName ; char * GlobalIdsName ; char * PedigreeIdsName ; char * EdgeFlagsName ; std :: locale CurrentLocale ; int WriteArray ( ostream * fp , int dataType , vtkAbstractArray * data , const char * format , vtkIdType num , vtkIdType numComp ) ; int WriteScalarData ( ostream * fp , vtkDataArray * s , vtkIdType num ) ; int WriteVectorData ( ostream * fp , vtkDataArray * v , vtkIdType num ) ; int WriteNormalData ( ostream * fp , vtkDataArray * n , vtkIdType num ) ; int WriteTCoordData ( ostream * fp , vtkDataArray * tc , vtkIdType num ) ; int WriteTensorData ( ostream * fp , vtkDataArray * t , vtkIdType num ) ; int WriteGlobalIdData ( ostream * fp , vtkDataArray * g , vtkIdType num ) ; int WritePedigreeIdData ( ostream * fp , vtkAbstractArray * p , vtkIdType num ) ; int WriteEdgeFlagsData ( ostream * fp , vtkDataArray * edgeFlags , vtkIdType num ) ; bool CanWriteInformationKey ( vtkInformation * info , vtkInformationKey * key ) ; *
##  Format is detailed \ref IOLegacyInformationFormat "here".
##  int WriteInformation ( ostream * fp , vtkInformation * info ) ; private : vtkDataWriter ( const vtkDataWriter & ) = delete ; void operator = ( const vtkDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

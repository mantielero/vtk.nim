## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkXMLCompositeDataWriter.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkXMLCompositeDataWriter
##  @brief   Writer for multi-group datasets
##
##  vtkXMLCompositeDataWriter writes (serially) the VTK XML multi-group,
##  multi-block hierarchical and hierarchical box files. XML multi-group
##  data files are meta-files that point to a list of serial VTK XML files.
##  @sa
##  vtkXMLPCompositeDataWriter
##

## !!!Ignored construct:  # vtkXMLCompositeDataWriter_h [NewLine] # vtkXMLCompositeDataWriter_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkStdString.h  needed for vtkStdString. # vtkXMLWriter.h [NewLine] class vtkCallbackCommand ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkXMLDataElement"
discard "forward decl of vtkXMLCompositeDataWriterInternals"
## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLCompositeDataWriter : public vtkXMLWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLCompositeDataWriter :: IsTypeOf ( type ) ; } static vtkXMLCompositeDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLCompositeDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLCompositeDataWriter * NewInstance ( ) const { return vtkXMLCompositeDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLCompositeDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLCompositeDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; *
##  Get/Set the number of pieces into which the inputs are split.
##  /@{ *
##  Get/Set the number of ghost levels to be written.
##  virtual int GetGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostLevel  of  << this -> GhostLevel ) ; return this -> GhostLevel ; } ; virtual void SetGhostLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GhostLevel  to  << _arg ) ; if ( this -> GhostLevel != _arg ) { this -> GhostLevel = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get/Set whether this instance will write the meta-file.
##  virtual int GetGhostLevelWriteMetaFile ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteMetaFile  of  << this -> WriteMetaFile ) ; return this -> WriteMetaFile ; } ; virtual void SetWriteMetaFile ( int flag ) ; /@} *
##  See the vtkAlgorithm for a description of what these do
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; protected : vtkXMLCompositeDataWriter ( ) ; ~ vtkXMLCompositeDataWriter ( ) override ; *
##  Methods to define the file's major and minor version numbers.
##  Major version incremented since v0.1 composite data readers cannot read
##  the files written by this new reader.
##  int GetDataSetMajorVersion ( ) override { return 1 ; } int GetDataSetMinorVersion ( ) override { return 0 ; } *
##  Create a filename for the given index.
##  vtkStdString CreatePieceFileName ( int Piece ) ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; int WriteData ( ) override ; const char * GetDataSetName ( ) override ;  Create a default executive. vtkExecutive * CreateDefaultExecutive ( ) override ; vtkInformation * InputInformation ; *
##  Determine the data types for each of the leaf nodes.
##  virtual void FillDataTypes ( vtkCompositeDataSet * ) ; *
##  Returns the number of leaf nodes (also includes empty leaf nodes).
##  unsigned int GetNumberOfDataTypes ( ) ; *
##  Returns the array pointer to the array of leaf nodes.
##  int * GetDataTypesPointer ( ) ;  Methods to create the set of writers matching the set of inputs. void CreateWriters ( vtkCompositeDataSet * ) ; vtkXMLWriter * GetWriter ( int index ) ;  Methods to help construct internal file names. void SplitFileName ( ) ; VTK_FILEPATH const char * GetFilePrefix ( ) ; VTK_FILEPATH const char * GetFilePath ( ) ; *
##  Returns the default extension to use for the given dataset type.
##  Returns nullptr if an extension cannot be determined.
##  const char * GetDefaultFileExtensionForDataSet ( int dataset_type ) ; *
##  Write the collection file if it is requested.
##  This is overridden in parallel writers to communicate the hierarchy to the
##  root which then write the meta file.
##  int WriteMetaFileIfRequested ( ) ;  Make a directory. void MakeDirectory ( const char * name ) ;  Remove a directory. void RemoveADirectory ( const char * name ) ;  Internal implementation details. vtkXMLCompositeDataWriterInternals * Internal ;  The number of ghost levels to write for unstructured data. int GhostLevel ; *
##  Whether to write the collection file on this node. This could
##  potentially be set to 0 (i.e. do not write) for optimization
##  if the file structured does not change but the data does.
##  int WriteMetaFile ;  Callback registered with the InternalProgressObserver. static void ProgressCallbackFunction ( vtkObject * , unsigned long , void * , void * ) ;  Progress callback from internal writer. virtual void ProgressCallback ( vtkAlgorithm * w ) ;  The observer to report progress from the internal writer. vtkCallbackCommand * InternalProgressObserver ; *
##  Internal method called recursively to create the xml tree for
##  the children of compositeData as well as write the actual data
##  set files.  element will only have added nested information.
##  writerIdx is the global piece index used to create unique
##  filenames for each file written.
##  This function returns 0 if no files were written from
##  compositeData.
##  virtual int WriteComposite ( vtkCompositeDataSet * compositeData , vtkXMLDataElement * element , int & writerIdx ) = 0 ; *
##  Internal method to write a non vtkCompositeDataSet subclass as
##  well as add in the file name to the metadata file.
##  Element is the containing XML metadata element that may
##  have data overwritten and added to (the index XML attribute
##  should not be touched though).  writerIdx is the piece index
##  that gets incremented for the globally numbered piece.
##  This function returns 0 if no file was written (not necessarily an error).
##  this->ErrorCode is set on error.
##  virtual int WriteNonCompositeData ( vtkDataObject * dObj , vtkXMLDataElement * element , int & writerIdx , const char * fileName ) ; *
##  Utility function to remove any already written files
##  in case writer failed.
##  virtual void RemoveWrittenFiles ( const char * SubDirectory ) ; private : vtkXMLCompositeDataWriter ( const vtkXMLCompositeDataWriter & ) = delete ; void operator = ( const vtkXMLCompositeDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

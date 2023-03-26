## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHDFReader.h
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
##  @class   vtkHDFReader
##  @brief   VTKHDF format reader.
##
##

## !!!Ignored construct:  # vtkHDFReader_h [NewLine] # vtkHDFReader_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkIOHDFModule.h  For export macro # < vector >  For storing list of values [NewLine] class vtkAbstractArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkCommand"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkImageData"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkInformation"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkUnstructuredGrid"
## !!!Ignored construct:  class VTKIOHDF_EXPORT vtkHDFReader : public vtkDataObjectAlgorithm { public : static vtkHDFReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHDFReader :: IsTypeOf ( type ) ; } static vtkHDFReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHDFReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHDFReader * NewInstance ( ) const { return vtkHDFReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHDFReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHDFReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; @{ *
##  Get/Set the name of the input file.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; @} *
##  Test whether the file (type) with the given name can be read by this
##  reader. If the file has a newer version than the reader, we still say
##  we can read the file type and we fail later, when we try to read the file.
##  This enables clients (ParaView) to distinguish between failures when we
##  need to look for another reader and failures when we don't.
##  virtual int CanReadFile ( VTK_FILEPATH const char * name ) ; @{ *
##  Get the output as a vtkDataSet pointer.
##  vtkDataSet * GetOutputAsDataSet ( ) ; vtkDataSet * GetOutputAsDataSet ( int index ) ; @} @{ *
##  Get the data array selection tables used to configure which data
##  arrays are loaded by the reader.
##  virtual vtkDataArraySelection * GetPointDataArraySelection ( ) ; virtual vtkDataArraySelection * GetCellDataArraySelection ( ) ; virtual vtkDataArraySelection * GetFieldDataArraySelection ( ) ; @} @{ *
##  Get the number of point or cell arrays available in the input.
##  int GetNumberOfPointArrays ( ) ; int GetNumberOfCellArrays ( ) ; @} @{ *
##  Get the name of the point or cell array with the given index in
##  the input.
##  const char * GetPointArrayName ( int index ) ; const char * GetCellArrayName ( int index ) ; @} virtual void SetMaximumLevelsToReadByDefaultForAMR ( unsigned int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumLevelsToReadByDefaultForAMR  to  << _arg ) ; if ( this -> MaximumLevelsToReadByDefaultForAMR != _arg ) { this -> MaximumLevelsToReadByDefaultForAMR = _arg ; this -> Modified ( ) ; } } ; virtual unsigned int GetMaximumLevelsToReadByDefaultForAMR ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumLevelsToReadByDefaultForAMR  of  << this -> MaximumLevelsToReadByDefaultForAMR ) ; return this -> MaximumLevelsToReadByDefaultForAMR ; } ; protected : vtkHDFReader ( ) ; ~ vtkHDFReader ( ) override ; *
##  How many attribute types we have. This returns 3: point, cell and field
##  attribute types.
##  constexpr static int GetNumberOfAttributeTypes ( ) { return 3 ; } *
##  Test if the reader can read a file with the given version number.
##  int CanReadFileVersion ( int major , int minor ) ; @{ *
##  Reads the 'data' requested in 'outInfo' (through extents or
##  pieces). Returns 1 if successfull, 0 otherwise.
##  int Read ( vtkInformation * outInfo , vtkImageData * data ) ; int Read ( vtkInformation * outInfo , vtkUnstructuredGrid * data ) ; int Read ( vtkInformation * outInfo , vtkOverlappingAMR * data ) ; @} *
##  Read 'pieceData' specified by 'filePiece' where
##  number of points, cells and connectivity ids
##  store those numbers for all pieces.
##  int Read ( const std :: vector < vtkIdType > & numberOfPoints , const std :: vector < vtkIdType > & numberOfCells , const std :: vector < vtkIdType > & numberOfConnectivityIds , int filePiece , vtkUnstructuredGrid * pieceData ) ; *
##  Read the field arrays from the file and add them to the dataset.
##  int AddFieldArrays ( vtkDataObject * data ) ; *
##  Modify this object when an array selection is changed.
##  static void SelectionModifiedCallback ( vtkObject * caller , unsigned long eid , void * clientdata , void * calldata ) ; @{ *
##  Standard functions to specify the type, information and read the data from
##  the file.
##  int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; @} *
##  Print update number of pieces, piece number and ghost levels.
##  void PrintPieceInformation ( vtkInformation * outInfo ) ; private : vtkHDFReader ( const vtkHDFReader & ) = delete ; void operator = ( const vtkHDFReader & ) = delete ; protected : *
##  The input file's name.
##  char * FileName ; *
##  The array selections.
##  in the same order as vtkDataObject::AttributeTypes: POINT, CELL, FIELD
##  vtkDataArraySelection * DataArraySelection [ 3 ] ; *
##  The observer to modify this object when the array selections are
##  modified.
##  vtkCallbackCommand * SelectionObserver ; @{ *
##  Image data topology and geometry.
##  int WholeExtent [ 6 ] ; double Origin [ 3 ] ; double Spacing [ 3 ] ; @} unsigned int MaximumLevelsToReadByDefaultForAMR = 0 ; class Implementation ; Implementation * Impl ; } ;
## Error: token expected: ; but got: [identifier]!!!

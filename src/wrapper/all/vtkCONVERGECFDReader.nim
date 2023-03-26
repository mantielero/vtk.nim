## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCONVERGECFDReader.h
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
##  @class    vtkCONVERGECFDReader
##  @brief    Reader for CONVERGE CFD post files.
##
##  This class reads CONVERGE CFD post files containing meshes, surfaces,
##  and parcels. Each stream in a file is read as a top-level
##  block and meshes, surfaces, and parcels are datasets under
##  each stream block.
##
##  Cell data arrays associated with mesh cells can be individually
##  selected for reading using the CellArrayStatus API.
##
##  Point data arrays associated with parcels can be individually selected
##  for reading using the ParcelArrayStatus API.
##
##  Time series are supported. The reader assumes a time series is defined
##  in a sequence of files that follow the naming convention
##
##  \code
##  <prefix><zero-padded index>[_][<time>].h5
##  \endcode
##
##  where the prefix is determined from the FileName property passed to
##  the reader. The underscore and time elements are optional. The time
##  value associated with each file is read from metadata in the file.
##
##  Parallel data loading is not supported.
##

import
  vtkIOCONVERGECFDModule, vtkNew, vtkPartitionedDataSetCollectionAlgorithm

discard "forward decl of vtkDataArraySelection"
type
  vtkCONVERGECFDReader* {.importcpp: "vtkCONVERGECFDReader",
                         header: "vtkCONVERGECFDReader.h", bycopy.} = object of vtkPartitionedDataSetCollectionAlgorithm
    vtkCONVERGECFDReader* {.importc: "vtkCONVERGECFDReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  List of files that match the chosen file name


proc New*(): ptr vtkCONVERGECFDReader {.importcpp: "vtkCONVERGECFDReader::New(@)",
                                    header: "vtkCONVERGECFDReader.h".}
type
  vtkCONVERGECFDReaderSuperclass* = vtkPartitionedDataSetCollectionAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCONVERGECFDReader::IsTypeOf(@)",
    header: "vtkCONVERGECFDReader.h".}
proc IsA*(this: var vtkCONVERGECFDReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCONVERGECFDReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCONVERGECFDReader {.
    importcpp: "vtkCONVERGECFDReader::SafeDownCast(@)",
    header: "vtkCONVERGECFDReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCONVERGECFDReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPartitionedDataSetCollectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCONVERGECFDReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCONVERGECFDReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCONVERGECFDReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCONVERGECFDReader.h".}
proc GetnameCellDataArraySelection*(this: var vtkCONVERGECFDReader): ptr vtkDataArraySelection {.
    importcpp: "GetnameCellDataArraySelection", header: "vtkCONVERGECFDReader.h".}
  ## *
  ##  Access the parcel data array selection to specify which point data arrays
  ##  should be read and associated parcel. Only the specified parcel data arrays will
  ##  be read from the file.
  ##
proc GetnameCellDataArraySelectionParcelDataArraySelection*(
    this: var vtkCONVERGECFDReader): ptr vtkDataArraySelection {.
    importcpp: "GetnameCellDataArraySelectionParcelDataArraySelection",
    header: "vtkCONVERGECFDReader.h".}
  ## *
  ##  Determine if the file can be read with this reader.
  ##
## !!!Ignored construct:  virtual int CanReadFile ( VTK_FILEPATH const char * fname ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  /@{ *
##  Specify file name of the Exodus file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

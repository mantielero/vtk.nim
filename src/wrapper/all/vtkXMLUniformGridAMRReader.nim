## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkXMLUniformGridAMRReader.h
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
##  @class   vtkXMLUniformGridAMRReader
##  @brief   Reader for amr datasets (vtkOverlappingAMR
##  or vtkNonOverlappingAMR).
##
##  vtkXMLUniformGridAMRReader reads the VTK XML data files for all types of amr
##  datasets including vtkOverlappingAMR, vtkNonOverlappingAMR and the legacy
##  vtkHierarchicalBoxDataSet. The reader uses information in the file to
##  determine what type of dataset is actually being read and creates the
##  output-data object accordingly.
##
##  This reader can only read files with version 1.1 or greater.
##  Older versions can be converted to the newer versions using
##  vtkXMLHierarchicalBoxDataFileConverter.
##

import
  vtkIOXMLModule, vtkSmartPointer, vtkXMLCompositeDataReader

discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkUniformGridAMR"
type
  vtkXMLUniformGridAMRReader* {.importcpp: "vtkXMLUniformGridAMRReader",
                               header: "vtkXMLUniformGridAMRReader.h", bycopy.} = object of vtkXMLCompositeDataReader
    vtkXMLUniformGridAMRReader* {.importc: "vtkXMLUniformGridAMRReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLUniformGridAMRReader {.
    importcpp: "vtkXMLUniformGridAMRReader::New(@)",
    header: "vtkXMLUniformGridAMRReader.h".}
type
  vtkXMLUniformGridAMRReaderSuperclass* = vtkXMLCompositeDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLUniformGridAMRReader::IsTypeOf(@)",
    header: "vtkXMLUniformGridAMRReader.h".}
proc IsA*(this: var vtkXMLUniformGridAMRReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLUniformGridAMRReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLUniformGridAMRReader {.
    importcpp: "vtkXMLUniformGridAMRReader::SafeDownCast(@)",
    header: "vtkXMLUniformGridAMRReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLUniformGridAMRReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLCompositeDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLUniformGridAMRReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLUniformGridAMRReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLUniformGridAMRReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLUniformGridAMRReader.h".}
proc SetMaximumLevelsToReadByDefault*(this: var vtkXMLUniformGridAMRReader;
                                     _arg: cuint) {.
    importcpp: "SetMaximumLevelsToReadByDefault",
    header: "vtkXMLUniformGridAMRReader.h".}
## !!!Ignored construct:  virtual unsigned int GetMaximumLevelsToReadByDefault ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumLevelsToReadByDefault  of  << this -> MaximumLevelsToReadByDefault ) ; return this -> MaximumLevelsToReadByDefault ; } ;
## Error: expected ';'!!!

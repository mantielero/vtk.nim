## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNetCDFCFWriter.h
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

import
  vtkIONetCDFModule, vtkWriter

discard "forward decl of vtkIdList"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkImageData"
type
  vtkNetCDFCFWriter* {.importcpp: "vtkNetCDFCFWriter",
                      header: "vtkNetCDFCFWriter.h", bycopy.} = object of vtkWriter
    vtkNetCDFCFWriter* {.importc: "vtkNetCDFCFWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkNetCDFCFWriter {.importcpp: "vtkNetCDFCFWriter::New(@)",
                                 header: "vtkNetCDFCFWriter.h".}
type
  vtkNetCDFCFWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkNetCDFCFWriter::IsTypeOf(@)", header: "vtkNetCDFCFWriter.h".}
proc IsA*(this: var vtkNetCDFCFWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkNetCDFCFWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkNetCDFCFWriter {.
    importcpp: "vtkNetCDFCFWriter::SafeDownCast(@)", header: "vtkNetCDFCFWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkNetCDFCFWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNetCDFCFWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNetCDFCFWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkNetCDFCFWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkNetCDFCFWriter.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set the file name of the file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetCellArrayNamePostfix*(this: var vtkNetCDFCFWriter; _arg: cstring) {.
    importcpp: "SetCellArrayNamePostfix", header: "vtkNetCDFCFWriter.h".}
proc GetCellArrayNamePostfix*(this: var vtkNetCDFCFWriter): cstring {.
    importcpp: "GetCellArrayNamePostfix", header: "vtkNetCDFCFWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the FillValue for all array. Care must be taken to make sure
  ##  the value fits in the value type of each array.
  ##  Fill value has the same meaning as blanking in VTK but it is stored in
  ##  the data array. This is stored in the NetCDF file.
  ##
proc SetFillValue*(this: var vtkNetCDFCFWriter; _arg: cint) {.
    importcpp: "SetFillValue", header: "vtkNetCDFCFWriter.h".}
## !!!Ignored construct:  virtual int GetFillValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FillValue  of  << this -> FillValue ) ; return this -> FillValue ; } ;
## Error: expected ';'!!!

proc SetFillValueAttributeType*(this: var vtkNetCDFCFWriter; _arg: cint) {.
    importcpp: "SetFillValueAttributeType", header: "vtkNetCDFCFWriter.h".}
## !!!Ignored construct:  virtual int GetFillValueAttributeType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributeType  of  << this -> AttributeType ) ; return this -> AttributeType ; } ;
## Error: expected ';'!!!

proc SetFillValueAttributeTypeFillBlankedAttributes*(this: var vtkNetCDFCFWriter;
    _arg: bool) {.importcpp: "SetFillValueAttributeTypeFillBlankedAttributes",
                header: "vtkNetCDFCFWriter.h".}
## !!!Ignored construct:  virtual bool GetFillValueAttributeTypeFillBlankedAttributes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FillBlankedAttributes  of  << this -> FillBlankedAttributes ) ; return this -> FillBlankedAttributes ; } ;
## Error: expected ';'!!!

proc FillBlankedAttributesOn*(this: var vtkNetCDFCFWriter) {.
    importcpp: "FillBlankedAttributesOn", header: "vtkNetCDFCFWriter.h".}
proc FillBlankedAttributesOff*(this: var vtkNetCDFCFWriter) {.
    importcpp: "FillBlankedAttributesOff", header: "vtkNetCDFCFWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Add/clear attributes that define the grid mapping (or the coordinate
  ##  reference system (CRS))
  ##
  ##  \verbatim
  ##  To obtain the correct CF conventions attribute names and values
  ##  when knowing the EPSG code use projinfo <epsg_code> This will
  ##  print the WKT string. From that you can get the attribute names
  ##  and values you need for CF convention.. The WKT attribute names
  ##  are fairly close to CF convention attribute names.  The following
  ##  link also helps with the conversion.
  ##  <a
  ##  href="https://github.com/cf-convention/cf-conventions/wiki/Mapping-from-CF-Grid-Mapping-Attributes-to-CRS-WKT-Elements">CF
  ##  Grid Mapping to WKT</a> See also <a
  ##  href="http://cfconventions.org/Data/cf-conventions/cf-conventions-1.9/cf-conventions.html#appendix-grid-mappings">CF
  ##  Grid Mapping</a> for the attributes needed for each projection.
  ##  \endverbatim
  ##
proc AddGridMappingAttribute*(this: var vtkNetCDFCFWriter; name: cstring;
                             value: cstring) {.
    importcpp: "AddGridMappingAttribute", header: "vtkNetCDFCFWriter.h".}
proc AddGridMappingAttribute*(this: var vtkNetCDFCFWriter; name: cstring;
                             value: cdouble) {.
    importcpp: "AddGridMappingAttribute", header: "vtkNetCDFCFWriter.h".}
proc ClearGridMappingAttributes*(this: var vtkNetCDFCFWriter) {.
    importcpp: "ClearGridMappingAttributes", header: "vtkNetCDFCFWriter.h".}
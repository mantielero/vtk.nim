## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGaussianCubeReader.h
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
##  @class   vtkGaussianCubeReader
##  @brief   read ASCII Gaussian Cube Data files
##
##  vtkGaussianCubeReader is a source object that reads ASCII files following
##  the description in http://www.gaussian.com/00000430.htm
##  The FileName must be specified.
##
##  @par Thanks:
##  Dr. Jean M. Favre who developed and contributed this class.
##

import
  vtkIOChemistryModule, vtkMoleculeReaderBase

discard "forward decl of vtkImageData"
discard "forward decl of vtkTransform"
type
  vtkGaussianCubeReader* {.importcpp: "vtkGaussianCubeReader",
                          header: "vtkGaussianCubeReader.h", bycopy.} = object of vtkMoleculeReaderBase
    vtkGaussianCubeReader* {.importc: "vtkGaussianCubeReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGaussianCubeReader {.importcpp: "vtkGaussianCubeReader::New(@)",
                                     header: "vtkGaussianCubeReader.h".}
type
  vtkGaussianCubeReaderSuperclass* = vtkMoleculeReaderBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGaussianCubeReader::IsTypeOf(@)",
    header: "vtkGaussianCubeReader.h".}
proc IsA*(this: var vtkGaussianCubeReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGaussianCubeReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGaussianCubeReader {.
    importcpp: "vtkGaussianCubeReader::SafeDownCast(@)",
    header: "vtkGaussianCubeReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGaussianCubeReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeReaderBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGaussianCubeReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGaussianCubeReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGaussianCubeReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGaussianCubeReader.h".}
proc GetnameTransform*(this: var vtkGaussianCubeReader): ptr vtkTransform {.
    importcpp: "GetnameTransform", header: "vtkGaussianCubeReader.h".}
proc GetGridOutput*(this: var vtkGaussianCubeReader): ptr vtkImageData {.
    importcpp: "GetGridOutput", header: "vtkGaussianCubeReader.h".}
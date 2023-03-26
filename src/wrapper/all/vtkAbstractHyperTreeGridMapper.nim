## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractHyperTreeGridMapper.h
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
##  @class   vtkAbstractHyperTreeGridMapper
##  @brief   Abstract class for a HyperTreeGrid mapper
##
##  vtkAbstractHyperTreeGridMapper is the abstract definition of a HyperTreeGrid mapper.
##  Several  basic types of volume mappers are supported.
##
##  @sa
##  vtkHyperTreeGrid vtkUniformHyperTreeGrid
##
##  @par Thanks:
##  This class was written by Philippe Pebay and Meriadeg Perrinel,
##  NexGen Analytics 2018
##  This worked was based on an idea of Guenole Harel and Jacques-Bernard Lekien
##  This work was supported by Commissariat a l'Energie Atomique (CEA/DIF)
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkAbstractVolumeMapper, vtkRenderingCoreModule

discard "forward decl of vtkBitArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkUniformHyperTreeGrid"
type
  vtkAbstractHyperTreeGridMapper* {.importcpp: "vtkAbstractHyperTreeGridMapper",
                                   header: "vtkAbstractHyperTreeGridMapper.h",
                                   bycopy.} = object of vtkAbstractVolumeMapper
    vtkAbstractHyperTreeGridMapper* {.importc: "vtkAbstractHyperTreeGridMapper".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  Keep track of coordinate conversion matrices
    ##
    ## /@}
    ## *
    ##  Keep track of whether pixelize grid is current
    ##
    ## *
    ##  Orientation of input grid when dimension < 3
    ##
    ## *
    ##  Reference to the renderer being used
    ##
    ## *
    ##  Scalar range for color lookup table when dimension < 3
    ##
    ## *
    ##  Color map used only when dimension < 3
    ##
    ## *
    ##  Scale factor for adaptive view
    ##
    ## *
    ##  Radius parameter for adaptive view
    ##
    ## *
    ##  First axis parameter for adaptive view
    ##
    ## *
    ##  Second axis parameter for adaptive view
    ##
    ## *
    ##  Maximum depth parameter for adaptive view
    ##
    ## *
    ##  Parallel projection parameter for adaptive view
    ##
    ## *
    ##  Last camera parallel scale for adaptive view
    ##
    ## *
    ##  Viewport size for computed image
    ##
    ## *
    ##  Last renderer size parameters for adaptive view
    ##
    ## *
    ##  Last camera focal point coordinates for adaptive view
    ##
    ## *
    ##  Keep track of current view orientation
    ##
    ## *
    ##  Internal frame buffer
    ##
    ## *
    ##  Internal z-buffer
    ##

  vtkAbstractHyperTreeGridMapperSuperclass* = vtkAbstractVolumeMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractHyperTreeGridMapper::IsTypeOf(@)",
    header: "vtkAbstractHyperTreeGridMapper.h".}
proc IsA*(this: var vtkAbstractHyperTreeGridMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractHyperTreeGridMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractHyperTreeGridMapper {.
    importcpp: "vtkAbstractHyperTreeGridMapper::SafeDownCast(@)",
    header: "vtkAbstractHyperTreeGridMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractHyperTreeGridMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractHyperTreeGridMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractHyperTreeGridMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractHyperTreeGridMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkAbstractHyperTreeGridMapper.h".}
proc SetInputData*(this: var vtkAbstractHyperTreeGridMapper;
                  a2: ptr vtkUniformHyperTreeGrid) {.importcpp: "SetInputData",
    header: "vtkAbstractHyperTreeGridMapper.h".}
proc SetInputConnection*(this: var vtkAbstractHyperTreeGridMapper; a2: cint;
                        a3: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtkAbstractHyperTreeGridMapper.h".}
proc SetInputConnection*(this: var vtkAbstractHyperTreeGridMapper;
                        input: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtkAbstractHyperTreeGridMapper.h".}
proc GetInput*(this: var vtkAbstractHyperTreeGridMapper): ptr vtkUniformHyperTreeGrid {.
    importcpp: "GetInput", header: "vtkAbstractHyperTreeGridMapper.h".}
proc SetRenderer*(this: var vtkAbstractHyperTreeGridMapper; a2: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkAbstractHyperTreeGridMapper.h".}
proc GetnameRenderer*(this: var vtkAbstractHyperTreeGridMapper): ptr vtkRenderer {.
    importcpp: "GetnameRenderer", header: "vtkAbstractHyperTreeGridMapper.h".}
  ## /@}
  ## *
  ##  Set the scale factor
  ##
proc SetScale*(this: var vtkAbstractHyperTreeGridMapper; _arg: cdouble) {.
    importcpp: "SetScale", header: "vtkAbstractHyperTreeGridMapper.h".}
  ## /@{
  ## *
  ##  Set/Get the color map attached to this HyperTreeGrid mapper
  ##  A linear lookup table is provided by default
  ##
proc SetColorMap*(this: var vtkAbstractHyperTreeGridMapper;
                 a2: ptr vtkScalarsToColors) {.importcpp: "SetColorMap",
    header: "vtkAbstractHyperTreeGridMapper.h".}
proc GetnameRendererColorMap*(this: var vtkAbstractHyperTreeGridMapper): ptr vtkScalarsToColors {.
    importcpp: "GetnameRendererColorMap",
    header: "vtkAbstractHyperTreeGridMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify range in terms of scalar minimum and maximum.
  ##  These values are used to map scalars into lookup table
  ##  Has no effect when dimension > 2
  ##  Used only when ColorMap is a lookup table instance
  ##
proc SetScalarRange*(this: var vtkAbstractHyperTreeGridMapper; a2: cdouble;
                    a3: cdouble) {.importcpp: "SetScalarRange",
                                 header: "vtkAbstractHyperTreeGridMapper.h".}
proc SetScalarRange*(this: var vtkAbstractHyperTreeGridMapper; a2: ptr cdouble) {.
    importcpp: "SetScalarRange", header: "vtkAbstractHyperTreeGridMapper.h".}
## !!!Ignored construct:  virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ScalarRange [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Get image size
##  virtual int * GetScalarRangeViewportSizeViewportSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ViewportSize  pointer  << this -> ViewportSize ) ; return this -> ViewportSize ; } VTK_WRAPEXCLUDE virtual void GetScalarRangeViewportSizeViewportSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ViewportSize [ i ] ; } } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkAbstractHyperTreeGridMapper): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkAbstractHyperTreeGridMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkAbstractHyperTreeGridMapper;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkAbstractHyperTreeGridMapper.h".}
proc Render*(this: var vtkAbstractHyperTreeGridMapper; a2: ptr vtkRenderer;
            a3: ptr vtkVolume) {.importcpp: "Render",
                              header: "vtkAbstractHyperTreeGridMapper.h".}
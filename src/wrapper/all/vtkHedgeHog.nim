## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHedgeHog.h
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
##  @class   vtkHedgeHog
##  @brief   create oriented lines from vector data
##
##  vtkHedgeHog creates oriented lines from the input data set. Line
##  length is controlled by vector (or normal) magnitude times scale
##  factor. If VectorMode is UseNormal, normals determine the orientation
##  of the lines. Lines are colored by scalar data, if available.
##

## !!!Ignored construct:  # vtkHedgeHog_h [NewLine] # vtkHedgeHog_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_USE_VECTOR 0 [NewLine] # VTK_USE_NORMAL 1 [NewLine] class VTKFILTERSCORE_EXPORT vtkHedgeHog : public vtkPolyDataAlgorithm { public : static vtkHedgeHog * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHedgeHog :: IsTypeOf ( type ) ; } static vtkHedgeHog * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHedgeHog * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHedgeHog * NewInstance ( ) const { return vtkHedgeHog :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHedgeHog :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHedgeHog :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set scale factor to control size of oriented lines.
##  virtual void SetScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != _arg ) { this -> ScaleFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  Specify whether to use vector or normal to perform vector operations.
##  virtual void SetScaleFactorVectorMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VectorMode  to  << _arg ) ; if ( this -> VectorMode != _arg ) { this -> VectorMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetScaleFactorVectorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorMode  of  << this -> VectorMode ) ; return this -> VectorMode ; } ; void SetVectorModeToUseVector ( ) { this -> SetVectorMode ( VTK_USE_VECTOR ) ; } void SetVectorModeToUseNormal ( ) { this -> SetVectorMode ( VTK_USE_NORMAL ) ; } const char * GetVectorModeAsString ( ) ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetScaleFactorVectorModeOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetScaleFactorVectorModeOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkHedgeHog ( ) ; ~ vtkHedgeHog ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; double ScaleFactor ; int VectorMode ;  Orient/scale via normal or via vector data int OutputPointsPrecision ; private : vtkHedgeHog ( const vtkHedgeHog & ) = delete ; void operator = ( const vtkHedgeHog & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Return the vector mode as a character string.
##

proc GetVectorModeAsString*(): cstring {.importcpp: "VTKFILTERSCORE_EXPORT::GetVectorModeAsString(@)",
                                      header: "vtkHedgeHog.h".}
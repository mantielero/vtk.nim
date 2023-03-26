## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAppendPoints.h
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
##  @class   vtkAppendPoints
##  @brief   appends points of one or more vtkPolyData data sets
##
##
##  vtkAppendPoints is a filter that appends the points and associated data
##  of one or more polygonal (vtkPolyData) datasets. This filter can optionally
##  add a new array marking the input index that the point came from.
##
##  @sa
##  vtkAppendFilter vtkAppendPolyData
##

## !!!Ignored construct:  # vtkAppendPoints_h [NewLine] # vtkAppendPoints_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkAppendPoints : public vtkPolyDataAlgorithm { public : static vtkAppendPoints * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAppendPoints :: IsTypeOf ( type ) ; } static vtkAppendPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAppendPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAppendPoints * NewInstance ( ) const { return vtkAppendPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAppendPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAppendPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Sets the output array name to fill with the input connection index
##  for each point. This provides a way to trace a point back to a
##  particular input. If this is nullptr (the default), the array is not generated.
##  virtual void SetInputIdArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InputIdArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> InputIdArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> InputIdArrayName && _arg && ( ! strcmp ( this -> InputIdArrayName , _arg ) ) ) { return ; } delete [ ] this -> InputIdArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> InputIdArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> InputIdArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetInputIdArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << InputIdArrayName  of  << ( this -> InputIdArrayName ? this -> InputIdArrayName : (null) ) ) ; return this -> InputIdArrayName ; } ; /@} /@{ *
##  Set/get the desired precision for the output type. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings. If the desired precision is
##  DEFAULT_PRECISION and any of the inputs are double precision, then the
##  output precision will be double precision. Otherwise, if the desired
##  precision is DEFAULT_PRECISION and all the inputs are single precision,
##  then the output will be single precision.
##  virtual void SetOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkAppendPoints ( ) ; ~ vtkAppendPoints ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; char * InputIdArrayName ; int OutputPointsPrecision ; private : vtkAppendPoints ( const vtkAppendPoints & ) = delete ; void operator = ( const vtkAppendPoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

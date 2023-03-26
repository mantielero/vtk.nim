## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkAppendArcLength.h
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
##  @class   vtkAppendArcLength
##  @brief   appends Arc length for input poly lines.
##
##  vtkAppendArcLength is used for filter such as plot-over-line. In such cases,
##  we need to add an attribute array that is the arc_length over the length of
##  the probed line. That's when vtkAppendArcLength can be used. It adds a new
##  point-data array named "arc_length" with the computed arc length for each of
##  the polylines in the input. For all other cell types, the arc length is set
##  to 0.
##  @warning
##  This filter assumes that cells don't share points.
##

## !!!Ignored construct:  # vtkAppendArcLength_h [NewLine] # vtkAppendArcLength_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkAppendArcLength : public vtkPolyDataAlgorithm { public : static vtkAppendArcLength * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAppendArcLength :: IsTypeOf ( type ) ; } static vtkAppendArcLength * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAppendArcLength * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAppendArcLength * NewInstance ( ) const { return vtkAppendArcLength :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAppendArcLength :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAppendArcLength :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkAppendArcLength ( ) ; ~ vtkAppendArcLength ( ) override ; /@{ *
##  This is called by the superclass.
##  This is the method you should override.
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkAppendArcLength ( const vtkAppendArcLength & ) = delete ; void operator = ( const vtkAppendArcLength & ) = delete ; /@} } ;
## Error: token expected: ; but got: [identifier]!!!

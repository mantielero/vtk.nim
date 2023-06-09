## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractVOI.h
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
##  @class   vtkmExtractVOI
##  @brief   select piece (e.g., volume of interest) and/or subsample structured points dataset
##
##  vtkmExtractVOI is a filter that selects a portion of an input structured
##  points dataset, or subsamples an input dataset. (The selected portion of
##  interested is referred to as the Volume Of Interest, or VOI.) The output of
##  this filter is a structured points dataset. The filter treats input data
##  of any topological dimension (i.e., point, line, image, or volume) and can
##  generate output data of any topological dimension.
##
##  To use this filter set the VOI ivar which are i-j-k min/max indices that
##  specify a rectangular region in the data. (Note that these are 0-offset.)
##  You can also specify a sampling rate to subsample the data.
##
##  Typical applications of this filter are to extract a slice from a volume
##  for image processing, subsampling large volumes to reduce data size, or
##  extracting regions of a volume with interesting data.
##
##

## !!!Ignored construct:  # vtkmExtractVOI_h [NewLine] # vtkmExtractVOI_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h  for export macro # vtkExtractVOI.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmExtractVOI : public vtkExtractVOI { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExtractVOI Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExtractVOI :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmExtractVOI :: IsTypeOf ( type ) ; } static vtkmExtractVOI * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmExtractVOI * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmExtractVOI * NewInstance ( ) const { return vtkmExtractVOI :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractVOI :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmExtractVOI :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmExtractVOI :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmExtractVOI * New ( ) ; /@{ *
##  When this flag is off (the default), then the computation will fall back
##  to the serial VTK version if VTK-m fails to run. When the flag is on,
##  the filter will generate an error if VTK-m fails to run. This is mostly
##  useful in testing to make sure the expected algorithm is run.
##  virtual vtkTypeBool GetForceVTKm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceVTKm  of  << this -> ForceVTKm ) ; return this -> ForceVTKm ; } ; virtual void SetForceVTKm ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForceVTKm  to  << _arg ) ; if ( this -> ForceVTKm != _arg ) { this -> ForceVTKm = _arg ; this -> Modified ( ) ; } } ; virtual void ForceVTKmOn ( ) { this -> SetForceVTKm ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ForceVTKmOff ( ) { this -> SetForceVTKm ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkmExtractVOI ( ) ; ~ vtkmExtractVOI ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool ForceVTKm = false ; private : vtkmExtractVOI ( const vtkmExtractVOI & ) = delete ; void operator = ( const vtkmExtractVOI & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

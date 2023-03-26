## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPSphereSource.h
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
##  @class   vtkPSphereSource
##  @brief   sphere source that supports pieces
##

## !!!Ignored construct:  # vtkPSphereSource_h [NewLine] # vtkPSphereSource_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkSphereSource.h [NewLine] class VTKFILTERSPARALLEL_EXPORT vtkPSphereSource : public vtkSphereSource { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSphereSource Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSphereSource :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPSphereSource :: IsTypeOf ( type ) ; } static vtkPSphereSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPSphereSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPSphereSource * NewInstance ( ) const { return vtkPSphereSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSphereSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPSphereSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPSphereSource :: New ( ) ; } public : ; /@{ *
##  Construct sphere with radius=0.5 and default resolution 8 in both Phi
##  and Theta directions. Theta ranges from (0,360) and phi (0,180) degrees.
##  static vtkPSphereSource * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Get the estimated memory size in kibibytes (1024 bytes).
##  unsigned long GetEstimatedMemorySize ( ) ; protected : vtkPSphereSource ( ) = default ; ~ vtkPSphereSource ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkPSphereSource ( const vtkPSphereSource & ) = delete ; void operator = ( const vtkPSphereSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGridToTetrahedra.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkRectilinearGridToPointSet
##  @brief   Converts a vtkRectilinearGrid to a vtkPointSet
##
##
##  vtkRectilinearGridToPointSet takes a vtkRectilinearGrid as an image and
##  outputs an equivalent vtkStructuredGrid (which is a subclass of
##  vtkPointSet).
##
##  @par Thanks:
##  This class was developed by Kenneth Moreland (kmorel@sandia.gov) from
##  Sandia National Laboratories.
##

## !!!Ignored construct:  # vtkRectilinearGridToPointSet_h [NewLine] # vtkRectilinearGridToPointSet_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkStructuredGridAlgorithm.h [NewLine] class vtkRectilinearGrid ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStructuredData"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkRectilinearGridToPointSet : public vtkStructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRectilinearGridToPointSet :: IsTypeOf ( type ) ; } static vtkRectilinearGridToPointSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRectilinearGridToPointSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRectilinearGridToPointSet * NewInstance ( ) const { return vtkRectilinearGridToPointSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGridToPointSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGridToPointSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkRectilinearGridToPointSet * New ( ) ; protected : vtkRectilinearGridToPointSet ( ) ; ~ vtkRectilinearGridToPointSet ( ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkRectilinearGridToPointSet ( const vtkRectilinearGridToPointSet & ) = delete ; void operator = ( const vtkRectilinearGridToPointSet & ) = delete ; int CopyStructure ( vtkStructuredGrid * outData , vtkRectilinearGrid * inData ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

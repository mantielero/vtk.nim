## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRUtilities.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkParallelAMRUtilities
##
##
##   A concrete instance of vtkObject that employs a singleton design
##   pattern and implements functionality for AMR specific operations.
##
##  @sa
##   vtkOverlappingAMR, vtkAMRBox
##

## !!!Ignored construct:  # vtkParallelAMRUtilities_h [NewLine] # vtkParallelAMRUtilities_h [NewLine] # vtkAMRUtilities.h [NewLine] # vtkFiltersAMRModule.h  For export macro # < vector >  For C++ vector [NewLine]  Forward declarations class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkOverlappingAMR"
## !!!Ignored construct:  class VTKFILTERSAMR_EXPORT vtkParallelAMRUtilities : public vtkAMRUtilities { public :  Standard Routines protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAMRUtilities Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAMRUtilities :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParallelAMRUtilities :: IsTypeOf ( type ) ; } static vtkParallelAMRUtilities * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParallelAMRUtilities * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParallelAMRUtilities * NewInstance ( ) const { return vtkParallelAMRUtilities :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAMRUtilities :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParallelAMRUtilities :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParallelAMRUtilities :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  This method detects and strips partially overlapping cells from a
##  given AMR dataset. If ghost layers are detected, they are removed and
##  new grid instances are created to represent the stripped
##  data-set otherwise, each block is shallow-copied.
##
##  .SECTION Assumptions
##  1) The ghosted AMR data must have complete metadata information.
##  static void StripGhostLayers ( vtkOverlappingAMR * ghostedAMRData , vtkOverlappingAMR * strippedAMRData , vtkMultiProcessController * myController ) ; *
##  Compute map from block indices to process ids
##  static void DistributeProcessInformation ( vtkOverlappingAMR * amr , vtkMultiProcessController * myController , std :: vector < int > & ProcessMap ) ; *
##  Blank cells in overlapping AMR
##  static void BlankCells ( vtkOverlappingAMR * amr , vtkMultiProcessController * myController ) ; private : vtkParallelAMRUtilities ( const vtkParallelAMRUtilities & ) = delete ; void operator = ( const vtkParallelAMRUtilities & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

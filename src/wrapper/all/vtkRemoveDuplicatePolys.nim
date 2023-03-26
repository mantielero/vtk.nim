## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRemoveDuplicatePolys.h
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
##  @class   vtkRemoveDuplicatePolys
##  @brief   remove duplicate/degenerate polygons
##
##  vtkRemoveDuplicatePolys is a filter that removes duplicate or degenerate
##  polygons. Assumes the input grid does not contain duplicate points. You
##  may want to run vtkCleanPolyData first to assert it. If duplicated
##  polygons are found they are removed in the output.
##
##  @sa
##  vtkCleanPolyData
##

## !!!Ignored construct:  # vtkRemoveDuplicatePolys_h [NewLine] # vtkRemoveDuplicatePolys_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkRemoveDuplicatePolys : public vtkPolyDataAlgorithm { public : static vtkRemoveDuplicatePolys * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRemoveDuplicatePolys :: IsTypeOf ( type ) ; } static vtkRemoveDuplicatePolys * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRemoveDuplicatePolys * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRemoveDuplicatePolys * NewInstance ( ) const { return vtkRemoveDuplicatePolys :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRemoveDuplicatePolys :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRemoveDuplicatePolys :: New ( ) ; } public : ; protected : vtkRemoveDuplicatePolys ( ) ; ~ vtkRemoveDuplicatePolys ( ) override ;  Usual data generation method. int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkRemoveDuplicatePolys ( const vtkRemoveDuplicatePolys & ) = delete ; void operator = ( const vtkRemoveDuplicatePolys & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConvertSelectionDomain.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkConvertSelectionDomain
##  @brief   Convert a selection from one domain to another
##
##
##  vtkConvertSelectionDomain converts a selection from one domain to another
##  using known domain mappings. The domain mappings are described by a
##  vtkMultiBlockDataSet containing one or more vtkTables.
##
##  The first input port is for the input selection (or collection of annotations
##  in a vtkAnnotationLayers object), while the second port
##  is for the multi-block of mappings, and the third port is for the
##  data that is being selected on.
##
##  If the second or third port is not set, this filter will pass the
##  selection/annotation to the output unchanged.
##
##  The second output is the selection associated with the "current annotation"
##  normally representing the current interactive selection.
##

## !!!Ignored construct:  # vtkConvertSelectionDomain_h [NewLine] # vtkConvertSelectionDomain_h [NewLine] # vtkPassInputTypeAlgorithm.h [NewLine] # vtkViewsCoreModule.h  For export macro [NewLine] class vtkAnnotation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKVIEWSCORE_EXPORT vtkConvertSelectionDomain : public vtkPassInputTypeAlgorithm { public : static vtkConvertSelectionDomain * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConvertSelectionDomain :: IsTypeOf ( type ) ; } static vtkConvertSelectionDomain * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConvertSelectionDomain * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConvertSelectionDomain * NewInstance ( ) const { return vtkConvertSelectionDomain :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConvertSelectionDomain :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConvertSelectionDomain :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkConvertSelectionDomain ( ) ; ~ vtkConvertSelectionDomain ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; private : vtkConvertSelectionDomain ( const vtkConvertSelectionDomain & ) = delete ; void operator = ( const vtkConvertSelectionDomain & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

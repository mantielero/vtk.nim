## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridOutlineFilter.h
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
##  @class   vtkHyperTreeGridOutlineFilter
##  @brief   create wireframe outline for arbitrary data set
##
##  vtkHyperTreeGridOutlineFilter is a filter that generates a wireframe outline of
##  HyperTreeGrid. The outline consists of the twelve edges of the dataset
##  bounding box.
##
##  @sa
##  vtkOutlineFilter
##
##  This class was optimized by Jacques-Bernard Lekien, 2019.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridOutlineFilter_h [NewLine] # vtkHyperTreeGridOutlineFilter_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkHyperTreeGridAlgorithm.h [NewLine] class vtkOutlineSource ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSMODELING_EXPORT vtkHyperTreeGridOutlineFilter : public vtkHyperTreeGridAlgorithm { public : static vtkHyperTreeGridOutlineFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridOutlineFilter :: IsTypeOf ( type ) ; } static vtkHyperTreeGridOutlineFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridOutlineFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridOutlineFilter * NewInstance ( ) const { return vtkHyperTreeGridOutlineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridOutlineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridOutlineFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Generate solid faces for the box. This is off by default.
##  virtual void SetGenerateFaces ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateFaces  to  << _arg ) ; if ( this -> GenerateFaces != _arg ) { this -> GenerateFaces = _arg ; this -> Modified ( ) ; } } ; virtual void GenerateFacesOn ( ) { this -> SetGenerateFaces ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateFacesOff ( ) { this -> SetGenerateFaces ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetGenerateFaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateFaces  of  << this -> GenerateFaces ) ; return this -> GenerateFaces ; } ; /@} protected : vtkHyperTreeGridOutlineFilter ( ) ; ~ vtkHyperTreeGridOutlineFilter ( ) override ; vtkTypeBool GenerateFaces ; vtkOutlineSource * OutlineSource ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ;  JBL Pour moi, c'est un defaut de design de vtkHyperTreeGridAlgorithm int ProcessTrees ( vtkHyperTreeGrid * input , vtkDataObject * outputDO ) override ; private : vtkHyperTreeGridOutlineFilter ( const vtkHyperTreeGridOutlineFilter & ) = delete ; void operator = ( const vtkHyperTreeGridOutlineFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

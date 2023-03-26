## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOBBDicer.h
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
##  @class   vtkOBBDicer
##  @brief   divide dataset into spatially aggregated pieces
##
##  vtkOBBDicer separates the cells of a dataset into spatially
##  aggregated pieces using a Oriented Bounding Box (OBB). These pieces
##  can then be operated on by other filters (e.g., vtkThreshold). One
##  application is to break very large polygonal models into pieces and
##  performing viewing and occlusion culling on the pieces.
##
##  Refer to the superclass documentation (vtkDicer) for more information.
##
##  @sa
##  vtkDicer vtkConnectedDicer
##

## !!!Ignored construct:  # vtkOBBDicer_h [NewLine] # vtkOBBDicer_h [NewLine] # vtkDicer.h [NewLine] # vtkFiltersGeneralModule.h  For export macro [NewLine] class vtkOBBNode ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkShortArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkOBBDicer : public vtkDicer { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDicer Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDicer :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOBBDicer :: IsTypeOf ( type ) ; } static vtkOBBDicer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOBBDicer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOBBDicer * NewInstance ( ) const { return vtkOBBDicer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDicer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOBBDicer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOBBDicer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Instantiate an object.
##  static vtkOBBDicer * New ( ) ; protected : vtkOBBDicer ( ) = default ; ~ vtkOBBDicer ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  implementation ivars and methods void BuildTree ( vtkIdList * ptIds , vtkOBBNode * OBBptr , vtkDataSet * input ) ; void MarkPoints ( vtkOBBNode * OBBptr , vtkShortArray * groupIds ) ; void DeleteTree ( vtkOBBNode * OBBptr ) ; vtkPoints * PointsList ; private : vtkOBBDicer ( const vtkOBBDicer & ) = delete ; void operator = ( const vtkOBBDicer & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

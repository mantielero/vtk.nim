## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridThreshold.h
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
##  @class   vtkHyperTreeGridThreshold
##  @brief   Extract cells from a hyper tree grid
##  where selected scalar value is within given range.
##
##
##  This filter extracts cells from a hyper tree grid that satisfy the
##  following threshold: a cell is considered to be within range if its
##  value for the active scalar is within a specified range (inclusive).
##  The output remains a hyper tree grid.
##  JB Un parametre (JustCreateNewMask=true) permet de ne pas faire
##  le choix de la creation d'un nouveau HTG mais
##  de redefinir juste le masque.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm vtkThreshold
##
##  @par Thanks:
##  This class was written by Guenole Harel and Jacques-Bernard Lekien 2014
##  This class was revised by Philippe Pebay, 2016
##  This class was optimized by Jacques-Bernard Lekien, 2018.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridThreshold_h [NewLine] # vtkHyperTreeGridThreshold_h [NewLine] # vtkFiltersHyperTreeModule.h  For export macro # vtkHyperTreeGridAlgorithm.h [NewLine] class vtkBitArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
## !!!Ignored construct:  class VTKFILTERSHYPERTREE_EXPORT vtkHyperTreeGridThreshold : public vtkHyperTreeGridAlgorithm { public : static vtkHyperTreeGridThreshold * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridThreshold :: IsTypeOf ( type ) ; } static vtkHyperTreeGridThreshold * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridThreshold * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridThreshold * NewInstance ( ) const { return vtkHyperTreeGridThreshold :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridThreshold :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridThreshold :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get True, create a new mask ; false, create a new HTG.
##  virtual void SetJustCreateNewMask ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  JustCreateNewMask  to  << _arg ) ; if ( this -> JustCreateNewMask != _arg ) { this -> JustCreateNewMask = _arg ; this -> Modified ( ) ; } } ; virtual bool GetJustCreateNewMask ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << JustCreateNewMask  of  << this -> JustCreateNewMask ) ; return this -> JustCreateNewMask ; } ; /@} /@{ *
##  Set/Get minimum scalar value of threshold
##  virtual void SetJustCreateNewMaskLowerThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LowerThreshold  to  << _arg ) ; if ( this -> LowerThreshold != _arg ) { this -> LowerThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetJustCreateNewMaskLowerThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerThreshold  of  << this -> LowerThreshold ) ; return this -> LowerThreshold ; } ; /@} /@{ *
##  Set/Get maximum scalar value of threshold
##  virtual void SetJustCreateNewMaskLowerThresholdUpperThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UpperThreshold  to  << _arg ) ; if ( this -> UpperThreshold != _arg ) { this -> UpperThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetJustCreateNewMaskLowerThresholdUpperThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperThreshold  of  << this -> UpperThreshold ) ; return this -> UpperThreshold ; } ; /@} *
##  Convenience method to set both threshold values at once
##  void ThresholdBetween ( double , double ) ; protected : vtkHyperTreeGridThreshold ( ) ; ~ vtkHyperTreeGridThreshold ( ) override ; *
##  For this algorithm the output is a vtkHyperTreeGrid instance
##  int FillOutputPortInformation ( int , vtkInformation * ) override ; *
##  Main routine to extract cells based on thresholded value
##  int ProcessTrees ( vtkHyperTreeGrid * , vtkDataObject * ) override ; *
##  Recursively descend into tree down to leaves
##  bool RecursivelyProcessTree ( vtkHyperTreeGridNonOrientedCursor * , vtkHyperTreeGridNonOrientedCursor * ) ; bool RecursivelyProcessTreeWithCreateNewMask ( vtkHyperTreeGridNonOrientedCursor * ) ; *
##  LowerThreshold scalar value to be accepted
##  double LowerThreshold ; *
##  UpperThreshold scalar value to be accepted
##  double UpperThreshold ; *
##  Input material mask
##  vtkBitArray * InMask ; *
##  Output material mask constructed by this filter
##  vtkBitArray * OutMask ; *
##  Keep track of current index in output hyper tree grid
##  vtkIdType CurrentId ; *
##  Keep track of selected input scalars
##  vtkDataArray * InScalars ; *
##  With or without copy
##  bool JustCreateNewMask ; private : vtkHyperTreeGridThreshold ( const vtkHyperTreeGridThreshold & ) = delete ; void operator = ( const vtkHyperTreeGridThreshold & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

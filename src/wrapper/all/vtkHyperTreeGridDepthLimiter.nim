## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridDepthLimiter.h
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
##  @class   vtkHyperTreeGridDepthLimiter
##  @brief   Hyper tree grid level extraction
##
##
##  Extracts all levels down to a specified depth from a HyperTreeGrid
##  representation.
##  If the required depth is greater or equal to the maximum level of the
##  input grid, then the output is identical.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm vtkUniformHyperTreeGrid
##
##  @par Thanks:
##  This class was written by Guenole Harel and Jacques-Bernard Lekien 2014
##  This class was modified by Philippe Pebay, 2016
##  This class was modified, 2018, and optimized, 2019, by Jacques-Bernard Lekien,
##  by DepthLimiter directly managed by HyperTreeGrid and (super)cursors.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridDepthLimiter_h [NewLine] # vtkHyperTreeGridDepthLimiter_h [NewLine] # vtkFiltersHyperTreeModule.h  For export macro # vtkHyperTreeGridAlgorithm.h [NewLine] class vtkBitArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
## !!!Ignored construct:  class VTKFILTERSHYPERTREE_EXPORT vtkHyperTreeGridDepthLimiter : public vtkHyperTreeGridAlgorithm { public : static vtkHyperTreeGridDepthLimiter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridDepthLimiter :: IsTypeOf ( type ) ; } static vtkHyperTreeGridDepthLimiter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridDepthLimiter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridDepthLimiter * NewInstance ( ) const { return vtkHyperTreeGridDepthLimiter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridDepthLimiter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridDepthLimiter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get True, create a new mask ; False, create a new vtkHyperTreeGrid (HTG)
##  Actually, setting to true no longer creates a new mask
##  but sets an attribute of the HTG that is used in the HTG and sliders.
##  The name of this option is historical and being kept for retro-compatibility reasons.
##  Default is true.
##  virtual void SetJustCreateNewMask ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  JustCreateNewMask  to  << _arg ) ; if ( this -> JustCreateNewMask != _arg ) { this -> JustCreateNewMask = _arg ; this -> Modified ( ) ; } } ; virtual bool GetJustCreateNewMask ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << JustCreateNewMask  of  << this -> JustCreateNewMask ) ; return this -> JustCreateNewMask ; } ; /@} /@{ *
##  Set/Get maximum depth to which output grid should be limited
##  Default is 0.
##  virtual void SetJustCreateNewMaskDepth ( unsigned int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Depth  to  << _arg ) ; if ( this -> Depth != _arg ) { this -> Depth = _arg ; this -> Modified ( ) ; } } ; virtual unsigned int GetJustCreateNewMaskDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Depth  of  << this -> Depth ) ; return this -> Depth ; } ; /@} protected : vtkHyperTreeGridDepthLimiter ( ) ; ~ vtkHyperTreeGridDepthLimiter ( ) override ; *
##  For this algorithm the output is a vtkHyperTreeGrid or
##  vtkUniformHyperTreeGrid instance
##  int FillOutputPortInformation ( int , vtkInformation * ) override ; *
##  Main routine to extract hyper tree grid levels
##  int ProcessTrees ( vtkHyperTreeGrid * , vtkDataObject * ) override ; *
##  Recursively descend into tree down to leaves
##  void RecursivelyProcessTree ( vtkHyperTreeGridNonOrientedCursor * , vtkHyperTreeGridNonOrientedCursor * ) ; *
##  Maximum depth of hyper tree grid to be extracted
##  unsigned int Depth ; *
##  Input mask
##  vtkBitArray * InMask ; *
##  Output mask constructed by this filter
##  vtkBitArray * OutMask ; *
##  Keep track of current index in output hyper tree grid
##  vtkIdType CurrentId ; *
##  With or without copy
##  bool JustCreateNewMask ; private : vtkHyperTreeGridDepthLimiter ( const vtkHyperTreeGridDepthLimiter & ) = delete ; void operator = ( const vtkHyperTreeGridDepthLimiter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

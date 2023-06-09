## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSMPContourGrid.h
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
##  @class   vtkSMPContourGrid
##  @brief   a subclass of vtkContourGrid that works in parallel
##  vtkSMPContourGrid performs the same functionaliy as vtkContourGrid but does
##  it using multiple threads. This will probably be merged with vtkContourGrid
##  in the future.
##

## !!!Ignored construct:  # vtkSMPContourGrid_h [NewLine] # vtkSMPContourGrid_h [NewLine] # vtkContourGrid.h [NewLine] # vtkFiltersSMPModule.h  For export macro [NewLine] class VTKFILTERSSMP_EXPORT vtkSMPContourGrid : public vtkContourGrid { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkContourGrid Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkContourGrid :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSMPContourGrid :: IsTypeOf ( type ) ; } static vtkSMPContourGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSMPContourGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSMPContourGrid * NewInstance ( ) const { return vtkSMPContourGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContourGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSMPContourGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSMPContourGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Constructor.
##  static vtkSMPContourGrid * New ( ) ; /@{ *
##  If MergePieces is true (default), this filter will merge all
##  pieces generated by processing the input with multiple threads.
##  The output will be a vtkPolyData. Note that this has a slight overhead
##  which becomes more significant as the number of threads used grows.
##  If MergePieces is false, this filter will generate a vtkMultiBlock
##  of vtkPolyData where the number of pieces will be equal to the number
##  of threads used.
##  virtual void SetMergePieces ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MergePieces  to  << _arg ) ; if ( this -> MergePieces != _arg ) { this -> MergePieces = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMergePieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergePieces  of  << this -> MergePieces ) ; return this -> MergePieces ; } ; virtual void MergePiecesOn ( ) { this -> SetMergePieces ( static_cast < bool > ( 1 ) ) ; } virtual void MergePiecesOff ( ) { this -> SetMergePieces ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Please see vtkAlgorithm for details.
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; protected : vtkSMPContourGrid ( ) ; ~ vtkSMPContourGrid ( ) override ; virtual int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; bool MergePieces ; private : vtkSMPContourGrid ( const vtkSMPContourGrid & ) = delete ; void operator = ( const vtkSMPContourGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAMRInterpolatedVelocityField.h
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
##  @class   vtkAMRInterpolatedVelocityField
##  @brief   A concrete class for obtaining
##   the interpolated velocity values at a point in AMR data.
##
##  The main functionality supported here is the point location inside
##  vtkOverlappingAMR data set.
##

## !!!Ignored construct:  # vtkAMRInterpolatedVelocityField_h [NewLine] # vtkAMRInterpolatedVelocityField_h [NewLine] # vtkFiltersFlowPathsModule.h  For export macro [NewLine] # vtkAbstractInterpolatedVelocityField.h [NewLine] class vtkOverlappingAMR ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSFLOWPATHS_EXPORT vtkAMRInterpolatedVelocityField : public vtkAbstractInterpolatedVelocityField { public : /@{ *
##  Standard methods for obtaining type information and printing the object state.
##  static vtkAMRInterpolatedVelocityField * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractInterpolatedVelocityField Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractInterpolatedVelocityField :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAMRInterpolatedVelocityField :: IsTypeOf ( type ) ; } static vtkAMRInterpolatedVelocityField * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAMRInterpolatedVelocityField * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAMRInterpolatedVelocityField * NewInstance ( ) const { return vtkAMRInterpolatedVelocityField :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRInterpolatedVelocityField :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##
##  Specify the AMR dataset to process.
##  virtual void SetAmrDataSet ( vtkOverlappingAMR * ) ; virtual vtkOverlappingAMR * GetnameAmrDataSet ( ) { vtkDebugWithObjectMacro ( this , <<  returning  AmrDataSet  address  << static_cast < vtkOverlappingAMR * > ( this -> AmrDataSet ) ) ; return this -> AmrDataSet ; } ; void SetAMRData ( vtkOverlappingAMR * amr ) { this -> SetAmrDataSet ( amr ) ; } /@} *
##  Copy essential parameters between instances of this class. This
##  generally is used to copy from instance prototype to another, or to copy
##  interpolators between thread instances.  Sub-classes can contribute to
##  the parameter copying process via chaining.
##  void CopyParameters ( vtkAbstractInterpolatedVelocityField * from ) override ; *
##  Set the cell id cached by the last evaluation.
##  void SetLastCellId ( vtkIdType c ) override { this -> Superclass :: SetLastCellId ( c ) ; } using Superclass :: FunctionValues ; *
##  Evaluate the velocity field f at point p.
##  If it succeeds, then both the last data set (this->LastDataSet) and
##  the last data set location (this->LastLevel, this->LastId) will be
##  set according to where p is found.  If it fails, either p is out of
##  bound, in which case both the last data set and the last location
##  will be invalid or, in a multi-process setting, p is inbound but not
##  on the processor.  In the last case, the last data set location is
##  still valid
##  int FunctionValues ( double * x , double * f ) override ; *
##  Helper function to locator the grid within an AMR dataset.
##  static bool FindGrid ( double q [ 3 ] , vtkOverlappingAMR * amrds , unsigned int & level , unsigned int & gridId ) ; /@{ *
##  Methods to support local caching while searching for AMR datasets.
##  bool GetLastDataSetLocation ( unsigned int & level , unsigned int & id ) ; bool SetLastDataSet ( int level , int id ) ; void SetLastCellId ( vtkIdType c , int dataindex ) override ; /@} protected : vtkOverlappingAMR * AmrDataSet ; int LastLevel ; int LastId ; vtkAMRInterpolatedVelocityField ( ) ; ~ vtkAMRInterpolatedVelocityField ( ) override ; int FunctionValues ( vtkDataSet * ds , double * x , double * f ) override { return this -> Superclass :: FunctionValues ( ds , x , f ) ; } *
##  Method to initialize the velocity field. Generally this must be called when
##  performing threaded operations; however if not called apriori it will be called in
##  the first call to FunctionValues(), which implicitly assumes that this is being
##  used in serial operation.
##  int SelfInitialize ( ) override ; private : vtkAMRInterpolatedVelocityField ( const vtkAMRInterpolatedVelocityField & ) = delete ; void operator = ( const vtkAMRInterpolatedVelocityField & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

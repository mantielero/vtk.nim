## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParallelVectors.h
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
##  @class   vtkParallelVectors
##  @brief   Compute polylines corresponding to locations where two vector fields
##           are parallel
##
##  vtkParallelVectors accepts a 3D dataset with two nodal 3-vector fields and
##  generates polylines along the paths where the vector fields are parallel.
##  This filter is an implementation of the concepts outlined in the following
##  article:
##
##  R. Peikert and M. Roth, "The "Parallel Vectors" operator-a vector field
##  visualization primitive," Proceedings Visualization '99 (Cat. No.99CB37067),
##  San Francisco, CA, USA, 1999, pp. 263-532.
##
##  @sa
##  vtkVortexCore
##

## !!!Ignored construct:  # vtkParallelVectors_h [NewLine] # vtkParallelVectors_h [NewLine] # vtkFiltersFlowPathsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkNew.h  for vtkNew [NewLine] namespace detail { template < typename VArrayType , typename WArrayType > [end of template] class CollectValidCellSurfacePointsFunctor ; } class VTKFILTERSFLOWPATHS_EXPORT vtkParallelVectors : public vtkPolyDataAlgorithm { template < typename , typename > friend class detail :: CollectValidCellSurfacePointsFunctor ; public : static vtkParallelVectors * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParallelVectors :: IsTypeOf ( type ) ; } static vtkParallelVectors * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParallelVectors * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParallelVectors * NewInstance ( ) const { return vtkParallelVectors :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParallelVectors :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParallelVectors :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the name of first vector field.
##  virtual void SetFirstVectorFieldName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FirstVectorFieldName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FirstVectorFieldName == nullptr && _arg == nullptr ) { return ; } if ( this -> FirstVectorFieldName && _arg && ( ! strcmp ( this -> FirstVectorFieldName , _arg ) ) ) { return ; } delete [ ] this -> FirstVectorFieldName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FirstVectorFieldName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FirstVectorFieldName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetFirstVectorFieldName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << FirstVectorFieldName  of  << ( this -> FirstVectorFieldName ? this -> FirstVectorFieldName : (null) ) ) ; return this -> FirstVectorFieldName ; } ; /@} /@{ *
##  Set/Get the name of second vector field.
##  virtual void SetFirstVectorFieldNameSecondVectorFieldName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SecondVectorFieldName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> SecondVectorFieldName == nullptr && _arg == nullptr ) { return ; } if ( this -> SecondVectorFieldName && _arg && ( ! strcmp ( this -> SecondVectorFieldName , _arg ) ) ) { return ; } delete [ ] this -> SecondVectorFieldName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> SecondVectorFieldName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> SecondVectorFieldName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetFirstVectorFieldNameSecondVectorFieldName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << SecondVectorFieldName  of  << ( this -> SecondVectorFieldName ? this -> SecondVectorFieldName : (null) ) ) ; return this -> SecondVectorFieldName ; } ; /@} protected : vtkParallelVectors ( ) ; ~ vtkParallelVectors ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; *
##  Prefilter should resize the CriteriaArrays, initialize them and set their names.
##  virtual void Prefilter ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { } virtual void Postfilter ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; virtual bool AcceptSurfaceTriangle ( const vtkIdType surfaceSimplexIndices [ 3 ] ) ; *
##  Computes additional criteria to determine if a point should be added to a vortex core.
##  Criteria are returned in the criteria parameter.
##
##  @note criterionArrayValues has the size of the number of the CriteriaArrays.
##  virtual bool ComputeAdditionalCriteria ( const vtkIdType surfaceSimplexIndices [ 3 ] , double s , double t , std :: vector < double > & criterionArrayValues ) ; *
##  Contains the name of the first vector field to compare.
##  char * FirstVectorFieldName ; *
##  Contains the name of the second vector field to compare.
##  char * SecondVectorFieldName ;  The arrays are used to store additional criteria related arrays with 1 component.
##  The size of this vector should be resized inside Prefilter. std :: vector < vtkSmartPointer < vtkDoubleArray >> CriteriaArrays ; private : vtkParallelVectors ( const vtkParallelVectors & ) = delete ; void operator = ( const vtkParallelVectors & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

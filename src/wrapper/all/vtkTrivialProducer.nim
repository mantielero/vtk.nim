## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTrivialProducer.h
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
##  @class   vtkTrivialProducer
##  @brief   Producer for stand-alone data objects.
##
##  vtkTrivialProducer allows stand-alone data objects to be connected
##  as inputs in a pipeline.  All data objects that are connected to a
##  pipeline involving vtkAlgorithm must have a producer.  This trivial
##  producer allows data objects that are hand-constructed in a program
##  without another vtk producer to be connected.
##

## !!!Ignored construct:  # vtkTrivialProducer_h [NewLine] # vtkTrivialProducer_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class vtkDataObject ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkTrivialProducer : public vtkAlgorithm { public : static vtkTrivialProducer * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTrivialProducer :: IsTypeOf ( type ) ; } static vtkTrivialProducer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTrivialProducer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTrivialProducer * NewInstance ( ) const { return vtkTrivialProducer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTrivialProducer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTrivialProducer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Process upstream/downstream requests trivially.  The associated
##  output data object is never modified, but it is queried to
##  fulfill requests.
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Set the data object that is "produced" by this producer.  It is
##  never really modified.
##  virtual void SetOutput ( vtkDataObject * output ) ; *
##  The modified time of this producer is the newer of this object or
##  the assigned output.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set the whole extent to use for the data this producer is producing.
##  This may be different than the extent of the output data when
##  the trivial producer is used in parallel.
##  virtual void SetWholeExtent ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << WholeExtent  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> WholeExtent [ 0 ] != _arg1 ) || ( this -> WholeExtent [ 1 ] != _arg2 ) || ( this -> WholeExtent [ 2 ] != _arg3 ) || ( this -> WholeExtent [ 3 ] != _arg4 ) || ( this -> WholeExtent [ 4 ] != _arg5 ) || ( this -> WholeExtent [ 5 ] != _arg6 ) ) { this -> WholeExtent [ 0 ] = _arg1 ; this -> WholeExtent [ 1 ] = _arg2 ; this -> WholeExtent [ 2 ] = _arg3 ; this -> WholeExtent [ 3 ] = _arg4 ; this -> WholeExtent [ 4 ] = _arg5 ; this -> WholeExtent [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetWholeExtent ( const int _arg [ 6 ] ) { this -> SetWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetWholeExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  pointer  << this -> WholeExtent ) ; return this -> WholeExtent ; } VTK_WRAPEXCLUDE virtual void GetWholeExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> WholeExtent [ 0 ] ; _arg2 = this -> WholeExtent [ 1 ] ; _arg3 = this -> WholeExtent [ 2 ] ; _arg4 = this -> WholeExtent [ 3 ] ; _arg5 = this -> WholeExtent [ 4 ] ; _arg6 = this -> WholeExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWholeExtent ( int _arg [ 6 ] ) { this -> GetWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} *
##  This method can be used to copy meta-data from an existing data
##  object to an information object. For example, whole extent,
##  image data spacing, origin etc.
##  static void FillOutputDataInformation ( vtkDataObject * output , vtkInformation * outInfo ) ; protected : vtkTrivialProducer ( ) ; ~ vtkTrivialProducer ( ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; vtkExecutive * CreateDefaultExecutive ( ) override ;  The real data object. vtkDataObject * Output ; int WholeExtent [ 6 ] ; void ReportReferences ( vtkGarbageCollector * ) override ; private : vtkTrivialProducer ( const vtkTrivialProducer & ) = delete ; void operator = ( const vtkTrivialProducer & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

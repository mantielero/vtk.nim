## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoostGraphAdapter.h
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
##  @class   vtkBoostBetweennessClustering
##  @brief   Implements graph clustering based on
##  edge betweenness centrality.
##
##
##
##  This vtk class uses the Boost centrality clustering
##  generic algorithm to compute edge betweenness centrality on
##  the input graph (a vtkGraph).
##
##  @sa
##  vtkGraph vtkBoostGraphAdapter
##

## !!!Ignored construct:  # vtkBoostBetweennessClustering_h [NewLine] # vtkBoostBetweennessClustering_h [NewLine] # vtkGraphAlgorithm.h [NewLine] # vtkInfovisBoostGraphAlgorithmsModule.h  For export macro [NewLine] class VTKINFOVISBOOSTGRAPHALGORITHMS_EXPORT vtkBoostBetweennessClustering : public vtkGraphAlgorithm { public : static vtkBoostBetweennessClustering * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGraphAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGraphAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBoostBetweennessClustering :: IsTypeOf ( type ) ; } static vtkBoostBetweennessClustering * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBoostBetweennessClustering * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBoostBetweennessClustering * NewInstance ( ) const { return vtkBoostBetweennessClustering :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoostBetweennessClustering :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoostBetweennessClustering :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkBoostBetweennessClustering ( ) ; ~ vtkBoostBetweennessClustering ( ) override ; /@{ *
##  Get/Set the threshold value. Algorithm terminats when the maximum edge
##  centrality is below this threshold.
##  virtual void SetThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Threshold  to  << _arg ) ; if ( this -> Threshold != _arg ) { this -> Threshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Threshold  of  << this -> Threshold ) ; return this -> Threshold ; } ; /@} /@{ *
##  Get/Set the flag that sets the rule whether or not to use the
##  edge weight array as set using \c SetEdgeWeightArrayName.
##  virtual void SetThresholdUseEdgeWeightArray ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseEdgeWeightArray  to  << _arg ) ; if ( this -> UseEdgeWeightArray != _arg ) { this -> UseEdgeWeightArray = _arg ; this -> Modified ( ) ; } } ; virtual void UseEdgeWeightArrayOn ( ) { this -> SetUseEdgeWeightArray ( static_cast < bool > ( 1 ) ) ; } virtual void UseEdgeWeightArrayOff ( ) { this -> SetUseEdgeWeightArray ( static_cast < bool > ( 0 ) ) ; } ; /@} virtual void SetThresholdUseEdgeWeightArrayInvertEdgeWeightArray ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InvertEdgeWeightArray  to  << _arg ) ; if ( this -> InvertEdgeWeightArray != _arg ) { this -> InvertEdgeWeightArray = _arg ; this -> Modified ( ) ; } } ; virtual void InvertEdgeWeightArrayOn ( ) { this -> SetUseEdgeWeightArrayInvertEdgeWeightArray ( static_cast < bool > ( 1 ) ) ; } virtual void InvertEdgeWeightArrayOff ( ) { this -> SetUseEdgeWeightArrayInvertEdgeWeightArray ( static_cast < bool > ( 0 ) ) ; } ; /@{ *
##  Get/Set the name of the array that needs to be used as the edge weight.
##  The array should be a vtkDataArray.
##  virtual char * GetEdgeWeightArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeWeightArrayName  of  << ( this -> EdgeWeightArrayName ? this -> EdgeWeightArrayName : (null) ) ) ; return this -> EdgeWeightArrayName ; } ; virtual void SetEdgeWeightArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EdgeWeightArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> EdgeWeightArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> EdgeWeightArrayName && _arg && ( ! strcmp ( this -> EdgeWeightArrayName , _arg ) ) ) { return ; } delete [ ] this -> EdgeWeightArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> EdgeWeightArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> EdgeWeightArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Set the edge centrality array name. If no output array name is
##  set then the name "edge_centrality" is used.
##  virtual void SetEdgeWeightArrayNameEdgeCentralityArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EdgeCentralityArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> EdgeCentralityArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> EdgeCentralityArrayName && _arg && ( ! strcmp ( this -> EdgeCentralityArrayName , _arg ) ) ) { return ; } delete [ ] this -> EdgeCentralityArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> EdgeCentralityArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> EdgeCentralityArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} protected : int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; private : double Threshold ; bool UseEdgeWeightArray ; bool InvertEdgeWeightArray ; char * EdgeWeightArrayName ; char * EdgeCentralityArrayName ; vtkBoostBetweennessClustering ( const vtkBoostBetweennessClustering & ) = delete ; void operator = ( const vtkBoostBetweennessClustering & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

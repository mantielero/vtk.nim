## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridQuadricDecimation.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2007, 2008 by University of Utah.
##
## =========================================================================
## *
##  @class   vtkUnstructuredGridQuadricDecimation
##  @brief   reduce the number of
##  tetrahedra in a mesh
##
##
##
##  vtkUnstructuredGridQuadricDecimation is a class that simplifies
##  tetrahedral meshes using randomized multiple choice edge
##  collapses. The input to this filter is a vtkUnstructuredGrid object
##  with a single scalar field (specifying in the ScalarsName
##  attribute). Users can determine the size of the output mesh by
##  either setting the value of TargetReduction or
##  NumberOfTetsOutput. The BoundaryWeight can be set to control how
##  well the mesh boundary should be preserved. The implementation uses
##  Michael Garland's generalized Quadric Error Metrics, the Corner
##  Table representation and the Standard Conjugate Gradient Method to
##  order the edge collapse sequence.
##
##  Instead of using the traditional priority queue, the algorithm uses
##  a randomized approach to yield faster performance with comparable
##  quality. At each step, a set of 8 random candidate edges are
##  examined to select the best edge to collapse. This number can also
##  be changed by users through NumberOfCandidates.
##
##  For more information as well as the streaming version of this
##  algorithm see:
##
##  "Streaming Simplification of Tetrahedral Meshes" by H. T. Vo,
##  S. P. Callahan, P. Lindstrom, V. Pascucci and C. T. Silva, IEEE
##  Transactions on Visualization and Computer Graphics, 13(1):145-155,
##  2007.
##
##
##  @par Acknowledgments:
##  This code was developed by Huy T. Vo under the supervision of
##  Prof. Claudio T. Silva. The code also contains contributions from
##  Peter Lindstrom and Steven P. Callahan.
##
##  @par Acknowledgments:
##  The work was supported by grants, contracts, and gifts from the
##  National Science Foundation, the Department of Energy and IBM.
##

## !!!Ignored construct:  # vtkUnstructuredGridQuadricDecimation_h [NewLine] # vtkUnstructuredGridQuadricDecimation_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkUnstructuredGridQuadricDecimation : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridQuadricDecimation :: IsTypeOf ( type ) ; } static vtkUnstructuredGridQuadricDecimation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridQuadricDecimation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridQuadricDecimation * NewInstance ( ) const { return vtkUnstructuredGridQuadricDecimation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridQuadricDecimation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridQuadricDecimation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkUnstructuredGridQuadricDecimation * New ( ) ;  The following 3 parameters will control the process of simplification in
##  the priority:
##  NumberOfEdgesToDecimate, NumberOfTetsOutput, TargetReduction.
##  If NumberOfEdgesToDecimate is 0, NumberOfTetsOutput will be considered. If
##  NumbersOfTetsOutput is also 0, then TargetReduction will control the
##  output. /@{ *
##  Set/Get the desired reduction (expressed as a fraction of the original
##  number of tetrehedra)
##  virtual void SetTargetReduction ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TargetReduction  to  << _arg ) ; if ( this -> TargetReduction != _arg ) { this -> TargetReduction = _arg ; this -> Modified ( ) ; } } ; virtual double GetTargetReduction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TargetReduction  of  << this -> TargetReduction ) ; return this -> TargetReduction ; } ; /@} /@{ *
##  Set/Get the desired number of tetrahedra to be outputted
##  virtual void SetTargetReductionNumberOfTetsOutput ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfTetsOutput  to  << _arg ) ; if ( this -> NumberOfTetsOutput != _arg ) { this -> NumberOfTetsOutput = _arg ; this -> Modified ( ) ; } } ; virtual int GetTargetReductionNumberOfTetsOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTetsOutput  of  << this -> NumberOfTetsOutput ) ; return this -> NumberOfTetsOutput ; } ; /@} /@{ *
##  Set/Get the desired number of edge to collapse
##  virtual void SetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimate ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfEdgesToDecimate  to  << _arg ) ; if ( this -> NumberOfEdgesToDecimate != _arg ) { this -> NumberOfEdgesToDecimate = _arg ; this -> Modified ( ) ; } } ; virtual int GetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfEdgesToDecimate  of  << this -> NumberOfEdgesToDecimate ) ; return this -> NumberOfEdgesToDecimate ; } ; /@} /@{ *
##  Set/Get the number of candidates selected for each randomized set before
##  performing an edge collapse. Increasing this number can help producing
##  higher quality output but it will be slower. Default is 8.
##  virtual void SetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimateNumberOfCandidates ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfCandidates  to  << _arg ) ; if ( this -> NumberOfCandidates != _arg ) { this -> NumberOfCandidates = _arg ; this -> Modified ( ) ; } } ; virtual int GetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimateNumberOfCandidates ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCandidates  of  << this -> NumberOfCandidates ) ; return this -> NumberOfCandidates ; } ; /@} /@{ *
##  Enable(1)/Disable(0) the feature of temporarily doubling the number of
##  candidates for each randomized set if the quadric error was significantly
##  increased over the last edge collapse, i.e. if the ratio between the error
##  difference and the last error is over some threshold. Basically, we are
##  trying to make up for cases when random selection returns so many 'bad'
##  edges. By doing this we can achieve a higher quality output with much less
##  time than just double the NumberOfCandidates. Default is Enabled(1)
##  virtual void SetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimateNumberOfCandidatesAutoAddCandidates ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoAddCandidates  to  << _arg ) ; if ( this -> AutoAddCandidates != _arg ) { this -> AutoAddCandidates = _arg ; this -> Modified ( ) ; } } ; virtual int GetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimateNumberOfCandidatesAutoAddCandidates ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAddCandidates  of  << this -> AutoAddCandidates ) ; return this -> AutoAddCandidates ; } ; /@} /@{ *
##  Set/Get the threshold that decides when to double the set size.
##  Default is 0.4.
##  virtual void SetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimateNumberOfCandidatesAutoAddCandidatesAutoAddCandidatesThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoAddCandidatesThreshold  to  << _arg ) ; if ( this -> AutoAddCandidatesThreshold != _arg ) { this -> AutoAddCandidatesThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimateNumberOfCandidatesAutoAddCandidatesAutoAddCandidatesThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAddCandidatesThreshold  of  << this -> AutoAddCandidatesThreshold ) ; return this -> AutoAddCandidatesThreshold ; } ; /@} /@{ *
##  Set/Get the weight of the boundary on the quadric metrics. The larger
##  the number, the better the boundary is preserved.
##  virtual void SetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimateNumberOfCandidatesAutoAddCandidatesAutoAddCandidatesThresholdBoundaryWeight ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BoundaryWeight  to  << _arg ) ; if ( this -> BoundaryWeight != _arg ) { this -> BoundaryWeight = _arg ; this -> Modified ( ) ; } } ; virtual double GetTargetReductionNumberOfTetsOutputNumberOfEdgesToDecimateNumberOfCandidatesAutoAddCandidatesAutoAddCandidatesThresholdBoundaryWeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoundaryWeight  of  << this -> BoundaryWeight ) ; return this -> BoundaryWeight ; } ; /@} /@{ *
##  Set/Get the scalar field name used for simplification
##  virtual void SetScalarsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ScalarsName == nullptr && _arg == nullptr ) { return ; } if ( this -> ScalarsName && _arg && ( ! strcmp ( this -> ScalarsName , _arg ) ) ) { return ; } delete [ ] this -> ScalarsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ScalarsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ScalarsName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetScalarsName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarsName  of  << ( this -> ScalarsName ? this -> ScalarsName : (null) ) ) ; return this -> ScalarsName ; } ; /@} enum { NON_ERROR = 0 , NON_TETRAHEDRA = 1 , NO_SCALARS = 2 , NO_CELLS = 3 } ; protected : vtkUnstructuredGridQuadricDecimation ( ) ; ~ vtkUnstructuredGridQuadricDecimation ( ) override ; void ReportError ( int err ) ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int NumberOfTetsOutput ; int NumberOfEdgesToDecimate ; int NumberOfCandidates ; int AutoAddCandidates ; double TargetReduction ; double AutoAddCandidatesThreshold ; double BoundaryWeight ; char * ScalarsName ; private : vtkUnstructuredGridQuadricDecimation ( const vtkUnstructuredGridQuadricDecimation & ) = delete ; void operator = ( const vtkUnstructuredGridQuadricDecimation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

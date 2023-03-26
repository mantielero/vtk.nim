## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStrahlerMetric.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##  Copyright 2008 Sandia Corporation.
##  Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##  the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
##
## *
##  @class   vtkStrahlerMetric
##  @brief   compute Strahler metric for a tree
##
##  The Strahler metric is a value assigned to each vertex of a
##  tree that characterizes the structural complexity of the
##  sub-tree rooted at that node.  The metric originated in the
##  study of river systems, but has been applied to other tree-
##  structured systes,  Details of the metric and the rationale
##  for using it in infovis can be found in:
##
##  Tree Visualization and Navigation Clues for Information
##  Visualization, I. Herman, M. Delest, and G. Melancon,
##  Computer Graphics Forum, Vol 17(2), Blackwell, 1998.
##
##  The input tree is copied to the output, but with a new array
##  added to the output vertex data.
##
##  @par Thanks:
##  Thanks to David Duke from the University of Leeds for providing this
##  implementation.
##

## !!!Ignored construct:  # vtkStrahlerMetric_h [NewLine] # vtkStrahlerMetric_h [NewLine] # vtkFiltersStatisticsModule.h  For export macro # vtkTreeAlgorithm.h [NewLine] class vtkFloatArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSSTATISTICS_EXPORT vtkStrahlerMetric : public vtkTreeAlgorithm { public : static vtkStrahlerMetric * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTreeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTreeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkStrahlerMetric :: IsTypeOf ( type ) ; } static vtkStrahlerMetric * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkStrahlerMetric * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkStrahlerMetric * NewInstance ( ) const { return vtkStrahlerMetric :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTreeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStrahlerMetric :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStrahlerMetric :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the name of the array in which the Strahler values will
##  be stored within the output vertex data.
##  Default is "Strahler"
##  virtual void SetMetricArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MetricArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> MetricArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> MetricArrayName && _arg && ( ! strcmp ( this -> MetricArrayName , _arg ) ) ) { return ; } delete [ ] this -> MetricArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> MetricArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> MetricArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Set/get setting of normalize flag.  If this is set, the
##  Strahler values are scaled into the range [0..1].
##  Default is for normalization to be OFF.
##  virtual void SetNormalize ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Normalize  to  << _arg ) ; if ( this -> Normalize != _arg ) { this -> Normalize = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Normalize  of  << this -> Normalize ) ; return this -> Normalize ; } ; virtual void NormalizeOn ( ) { this -> SetNormalize ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalizeOff ( ) { this -> SetNormalize ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get the maximum strahler value for the tree.
##  virtual float GetNormalizeMaxStrahler ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxStrahler  of  << this -> MaxStrahler ) ; return this -> MaxStrahler ; } ; /@} protected : vtkStrahlerMetric ( ) ; ~ vtkStrahlerMetric ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool Normalize ; float MaxStrahler ; char * MetricArrayName ; float CalculateStrahler ( vtkIdType root , vtkFloatArray * metric , vtkTree * tree ) ; private : vtkStrahlerMetric ( const vtkStrahlerMetric & ) = delete ; void operator = ( const vtkStrahlerMetric & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtentSplitter.h
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
##  @class   vtkExtentSplitter
##  @brief   Split an extent across other extents.
##
##  vtkExtentSplitter splits each input extent into non-overlapping
##  sub-extents that are completely contained within other "source
##  extents".  A source extent corresponds to some resource providing
##  an extent.  Each source extent has an integer identifier, integer
##  priority, and an extent.  The input extents are split into
##  sub-extents according to priority, availability, and amount of
##  overlap of the source extents.  This can be used by parallel data
##  readers to read as few piece files as possible.
##

## !!!Ignored construct:  # vtkExtentSplitter_h [NewLine] # vtkExtentSplitter_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkObject.h [NewLine] class vtkExtentSplitterInternals ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkExtentSplitter : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtentSplitter :: IsTypeOf ( type ) ; } static vtkExtentSplitter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtentSplitter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtentSplitter * NewInstance ( ) const { return vtkExtentSplitter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtentSplitter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtentSplitter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkExtentSplitter * New ( ) ; /@{ *
##  Add/Remove a source providing the given extent.  Sources with
##  higher priority numbers are favored.  Source id numbers and
##  priorities must be non-negative.
##  void AddExtentSource ( int id , int priority , int x0 , int x1 , int y0 , int y1 , int z0 , int z1 ) ; void AddExtentSource ( int id , int priority , int * extent ) ; void RemoveExtentSource ( int id ) ; void RemoveAllExtentSources ( ) ; /@} /@{ *
##  Add an extent to the queue of extents to be split among the
##  available sources.
##  void AddExtent ( int x0 , int x1 , int y0 , int y1 , int z0 , int z1 ) ; void AddExtent ( int * extent ) ; /@} *
##  Split the extents currently in the queue among the available
##  sources.  The queue is empty when this returns.  Returns 1 if all
##  extents could be read.  Returns 0 if any portion of any extent
##  was not available through any source.
##  int ComputeSubExtents ( ) ; *
##  Get the number of sub-extents into which the original set of
##  extents have been split across the available sources.  Valid
##  after a call to ComputeSubExtents.
##  int GetNumberOfSubExtents ( ) ; /@{ *
##  Get the sub-extent associated with the given index.  Use
##  GetSubExtentSource to get the id of the source from which this
##  sub-extent should be read.  Valid after a call to
##  ComputeSubExtents.
##  int * GetSubExtent ( int index ) VTK_SIZEHINT ( 6 ) ; void GetSubExtent ( int index , int * extent ) ; /@} *
##  Get the id of the source from which the sub-extent associated
##  with the given index should be read.  Returns -1 if no source
##  provides the sub-extent.
##  int GetSubExtentSource ( int index ) ; /@{ *
##  Get/Set whether "point mode" is on.  In point mode, sub-extents
##  are generated to ensure every point in the update request is
##  read, but not necessarily every cell.  This can be used when
##  point data are stored in a planar slice per piece with no cell
##  data.  The default is OFF.
##  virtual vtkTypeBool GetPointMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMode  of  << this -> PointMode ) ; return this -> PointMode ; } ; virtual void SetPointMode ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PointMode  to  << _arg ) ; if ( this -> PointMode != _arg ) { this -> PointMode = _arg ; this -> Modified ( ) ; } } ; virtual void PointModeOn ( ) { this -> SetPointMode ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PointModeOff ( ) { this -> SetPointMode ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkExtentSplitter ( ) ; ~ vtkExtentSplitter ( ) override ;  Internal utility methods. void SplitExtent ( int * extent , int * subextent ) ; int IntersectExtents ( const int * extent1 , const int * extent2 , int * result ) ; int Min ( int a , int b ) ; int Max ( int a , int b ) ;  Internal implementation data. vtkExtentSplitterInternals * Internal ;  On if reading only all points (but not always all cells) is
##  necessary.  Used for reading volumes of planar slices storing
##  only point data. vtkTypeBool PointMode ; private : vtkExtentSplitter ( const vtkExtentSplitter & ) = delete ; void operator = ( const vtkExtentSplitter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

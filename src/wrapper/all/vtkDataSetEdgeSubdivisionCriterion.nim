## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetEdgeSubdivisionCriterion.h
##   Language:  C++
##
##   Copyright 2003 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
##   license for use of this work by or on behalf of the
##   U.S. Government. Redistribution and use in source and binary forms, with
##   or without modification, are permitted provided that this Notice and any
##   statement of authorship are reproduced on all copies.
##
## =========================================================================

## !!!Ignored construct:  # vtkDataSetEdgeSubdivisionCriterion_h [NewLine] # vtkDataSetEdgeSubdivisionCriterion_h [NewLine] *
##  @class   vtkDataSetEdgeSubdivisionCriterion
##  @brief   a subclass of vtkEdgeSubdivisionCriterion for vtkDataSet objects.
##
##
##  This is a subclass of vtkEdgeSubdivisionCriterion that is used for
##  tessellating cells of a vtkDataSet, particularly nonlinear
##  cells.
##
##  It provides functions for setting the current cell being tessellated and a
##  convenience routine, \a EvaluateFields() to evaluate field values at a
##  point. You should call \a EvaluateFields() from inside \a EvaluateLocationAndFields()
##  whenever the result of \a EvaluateLocationAndFields() will be true. Otherwise, do
##  not call \a EvaluateFields() as the midpoint is about to be discarded.
##  (<i>Implementor's note</i>: This isn't true if UGLY_ASPECT_RATIO_HACK
##  has been defined. But in that case, we don't want the exact field values;
##  we need the linearly interpolated ones at the midpoint for continuity.)
##
##  @sa
##  vtkEdgeSubdivisionCriterion
##  # vtkEdgeSubdivisionCriterion.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class vtkCell ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataSet"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkDataSetEdgeSubdivisionCriterion : public vtkEdgeSubdivisionCriterion { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkEdgeSubdivisionCriterion Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkEdgeSubdivisionCriterion :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataSetEdgeSubdivisionCriterion :: IsTypeOf ( type ) ; } static vtkDataSetEdgeSubdivisionCriterion * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataSetEdgeSubdivisionCriterion * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataSetEdgeSubdivisionCriterion * NewInstance ( ) const { return vtkDataSetEdgeSubdivisionCriterion :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkEdgeSubdivisionCriterion :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetEdgeSubdivisionCriterion :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetEdgeSubdivisionCriterion :: New ( ) ; } public : ; static vtkDataSetEdgeSubdivisionCriterion * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual void SetMesh ( vtkDataSet * ) ; vtkDataSet * GetMesh ( ) ; const vtkDataSet * GetMesh ( ) const ; virtual void SetCellId ( vtkIdType cell ) ; vtkIdType GetCellId ( ) const ; vtkIdType & GetCellId ( ) ; vtkCell * GetCell ( ) ; const vtkCell * GetCell ( ) const ; bool EvaluateLocationAndFields ( double * midpt , int field_start ) override ; *
##  Evaluate all of the fields that should be output with the
##  given \a vertex and store them just past the parametric coordinates
##  of \a vertex, at the offsets given by
##  \p vtkEdgeSubdivisionCriterion::GetFieldOffsets() plus \a field_start.
##  \a field_start contains the number of world-space coordinates (always 3)
##  plus the embedding dimension (the size of the parameter-space in which
##  the cell is embedded). It will range between 3 and 6, inclusive.
##
##  You must have called SetCellId() before calling this routine or there
##  will not be a mesh over which to evaluate the fields.
##
##  You must have called \p vtkEdgeSubdivisionCriterion::PassDefaultFields()
##  or \p vtkEdgeSubdivisionCriterion::PassField() or there will be no fields
##  defined for the output vertex.
##
##  This routine is public and returns its input argument so that it
##  may be used as an argument to
##  \p vtkStreamingTessellator::AdaptivelySamplekFacet():
##  @verbatim
##  vtkStreamingTessellator* t = vtkStreamingTessellator::New();
##  vtkEdgeSubdivisionCriterion* s;
##  ...
##  t->AdaptivelySample1Facet( s->EvaluateFields( p0 ), s->EvaluateFields( p1 ) );
##  ...
##  @endverbatim
##  Although this will work, using \p EvaluateFields() in this manner
##  should be avoided. It's much more efficient to fetch the corner values
##  for each attribute and copy them into \a p0, \a p1, ... as opposed to
##  performing shape function evaluations. The only case where you wouldn't
##  want to do this is when the field you are interpolating is discontinuous
##  at cell borders, such as with a discontinuous galerkin method or when
##  all the Gauss points for quadrature are interior to the cell.
##
##  The final argument, \a weights, is the array of weights to apply to each
##  point's data when interpolating the field. This is returned by
##  \a vtkCell::EvaluateLocation() when evaluating the geometry.
##  double * EvaluateFields ( double * vertex , double * weights , int field_start ) ; /@{ *
##  Evaluate either a cell or nodal field.
##  This exists because of the funky way that Exodus data will be handled.
##  Sure, it's a hack, but what are ya gonna do?
##  void EvaluatePointDataField ( double * result , double * weights , int field ) ; void EvaluateCellDataField ( double * result , double * weights , int field ) ; /@} /@{ *
##  Get/Set the square of the allowable chord error at any edge's midpoint.
##  This value is used by EvaluateLocationAndFields.
##  virtual void SetChordError2 ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ChordError2  to  << _arg ) ; if ( this -> ChordError2 != _arg ) { this -> ChordError2 = _arg ; this -> Modified ( ) ; } } ; virtual double GetChordError2 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ChordError2  of  << this -> ChordError2 ) ; return this -> ChordError2 ; } ; /@} /@{ *
##  Get/Set the square of the allowable error magnitude for the
##  scalar field \a s at any edge's midpoint.
##  A value less than or equal to 0 indicates that the field
##  should not be used as a criterion for subdivision.
##  virtual void SetFieldError2 ( int s , double err ) ; double GetFieldError2 ( int s ) const ; /@} *
##  Tell the subdivider not to use any field values as subdivision criteria.
##  Effectively calls SetFieldError2( a, -1. ) for all fields.
##  virtual void ResetFieldError2 ( ) ; /@{ *
##  Return a bitfield specifying which FieldError2 criteria are positive (i.e., actively
##  used to decide edge subdivisions).
##  This is stored as separate state to make subdivisions go faster.
##  virtual int GetChordError2ActiveFieldCriteria ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveFieldCriteria  of  << this -> ActiveFieldCriteria ) ; return this -> ActiveFieldCriteria ; } ;  With VTK_USE_FUTURE_CONST, vtkGetMacro already makes the member const. # ! VTK_USE_FUTURE_CONST [NewLine] int GetActiveFieldCriteria ( ) const { return this -> ActiveFieldCriteria ; } # [NewLine] /@} protected : vtkDataSetEdgeSubdivisionCriterion ( ) ; ~ vtkDataSetEdgeSubdivisionCriterion ( ) override ; vtkDataSet * CurrentMesh ; vtkIdType CurrentCellId ; vtkCell * CurrentCellData ; double ChordError2 ; double * FieldError2 ; int FieldError2Length ; int FieldError2Capacity ; int ActiveFieldCriteria ; private : vtkDataSetEdgeSubdivisionCriterion ( const vtkDataSetEdgeSubdivisionCriterion & ) = delete ; void operator = ( const vtkDataSetEdgeSubdivisionCriterion & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetCellId*(): var vtkIdType {.importcpp: "VTKFILTERSCORE_EXPORT::GetCellId(@)",
                               header: "vtkDataSetEdgeSubdivisionCriterion.h".}
proc GetCellId*(): vtkIdType {.noSideEffect,
                            importcpp: "VTKFILTERSCORE_EXPORT::GetCellId(@)",
                            header: "vtkDataSetEdgeSubdivisionCriterion.h".}
proc GetMesh*(): ptr VTKFILTERSCORE_EXPORTvtkDataSet {.
    importcpp: "VTKFILTERSCORE_EXPORT::GetMesh(@)",
    header: "vtkDataSetEdgeSubdivisionCriterion.h".}
proc GetMesh*(): ptr VTKFILTERSCORE_EXPORTvtkDataSet {.noSideEffect,
    importcpp: "VTKFILTERSCORE_EXPORT::GetMesh(@)",
    header: "vtkDataSetEdgeSubdivisionCriterion.h".}
proc GetCell*(): ptr vtkCell {.importcpp: "VTKFILTERSCORE_EXPORT::GetCell(@)",
                           header: "vtkDataSetEdgeSubdivisionCriterion.h".}
proc GetCell*(): ptr vtkCell {.noSideEffect,
                           importcpp: "VTKFILTERSCORE_EXPORT::GetCell(@)",
                           header: "vtkDataSetEdgeSubdivisionCriterion.h".}
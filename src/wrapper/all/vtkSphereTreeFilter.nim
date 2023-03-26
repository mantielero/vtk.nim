## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphereTreeFilter.h
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
##  @class vtkSphereTreeFilter
##  @brief represent a sphere tree as vtkPolyData
##
##  vtkSphereTreeFilter is a filter that produces a vtkPolyData representation
##  of a sphere tree (vtkSphereTree). Basically it generates a point, a scalar
##  radius, and tree level number for the cell spheres and/or the different levels
##  in the tree hierarchy (assuming that the hierarchy is built). The output
##  can be glyphed using a filter like vtkGlyph3D to actually visualize the
##  sphere tree. The primary use of this class is for visualization of sphere
##  trees, and debugging the construction and use of sphere trees.
##
##  Additional capabilities include production of candidate spheres based on
##  geometric queries. For example, queries based on a point, infinite line,
##  and infinite plane are possible.
##
##  Note that this class may create a sphere tree, and then build it, for the
##  input dataset to this filter (if no sphere tree is provided). If the user
##  specifies a sphere tree, then the specified sphere tree is used. Thus the
##  input to the filter is optional. Consequently this filter can act like a source,
##  or as a filter in a pipeline.
##
##  @sa
##  vtkSphereTree vtkPlaneCutter
##

## !!!Ignored construct:  # vtkSphereTreeFilter_h [NewLine] # vtkSphereTreeFilter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_SPHERE_TREE_LEVELS 0 [NewLine] # VTK_SPHERE_TREE_POINT 1 [NewLine] # VTK_SPHERE_TREE_LINE 2 [NewLine] # VTK_SPHERE_TREE_PLANE 3 [NewLine] class vtkSphereTree ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkSphereTreeFilter : public vtkPolyDataAlgorithm { public : *
##  Instantiate the sphere tree filter.
##  static vtkSphereTreeFilter * New ( ) ; /@{ *
##  Standard type related macros and PrintSelf() method.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSphereTreeFilter :: IsTypeOf ( type ) ; } static vtkSphereTreeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSphereTreeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSphereTreeFilter * NewInstance ( ) const { return vtkSphereTreeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphereTreeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphereTreeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify and retrieve the sphere tree.
##  virtual void SetSphereTree ( vtkSphereTree * ) ; virtual vtkSphereTree * GetnameSphereTree ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SphereTree  address  << static_cast < vtkSphereTree * > ( this -> SphereTree ) ) ; return this -> SphereTree ; } ; /@} /@{ *
##  Specify what information this filter is to extract from the sphere
##  tree. Options include: spheres that make up one or more levels; spheres
##  that intersect a specified plane; spheres that intersect a specified line;
##  and spheres that intersect a specified point. What is extracted are sphere
##  centers, a radius, and an optional level. By default the specified levels
##  are extracted.
##  virtual void SetExtractionMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtractionMode  to  << _arg ) ; if ( this -> ExtractionMode != _arg ) { this -> ExtractionMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetExtractionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractionMode  of  << this -> ExtractionMode ) ; return this -> ExtractionMode ; } ; void SetExtractionModeToLevels ( ) { this -> SetExtractionMode ( VTK_SPHERE_TREE_LEVELS ) ; } void SetExtractionModeToPoint ( ) { this -> SetExtractionMode ( VTK_SPHERE_TREE_POINT ) ; } void SetExtractionModeToLine ( ) { this -> SetExtractionMode ( VTK_SPHERE_TREE_LINE ) ; } void SetExtractionModeToPlane ( ) { this -> SetExtractionMode ( VTK_SPHERE_TREE_PLANE ) ; } const char * GetExtractionModeAsString ( ) ; /@} /@{ *
##  Enable or disable the building and generation of the sphere tree
##  hierarchy. The hierarchy represents different levels in the tree
##  and enables rapid traversal of the tree.
##  virtual void SetExtractionModeTreeHierarchy ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TreeHierarchy  to  << _arg ) ; if ( this -> TreeHierarchy != _arg ) { this -> TreeHierarchy = _arg ; this -> Modified ( ) ; } } ; virtual bool GetExtractionModeTreeHierarchy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TreeHierarchy  of  << this -> TreeHierarchy ) ; return this -> TreeHierarchy ; } ; virtual void TreeHierarchyOn ( ) { this -> SetTreeHierarchy ( static_cast < bool > ( 1 ) ) ; } virtual void TreeHierarchyOff ( ) { this -> SetTreeHierarchy ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the level of the tree to extract (used when ExtractionMode is
##  set to Levels). A value of (-1) means all levels. Note that level 0 is
##  the root of the sphere tree. By default all levels are extracted. Note
##  that if TreeHierarchy is off, then it is only possible to extract leaf
##  spheres (i.e., spheres for each cell of the associated dataset).
##  virtual void SetLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Level  to  << _arg ) ; if ( this -> Level != ( _arg < - 1 ? - 1 : ( _arg > VTK_SHORT_MAX ? VTK_SHORT_MAX : _arg ) ) ) { this -> Level = ( _arg < - 1 ? - 1 : ( _arg > VTK_SHORT_MAX ? VTK_SHORT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetLevelMinValue ( ) { return - 1 ; } virtual int GetLevelMaxValue ( ) { return VTK_SHORT_MAX ; } ; virtual int GetExtractionModeTreeHierarchyLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Level  of  << this -> Level ) ; return this -> Level ; } ; /@} /@{ *
##  Specify a point used to extract one or more leaf spheres. This method is
##  used when extracting spheres using a point, line, or plane.
##  virtual void SetPoint ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Point  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Point [ 0 ] != _arg1 ) || ( this -> Point [ 1 ] != _arg2 ) || ( this -> Point [ 2 ] != _arg3 ) ) { this -> Point [ 0 ] = _arg1 ; this -> Point [ 1 ] = _arg2 ; this -> Point [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPoint ( const double _arg [ 3 ] ) { this -> SetPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point  pointer  << this -> Point ) ; return this -> Point ; } VTK_WRAPEXCLUDE virtual void GetPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point [ i ] ; } } ; /@} /@{ *
##  Specify a line used to extract spheres (used when ExtractionMode is set
##  to Line). The Ray plus Point define an infinite line. The ray is a
##  vector defining the direction of the line.
##  virtual void SetPointRay ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Ray  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Ray [ 0 ] != _arg1 ) || ( this -> Ray [ 1 ] != _arg2 ) || ( this -> Ray [ 2 ] != _arg3 ) ) { this -> Ray [ 0 ] = _arg1 ; this -> Ray [ 1 ] = _arg2 ; this -> Ray [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPointRay ( const double _arg [ 3 ] ) { this -> SetPointRay ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPointRay ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Ray  pointer  << this -> Ray ) ; return this -> Ray ; } VTK_WRAPEXCLUDE virtual void GetPointRay ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Ray [ i ] ; } } ; /@} /@{ *
##  Specify a plane used to extract spheres (used when ExtractionMode is set
##  to Plane). The plane Normal plus Point define an infinite plane.
##  virtual void SetPointRayNormal ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Normal  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Normal [ 0 ] != _arg1 ) || ( this -> Normal [ 1 ] != _arg2 ) || ( this -> Normal [ 2 ] != _arg3 ) ) { this -> Normal [ 0 ] = _arg1 ; this -> Normal [ 1 ] = _arg2 ; this -> Normal [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPointRayNormal ( const double _arg [ 3 ] ) { this -> SetPointRayNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPointRayNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetPointRayNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ; /@} *
##  Modified GetMTime because the sphere tree may have changed.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkSphereTreeFilter ( ) ; ~ vtkSphereTreeFilter ( ) override ; vtkSphereTree * SphereTree ; bool TreeHierarchy ; int ExtractionMode ; int Level ; double Point [ 3 ] ; double Ray [ 3 ] ; double Normal [ 3 ] ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkSphereTreeFilter ( const vtkSphereTreeFilter & ) = delete ; void operator = ( const vtkSphereTreeFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAdaptiveDataSetSurfaceFilter.h
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
##  @class   vtkAdaptiveDataSetSurfaceFilter
##  @brief   Adaptively extract dataset surface
##
##  vtkAdaptiveDataSetSurfaceFilter uses view and dataset properties to
##  create the outside surface mesh with the minimum minimorum of facets
##  @warning
##  Only implemented currently for 2-dimensional vtkHyperTreeGrid objects
##  @sa
##  vtkHyperTreeGrid vtkDataSetSurfaceFilter
##  @par Thanks:
##  This class was written by Guenole Harel and Jacques-Bernard Lekien, 2014
##  This class was rewritten by Philippe Pebay, 2016
##  This class was modified by Rogeli Grima, 2016
##  This work was supported by Commissariat a l'Energie Atomique (CEA/DIF)
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkAdaptiveDataSetSurfaceFilter_h [NewLine] # vtkAdaptiveDataSetSurfaceFilter_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkGeometryFilter.h [NewLine] class vtkBitArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCamera"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkHyperTreeGridNonOrientedGeometryCursor"
discard "forward decl of vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight"
## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkAdaptiveDataSetSurfaceFilter : public vtkGeometryFilter { public : static vtkAdaptiveDataSetSurfaceFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGeometryFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGeometryFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAdaptiveDataSetSurfaceFilter :: IsTypeOf ( type ) ; } static vtkAdaptiveDataSetSurfaceFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAdaptiveDataSetSurfaceFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAdaptiveDataSetSurfaceFilter * NewInstance ( ) const { return vtkAdaptiveDataSetSurfaceFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAdaptiveDataSetSurfaceFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAdaptiveDataSetSurfaceFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the renderer attached to this adaptive surface extractor
##  void SetRenderer ( vtkRenderer * ren ) ; virtual vtkRenderer * GetnameRenderer ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Renderer  address  << static_cast < vtkRenderer * > ( this -> Renderer ) ) ; return this -> Renderer ; } ; /@} *
##  Get the mtime of this object.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set/Get for active the circle selection viewport (defaut true)
##  virtual void SetCircleSelection ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CircleSelection  to  << _arg ) ; if ( this -> CircleSelection != _arg ) { this -> CircleSelection = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCircleSelection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CircleSelection  of  << this -> CircleSelection ) ; return this -> CircleSelection ; } ; /@} /@{ *
##  Set/Get for active the bounding box selection viewport (defaut false)
##  JB C'est un facteur supplementaire d'acceleration possible
##  JB uniquement si l'on ne peut faire de rotation dans la vue.
##  virtual void SetCircleSelectionBBSelection ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BBSelection  to  << _arg ) ; if ( this -> BBSelection != _arg ) { this -> BBSelection = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCircleSelectionBBSelection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BBSelection  of  << this -> BBSelection ) ; return this -> BBSelection ; } ; /@} /@{ *
##  JB Activation de la dependance au point de vue. Par defaut a True.
##  virtual void SetCircleSelectionBBSelectionViewPointDepend ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ViewPointDepend  to  << _arg ) ; if ( this -> ViewPointDepend != _arg ) { this -> ViewPointDepend = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCircleSelectionBBSelectionViewPointDepend ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ViewPointDepend  of  << this -> ViewPointDepend ) ; return this -> ViewPointDepend ; } ; /@} /@{ *
##  Set/Get for forced a fixed the level max (lost dynamicity) (defaut -1)
##  virtual void SetCircleSelectionBBSelectionViewPointDependFixedLevelMax ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FixedLevelMax  to  << _arg ) ; if ( this -> FixedLevelMax != _arg ) { this -> FixedLevelMax = _arg ; this -> Modified ( ) ; } } ; virtual int GetCircleSelectionBBSelectionViewPointDependFixedLevelMax ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FixedLevelMax  of  << this -> FixedLevelMax ) ; return this -> FixedLevelMax ; } ; /@} /@{ *
##  JB Set/Get the scale factor influence le calcul de l'adaptive view.
##  JB Pour un raffinement de 2, donner Scale=2*X revient a faire un
##  JB appel a DynamicDecimateLevelMax avec la valeur X. (defaut 1)
##  virtual void SetCircleSelectionBBSelectionViewPointDependFixedLevelMaxScale ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Scale  to  << _arg ) ; if ( this -> Scale != _arg ) { this -> Scale = _arg ; this -> Modified ( ) ; } } ; virtual double GetCircleSelectionBBSelectionViewPointDependFixedLevelMaxScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  of  << this -> Scale ) ; return this -> Scale ; } ; /@} /@{ *
##  JB Set/Get reduit de autant le niveau max de profondeur, calcule
##  JB dynamiquement a parcourir dans la
##  JB representation HTG. (defaut 0)
##  virtual void SetCircleSelectionBBSelectionViewPointDependFixedLevelMaxScaleDynamicDecimateLevelMax ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DynamicDecimateLevelMax  to  << _arg ) ; if ( this -> DynamicDecimateLevelMax != _arg ) { this -> DynamicDecimateLevelMax = _arg ; this -> Modified ( ) ; } } ; virtual int GetCircleSelectionBBSelectionViewPointDependFixedLevelMaxScaleDynamicDecimateLevelMax ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DynamicDecimateLevelMax  of  << this -> DynamicDecimateLevelMax ) ; return this -> DynamicDecimateLevelMax ; } ; /@} protected : vtkAdaptiveDataSetSurfaceFilter ( ) ; ~ vtkAdaptiveDataSetSurfaceFilter ( ) override ; int RequestData ( vtkInformation * vtkNotUsed ( request ) , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int DataObjectExecute ( vtkDataObject * input , vtkPolyData * output ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; *
##  Main routine to generate external boundary
##  void ProcessTrees ( vtkHyperTreeGrid * input , vtkPolyData * output ) ; *
##  Recursively descend into tree down to leaves
##  void RecursivelyProcessTreeNot3D ( vtkHyperTreeGridNonOrientedGeometryCursor * , int ) ; void RecursivelyProcessTree3D ( vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight * , int ) ; *
##  Process 1D leaves and issue corresponding edges (lines)
##  void ProcessLeaf1D ( vtkHyperTreeGridNonOrientedGeometryCursor * ) ; *
##  Process 2D leaves and issue corresponding faces (quads)
##  void ProcessLeaf2D ( vtkHyperTreeGridNonOrientedGeometryCursor * ) ; *
##  Process 3D leaves and issue corresponding cells (voxels)
##  void ProcessLeaf3D ( vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight * ) ; *
##  Helper method to generate a face based on its normal and offset from cursor origin
##  void AddFace ( vtkIdType , const double * , const double * , int , unsigned int ) ; vtkDataSetAttributes * InData ; vtkDataSetAttributes * OutData ; *
##  Dimension of input grid
##  unsigned int Dimension ; *
##  Orientation of input grid when dimension < 3
##  unsigned int Orientation ; *
##  Visibility Mask
##  vtkBitArray * Mask ; *
##  Storage for points of output unstructured mesh
##  vtkPoints * Points ; *
##  Storage for cells of output unstructured mesh
##  vtkCellArray * Cells ; *
##  Pointer to the renderer in use
##  vtkRenderer * Renderer ; *
##  First axis parameter for adaptive view
##  unsigned int Axis1 ; *
##  Second axis parameter for adaptive view
##  unsigned int Axis2 ; *
##  Maximum depth parameter for adaptive view
##  int LevelMax ; *
##  Parallel projection parameter for adaptive view
##  bool ParallelProjection ; *
##  Last renderer size parameters for adaptive view
##  int LastRendererSize [ 2 ] ; *
##  JB Activation de la dependance au point de vue
##  bool ViewPointDepend ; *
##  Last camera focal point coordinates for adaptive view
##  double LastCameraFocalPoint [ 3 ] ; *
##  Last camera parallel scale for adaptive view
##  double LastCameraParallelScale ; *
##  Bounds windows in the real coordinates
##  double WindowBounds [ 4 ] ; *
##  Product cell when in circle selection
##  bool CircleSelection ; *
##  Radius parameter for adaptive view
##  double Radius ; *
##  Product cell when in nounding box selection
##  bool BBSelection ; *
##  JB Forced, fixed the level depth, ignored automatic determination
##  int FixedLevelMax ; *
##  Scale factor for adaptive view
##  double Scale ; *
##  JB Decimate level max after automatic determination
##  int DynamicDecimateLevelMax ; private : vtkAdaptiveDataSetSurfaceFilter ( const vtkAdaptiveDataSetSurfaceFilter & ) = delete ; void operator = ( const vtkAdaptiveDataSetSurfaceFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

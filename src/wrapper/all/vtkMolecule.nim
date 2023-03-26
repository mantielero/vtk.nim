## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMolecule.h
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
##  @class   vtkMolecule
##  @brief   class describing a molecule
##
##
##
##  vtkMolecule and the convenience classes vtkAtom and vtkBond
##  describe the geometry and connectivity of a molecule. The molecule
##  can be constructed using the AppendAtom() and AppendBond() methods in one
##  of two ways; either by fully specifying the atom/bond in a single
##  call, or by incrementally setting the various attributes using the
##  convenience vtkAtom and vtkBond classes:
##
##  Single call:
##  \code
##  vtkMolecule *mol = vtkMolecule::New();
##  vtkAtom h1 = mol->AppendAtom(1, 0.0, 0.0, -0.5);
##  vtkAtom h2 = mol->AppendAtom(1, 0.0, 0.0,  0.5);
##  vtkBond b  = mol->AppendBond(h1, h2, 1);
##  \endcode
##
##  Incremental:
##  \code
##  vtkMolecule *mol = vtkMolecule::New();
##
##  vtkAtom h1 = mol->AppendAtom();
##  h1.SetAtomicNumber(1);
##  h1.SetPosition(0.0, 0.0, -0.5);
##
##  vtkAtom h2 = mol->AppendAtom();
##  h2.SetAtomicNumber(1);
##  vtkVector3d displacement (0.0, 0.0, 1.0);
##  h2.SetPosition(h1.GetPositionAsVector3d() + displacement);
##
##  vtkBond b  = mol->AppendBond(h1, h2, 1);
##  \endcode
##
##  Both of the above methods will produce the same molecule, two
##  hydrogens connected with a 1.0 Angstrom single bond, aligned to the
##  z-axis. The second example also demonstrates the use of VTK's
##  vtkVector class, which is fully supported by the Chemistry kit.
##
##  The vtkMolecule object is intended to be used with the
##  vtkMoleculeMapper class for visualizing molecular structure using
##  common rendering techniques.
##
##  \warning While direct use of the underlying vtkUndirectedGraph
##  structure is possible due to vtkMolecule's public inheritance, this
##  should not be relied upon and may change in the future.
##
##  @sa
##  vtkAtom vtkBond vtkMoleculeMapper vtkPeriodicTable
##

## !!!Ignored construct:  # vtkMolecule_h [NewLine] # vtkMolecule_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkSmartPointer.h  For vtkSmartPointer # vtkUndirectedGraph.h [NewLine] # vtkAtom.h  Simple proxy class dependent on vtkMolecule # vtkBond.h  Simple proxy class dependent on vtkMolecule [NewLine] # vtkVector.h  Small templated vector convenience class [NewLine] class vtkAbstractElectronicData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkMatrix3x3"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPoints"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkUnsignedShortArray"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkMolecule : public vtkUndirectedGraph { public : static vtkMolecule * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUndirectedGraph Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUndirectedGraph :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMolecule :: IsTypeOf ( type ) ; } static vtkMolecule * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMolecule * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMolecule * NewInstance ( ) const { return vtkMolecule :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUndirectedGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMolecule :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMolecule :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void Initialize ( ) override ; *
##  Return what type of dataset this is.
##  int GetDataObjectType ( ) override { return VTK_MOLECULE ; } *
##  Add new atom with atomic number 0 (dummy atom) at origin. Return
##  a vtkAtom that refers to the new atom.
##  vtkAtom AppendAtom ( ) { return this -> AppendAtom ( 0 , 0.0 , 0.0 , 0.0 ) ; } /@{ *
##  Add new atom with the specified atomic number and position. Return a
##  vtkAtom that refers to the new atom.
##  vtkAtom AppendAtom ( unsigned short atomicNumber , double x , double y , double z ) ; vtkAtom AppendAtom ( unsigned short atomicNumber , const vtkVector3f & pos ) { return this -> AppendAtom ( atomicNumber , pos [ 0 ] , pos [ 1 ] , pos [ 2 ] ) ; } vtkAtom AppendAtom ( unsigned short atomicNumber , double pos [ 3 ] ) { return this -> AppendAtom ( atomicNumber , pos [ 0 ] , pos [ 1 ] , pos [ 2 ] ) ; } /@} *
##  Return a vtkAtom that refers to the atom with the specified id.
##  vtkAtom GetAtom ( vtkIdType atomId ) ; *
##  Return the number of atoms in the molecule.
##  vtkIdType GetNumberOfAtoms ( ) ; /@{ *
##  Add a bond between the specified atoms, optionally setting the
##  bond order (default: 1). Return a vtkBond object referring to the
##  new bond.
##  vtkBond AppendBond ( vtkIdType atom1 , vtkIdType atom2 , unsigned short order = 1 ) ; vtkBond AppendBond ( const vtkAtom & atom1 , const vtkAtom & atom2 , unsigned short order = 1 ) { return this -> AppendBond ( atom1 . Id , atom2 . Id , order ) ; } /@} *
##  Return a vtkAtom that refers to the bond with the specified id.
##  vtkBond GetBond ( vtkIdType bondId ) ; *
##  Return the number of bonds in the molecule.
##  vtkIdType GetNumberOfBonds ( ) ; *
##  Return the atomic number of the atom with the specified id.
##  unsigned short GetAtomAtomicNumber ( vtkIdType atomId ) ; *
##  Set the atomic number of the atom with the specified id.
##  void SetAtomAtomicNumber ( vtkIdType atomId , unsigned short atomicNum ) ; /@{ *
##  Set the position of the atom with the specified id.
##  void SetAtomPosition ( vtkIdType atomId , const vtkVector3f & pos ) ; void SetAtomPosition ( vtkIdType atomId , double x , double y , double z ) ; void SetAtomPosition ( vtkIdType atomId , double pos [ 3 ] ) { this -> SetAtomPosition ( atomId , pos [ 0 ] , pos [ 1 ] , pos [ 2 ] ) ; } /@} /@{ *
##  Get the position of the atom with the specified id.
##  vtkVector3f GetAtomPosition ( vtkIdType atomId ) ; void GetAtomPosition ( vtkIdType atomId , float pos [ 3 ] ) ; void GetAtomPosition ( vtkIdType atomId , double pos [ 3 ] ) ; /@} /@{ *
##  Get/Set the bond order of the bond with the specified id
##  void SetBondOrder ( vtkIdType bondId , unsigned short order ) ; unsigned short GetBondOrder ( vtkIdType bondId ) ; /@} *
##  Get the bond length of the bond with the specified id
##
##  \note If the associated vtkBond object is already available,
##  vtkBond::GetBondLength is potentially much faster than this
##  function, as a list of all bonds may need to be constructed to
##  locate the appropriate bond.
##  \sa UpdateBondList()
##  double GetBondLength ( vtkIdType bondId ) ; /@{ *
##  Access the raw arrays used in this vtkMolecule instance
##  vtkPoints * GetAtomicPositionArray ( ) ; vtkUnsignedShortArray * GetAtomicNumberArray ( ) ; vtkUnsignedShortArray * GetBondOrdersArray ( ) ; /@} /@{ *
##  Set/Get the AbstractElectronicData-subclassed object for this molecule.
##  virtual vtkAbstractElectronicData * GetnameElectronicData ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ElectronicData  address  << static_cast < vtkAbstractElectronicData * > ( this -> ElectronicData ) ) ; return this -> ElectronicData ; } ; virtual void SetElectronicData ( vtkAbstractElectronicData * ) ; /@} *
##  Performs the same operation as ShallowCopy(),
##  but instead of reporting an error for an incompatible graph,
##  returns false.
##  bool CheckedShallowCopy ( vtkGraph * g ) override ; *
##  Performs the same operation as DeepCopy(),
##  but instead of reporting an error for an incompatible graph,
##  returns false.
##  bool CheckedDeepCopy ( vtkGraph * g ) override ; *
##  Shallow copies the data object into this molecule.
##  void ShallowCopy ( vtkDataObject * obj ) override ; *
##  Deep copies the data object into this molecule.
##  void DeepCopy ( vtkDataObject * obj ) override ; *
##  Shallow copies the atoms and bonds from @a m into @a this.
##  virtual void ShallowCopyStructure ( vtkMolecule * m ) ; *
##  Deep copies the atoms and bonds from @a m into @a this.
##  virtual void DeepCopyStructure ( vtkMolecule * m ) ; *
##  Shallow copies attributes (i.e. everything besides atoms and bonds) from
##  @a m into @a this.
##  virtual void ShallowCopyAttributes ( vtkMolecule * m ) ; *
##  Deep copies attributes (i.e. everything besides atoms and bonds) from
##  @a m into @a this.
##  virtual void DeepCopyAttributes ( vtkMolecule * m ) ; /@{ *
##  Obtain the plane that passes through the indicated bond with the given
##  normal. If the plane is set successfully, the function returns true.
##
##  If the normal is not orthogonal to the bond, a new normal will be
##  constructed in such a way that the plane will be orthogonal to
##  the plane spanned by the bond vector and the input normal vector.
##
##  This ensures that the plane passes through the bond, and the
##  normal is more of a "hint" indicating the orientation of the plane.
##
##  The new normal (n) is defined as the input normal vector (n_i) minus
##  the projection of itself (proj[n_i]_v) onto the bond vector (v):
##
##  @verbatim
##  v ^
##  |  n = (n_i - proj[n_j]_v)
##  proj[n_i]_v ^  |----x
##  |  |   /
##  |  |  / n_i
##  |  | /
##  |  |/
##  @endverbatim
##
##  If n_i is parallel to v, a warning will be printed and no plane will be
##  added. Obviously, n_i must not be parallel to v.
##  static bool GetPlaneFromBond ( const vtkBond & bond , const vtkVector3f & normal , vtkPlane * plane ) ; static bool GetPlaneFromBond ( const vtkAtom & atom1 , const vtkAtom & atom2 , const vtkVector3f & normal , vtkPlane * plane ) ; /@} *
##  Return true if a unit cell lattice is defined.
##  bool HasLattice ( ) ; *
##  Remove any unit cell lattice information from the molecule.
##  void ClearLattice ( ) ; /@{ *
##  The unit cell vectors. The matrix is stored using a row-major layout, with
##  the vectors encoded as columns.
##  void SetLattice ( vtkMatrix3x3 * matrix ) ; void SetLattice ( const vtkVector3d & a , const vtkVector3d & b , const vtkVector3d & c ) ; /@} *
##  Get the unit cell lattice vectors. The matrix is stored using a row-major
##  layout, with the vectors encoded as columns. Will return nullptr if no
##  unit cell information is available.
##  @sa GetLatticeOrigin
##  vtkMatrix3x3 * GetLattice ( ) ; /@{ *
##  Get the unit cell lattice vectors, and optionally, the origin.
##  void GetLattice ( vtkVector3d & a , vtkVector3d & b , vtkVector3d & c ) ; void GetLattice ( vtkVector3d & a , vtkVector3d & b , vtkVector3d & c , vtkVector3d & origin ) ; /@} /@{ *
##  Get the unit cell origin (for rendering purposes).
##  virtual vtkVector3d GetLatticeOrigin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LatticeOrigin  of  << this -> LatticeOrigin ) ; return this -> LatticeOrigin ; } ; virtual void SetLatticeOrigin ( vtkVector3d _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LatticeOrigin  to  << _arg ) ; if ( this -> LatticeOrigin != _arg ) { this -> LatticeOrigin = _arg ; this -> Modified ( ) ; } } ; /@} *
##  Get the array that defines the ghost type of each atom.
##  vtkUnsignedCharArray * GetAtomGhostArray ( ) ; *
##  Allocate ghost array for atoms.
##  void AllocateAtomGhostArray ( ) ; *
##  Get the array that defines the ghost type of each bond.
##  vtkUnsignedCharArray * GetBondGhostArray ( ) ; *
##  Allocate ghost array for bonds.
##  void AllocateBondGhostArray ( ) ; *
##  Initialize a molecule with an atom per input point.
##  Parameters atomPositions and atomicNumberArray should have the same size.
##  int Initialize ( vtkPoints * atomPositions , vtkDataArray * atomicNumberArray , vtkDataSetAttributes * atomData ) ; *
##  Overloads Initialize method.
##  int Initialize ( vtkPoints * atomPositions , vtkDataSetAttributes * atomData ) { return this -> Initialize ( atomPositions , nullptr , atomData ) ; } *
##  Use input molecule points, atomic number and atomic data to initialize the new molecule.
##  int Initialize ( vtkMolecule * molecule ) ; /@{ *
##  Retrieve a molecule from an information vector.
##  static vtkMolecule * GetData ( vtkInformation * info ) ; static vtkMolecule * GetData ( vtkInformationVector * v , int i = 0 ) ; /@} *
##  Return the VertexData of the underlying graph
##  vtkDataSetAttributes * GetAtomData ( ) { return this -> GetVertexData ( ) ; } *
##  Return the EdgeData of the underlying graph
##  vtkDataSetAttributes * GetBondData ( ) { return this -> GetEdgeData ( ) ; } *
##  Return the edge id from the underlying graph.
##  vtkIdType GetBondId ( vtkIdType a , vtkIdType b ) { return this -> GetEdgeId ( a , b ) ; } /@{ *
##  Get/Set the atomic number array name.
##  virtual void SetAtomicNumberArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AtomicNumberArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> AtomicNumberArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> AtomicNumberArrayName && _arg && ( ! strcmp ( this -> AtomicNumberArrayName , _arg ) ) ) { return ; } delete [ ] this -> AtomicNumberArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> AtomicNumberArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> AtomicNumberArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetAtomicNumberArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << AtomicNumberArrayName  of  << ( this -> AtomicNumberArrayName ? this -> AtomicNumberArrayName : (null) ) ) ; return this -> AtomicNumberArrayName ; } ; /@} /@{ *
##  Get/Set the bond orders array name.
##  virtual void SetAtomicNumberArrayNameBondOrdersArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BondOrdersArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> BondOrdersArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> BondOrdersArrayName && _arg && ( ! strcmp ( this -> BondOrdersArrayName , _arg ) ) ) { return ; } delete [ ] this -> BondOrdersArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> BondOrdersArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> BondOrdersArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetAtomicNumberArrayNameBondOrdersArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << BondOrdersArrayName  of  << ( this -> BondOrdersArrayName ? this -> BondOrdersArrayName : (null) ) ) ; return this -> BondOrdersArrayName ; } ; /@} *
##  Return the actual size of the data in kibibytes (1024 bytes). This number
##  is valid only after the pipeline has updated. The memory size
##  returned is guaranteed to be greater than or equal to the
##  memory required to represent the data (e.g., extra space in
##  arrays, etc. are not included in the return value).
##  unsigned long GetActualMemorySize ( ) override ; protected : vtkMolecule ( ) ; ~ vtkMolecule ( ) override ; *
##  Copy bonds and atoms.
##  virtual void CopyStructureInternal ( vtkMolecule * m , bool deep ) ; *
##  Copy everything but bonds and atoms.
##  virtual void CopyAttributesInternal ( vtkMolecule * m , bool deep ) ; /@{ *
##  The graph superclass does not provide fast random access to the
##  edge (bond) data. All random access is performed using a lookup
##  table that must be rebuilt periodically. These allow for lazy
##  building of the lookup table
##  bool BondListIsDirty ; void SetBondListDirty ( ) { this -> BondListIsDirty = true ; } void UpdateBondList ( ) ; vtkIdTypeArray * GetBondList ( ) ; /@} friend class vtkAtom ; friend class vtkBond ; vtkAbstractElectronicData * ElectronicData ; vtkSmartPointer < vtkMatrix3x3 > Lattice ; vtkVector3d LatticeOrigin ; vtkUnsignedCharArray * AtomGhostArray ; vtkUnsignedCharArray * BondGhostArray ; char * AtomicNumberArrayName ; char * BondOrdersArrayName ; private : vtkMolecule ( const vtkMolecule & ) = delete ; void operator = ( const vtkMolecule & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

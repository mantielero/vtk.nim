## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMoleculeReaderBase.h
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
##  @class   vtkMoleculeReaderBase
##  @brief   Read molecular data files
##
##  vtkMoleculeReaderBase is a source object that reads molecule files.
##  The FileName must be specified
##
##  @par Thanks:
##  Dr. Jean M. Favre who originally developed and contributed this class
##  Angelos Angelopoulos and Spiros Tsalikis for revisions
##

## !!!Ignored construct:  # vtkMoleculeReaderBase_h [NewLine] # vtkMoleculeReaderBase_h [NewLine] # vtkIOChemistryModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkUnsignedIntArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkMolecule"
discard "forward decl of vtkPeriodicTable"
## !!!Ignored construct:  class VTKIOCHEMISTRY_EXPORT vtkMoleculeReaderBase : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMoleculeReaderBase :: IsTypeOf ( type ) ; } static vtkMoleculeReaderBase * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMoleculeReaderBase * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMoleculeReaderBase * NewInstance ( ) const { return vtkMoleculeReaderBase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMoleculeReaderBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMoleculeReaderBase :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@{ *
##  A scaling factor to compute bonds between non-hydrogen atoms
##  virtual void SetBScale ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BScale  to  << _arg ) ; if ( this -> BScale != _arg ) { this -> BScale = _arg ; this -> Modified ( ) ; } } ; virtual double GetBScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BScale  of  << this -> BScale ) ; return this -> BScale ; } ; /@} /@{ *
##  A scaling factor to compute bonds with hydrogen atoms.
##  virtual void SetBScaleHBScale ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HBScale  to  << _arg ) ; if ( this -> HBScale != _arg ) { this -> HBScale = _arg ; this -> Modified ( ) ; } } ; virtual double GetBScaleHBScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HBScale  of  << this -> HBScale ) ; return this -> HBScale ; } ; /@} *
##  Number of atoms in the molecule.
##  virtual vtkIdType GetBScaleHBScaleNumberOfAtoms ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfAtoms  of  << this -> NumberOfAtoms ) ; return this -> NumberOfAtoms ; } ; *
##  Number of models that make up the molecule.
##  virtual unsigned int GetBScaleHBScaleNumberOfAtomsNumberOfModels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfModels  of  << this -> NumberOfModels ) ; return this -> NumberOfModels ; } ; protected : vtkMoleculeReaderBase ( ) ; ~ vtkMoleculeReaderBase ( ) override ; char * FileName ; double BScale ; double HBScale ; vtkIdType NumberOfAtoms ; unsigned int NumberOfModels ; int FillOutputPortInformation ( int , vtkInformation * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Reads a molecule from the passed file pointer and creates a vtkPolyData.
##
##  @param fp Molecule file pointer.
##  @param output Pointer to output vtkPolyData.
##
##  @return Zero upon successfully reading a molecule.
##  int ReadMolecule ( FILE * fp , vtkPolyData * output ) ; *
##  Given a string for the type (name) of an atom, returns a unique
##  number for that atom.
##
##  @param atomType A string for the type (name) of an atom, e.g. "He" for a helium atom.
##
##  @return Unique number for the atom type.
##  unsigned int MakeAtomType ( const char * atomType ) ; *
##  Creates molecular bonds (VTK cells) given atomic coordinates (VTK points) and atom types.
##
##  @param points Atomic (VTK points) coordinates.
##  @param atomTypes Array containing the atom type numbers.
##  @param newBonds Output bonds.
##
##  @return Number of bonds.
##  unsigned int MakeBonds ( vtkPoints * points , vtkIdTypeArray * atomTypes , vtkCellArray * newBonds ) ; vtkNew < vtkPeriodicTable > PeriodicTable ; vtkSmartPointer < vtkMolecule > Molecule ; vtkSmartPointer < vtkPoints > Points ; vtkSmartPointer < vtkUnsignedCharArray > RGB ; vtkSmartPointer < vtkFloatArray > Radii ; vtkSmartPointer < vtkIdTypeArray > AtomType ; vtkSmartPointer < vtkStringArray > AtomTypeStrings ; vtkSmartPointer < vtkIdTypeArray > Residue ; vtkSmartPointer < vtkUnsignedCharArray > Chain ; vtkSmartPointer < vtkUnsignedCharArray > SecondaryStructures ; vtkSmartPointer < vtkUnsignedCharArray > SecondaryStructuresBegin ; vtkSmartPointer < vtkUnsignedCharArray > SecondaryStructuresEnd ; vtkSmartPointer < vtkUnsignedCharArray > IsHetatm ; vtkSmartPointer < vtkUnsignedIntArray > Model ; virtual void ReadSpecificMolecule ( FILE * fp ) = 0 ; private : vtkMoleculeReaderBase ( const vtkMoleculeReaderBase & ) = delete ; void operator = ( const vtkMoleculeReaderBase & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

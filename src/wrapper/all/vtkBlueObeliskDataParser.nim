## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBlueObeliskDataParser.h
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
##  @class   vtkBlueObeliskDataParser
##  @brief   Fill a vtkBlueObeliskData
##  container with data from the BODR XML dataset.
##
##
##  The Blue Obelisk Data Repository is a free, open repository of
##  chemical information. This class extracts the BODR information into
##  vtk arrays, which are stored in a vtkBlueObeliskData object.
##
##  \warning The vtkBlueObeliskDataParser class should never need to be
##  used directly. For convenient access to the BODR data, use
##  vtkPeriodicTable. For access to the raw arrays produced by this
##  parser, see the vtkBlueObeliskData class. A static
##  vtkBlueObeliskData object is accessible via
##  vtkPeriodicTable::GetBlueObeliskData().
##
##  @sa
##  vtkPeriodicTable vtkBlueObeliskData
##

## !!!Ignored construct:  # vtkBlueObeliskDataParser_h [NewLine] # vtkBlueObeliskDataParser_h [NewLine] # vtkDomainsChemistryModule.h  For export macro # vtkXMLParser.h [NewLine] # vtkSmartPointer.h  For vtkSmartPointer [NewLine] class vtkAbstractArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkBlueObeliskData"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkStdString"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkUnsignedShortArray"
## !!!Ignored construct:  class VTKDOMAINSCHEMISTRY_EXPORT vtkBlueObeliskDataParser : public vtkXMLParser { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLParser Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLParser :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBlueObeliskDataParser :: IsTypeOf ( type ) ; } static vtkBlueObeliskDataParser * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBlueObeliskDataParser * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBlueObeliskDataParser * NewInstance ( ) const { return vtkBlueObeliskDataParser :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLParser :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBlueObeliskDataParser :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBlueObeliskDataParser :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkBlueObeliskDataParser * New ( ) ; *
##  Set the target vtkBlueObeliskData object that this parser will
##  populate
##  virtual void SetTarget ( vtkBlueObeliskData * bodr ) ; *
##  Start parsing
##  int Parse ( ) override ; /@{ *
##  These are only implemented to prevent compiler warnings about hidden
##  virtual overloads. This function simply call Parse(); the arguments are
##  ignored.
##  int Parse ( const char * ) override ; int Parse ( const char * , unsigned int ) override ; /@} protected : vtkBlueObeliskDataParser ( ) ; ~ vtkBlueObeliskDataParser ( ) override ; void StartElement ( const char * name , const char * * attr ) override ; void EndElement ( const char * name ) override ; void CharacterDataHandler ( const char * data , int length ) override ; void SetCurrentValue ( const char * data , int length ) ; void SetCurrentValue ( const char * data ) ; vtkBlueObeliskData * Target ; bool IsProcessingAtom ; void NewAtomStarted ( const char * * attr ) ; void NewAtomFinished ( ) ; bool IsProcessingValue ; void NewValueStarted ( const char * * attr ) ; void NewValueFinished ( ) ; std :: string CharacterDataValueBuffer ; enum AtomValueType { None = 0 , AtomicNumber , Symbol , Name , PeriodicTableBlock , ElectronicConfiguration , Family , Mass , ExactMass , IonizationEnergy , ElectronAffinity , PaulingElectronegativity , CovalentRadius , VDWRadius , DefaultColor , BoilingPoint , MeltingPoint , Period , Group } CurrentValueType ; int CurrentAtomicNumber ; vtkStdString * CurrentSymbol ; vtkStdString * CurrentName ; vtkStdString * CurrentPeriodicTableBlock ; vtkStdString * CurrentElectronicConfiguration ; vtkStdString * CurrentFamily ; float CurrentMass ; float CurrentExactMass ; float CurrentIonizationEnergy ; float CurrentElectronAffinity ; float CurrentPaulingElectronegativity ; float CurrentCovalentRadius ; float CurrentVDWRadius ; float CurrentDefaultColor [ 3 ] ; float CurrentBoilingPoint ; float CurrentMeltingPoint ; unsigned int CurrentPeriod ; unsigned int CurrentGroup ; private : vtkBlueObeliskDataParser ( const vtkBlueObeliskDataParser & ) = delete ; void operator = ( const vtkBlueObeliskDataParser & ) = delete ; /@{ *
##  Resize array if needed and set the entry at ind to val.
##  static void ResizeArrayIfNeeded ( vtkAbstractArray * arr , vtkIdType ind ) ; static void ResizeAndSetValue ( vtkStdString * val , vtkStringArray * arr , vtkIdType ind ) ; static void ResizeAndSetValue ( float val , vtkFloatArray * arr , vtkIdType ind ) ; static void ResizeAndSetValue ( unsigned short val , vtkUnsignedShortArray * arr , vtkIdType ind ) ; /@} /@{ *
##  Parse types from const char *
##  static int parseInt ( const char * ) ; static float parseFloat ( const char * ) ; static void parseFloat3 ( const char * str , float [ 3 ] ) ; static unsigned short parseUnsignedShort ( const char * ) ; /@} /@{ *
##  Convert a string to lower case. This will modify the input string
##  and return the input pointer.
##  static vtkStdString * ToLower ( vtkStdString * ) ; /@} } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkObjectFactory.h
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
##  @class   vtkObjectFactory
##  @brief   abstract base class for vtkObjectFactories
##
##  vtkObjectFactory is used to create vtk objects.   The base class
##  vtkObjectFactory contains a static method CreateInstance which is used
##  to create vtk objects from the list of registered vtkObjectFactory
##  sub-classes.   The first time CreateInstance is called, all dll's or shared
##  libraries in the environment variable VTK_AUTOLOAD_PATH are loaded into
##  the current process.   The C functions vtkLoad, and vtkGetFactoryVersion are
##  called on each dll.  To implement these functions in a shared library or
##  dll, use the macro:
##  VTK_FACTORY_INTERFACE_IMPLEMENT.
##  VTK_AUTOLOAD_PATH is an environment variable
##  containing a colon separated (semi-colon on win32) list of paths.
##
##  The vtkObjectFactory can be use to override the creation of any object
##  in VTK with a sub-class of that object.  The factories can be registered
##  either at run time with the VTK_AUTOLOAD_PATH, or at compile time
##  with the vtkObjectFactory::RegisterFactory method.
##
##

## !!!Ignored construct:  # vtkObjectFactory_h [NewLine] # vtkObjectFactory_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkDebugLeaksManager.h  Must be included before singletons # vtkFeatures.h  For VTK_ALL_NEW_OBJECT_FACTORY # vtkObject.h [NewLine] # < string >  for std::string [NewLine] class vtkObjectFactoryCollection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkOverrideInformationCollection"
discard "forward decl of vtkCollection"
## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkObjectFactory : public vtkObject { public :  Class Methods used to interface with the registered factories *
##  Create and return an instance of the named vtk object.
##  Each loaded vtkObjectFactory will be asked in the order
##  the factory was in the VTK_AUTOLOAD_PATH.  After the
##  first factory returns the object no other factories are asked.
##  isAbstract is no longer used. This method calls
##  vtkObjectBase::InitializeObjectBase() on the instance when the
##  return value is non-nullptr.
##  VTK_NEWINSTANCE static vtkObject * CreateInstance ( const char * vtkclassname , bool isAbstract = false ) ; *
##  Create all possible instances of the named vtk object.
##  Each registered vtkObjectFactory will be asked, and the
##  result will be stored in the user allocated vtkCollection
##  passed in to the function.
##  static void CreateAllInstance ( const char * vtkclassname , vtkCollection * retList ) ; *
##  Re-check the VTK_AUTOLOAD_PATH for new factory libraries.
##  This calls UnRegisterAll before re-loading
##  static void ReHash ( ) ; *
##  Register a factory so it can be used to create vtk objects
##  static void RegisterFactory ( vtkObjectFactory * ) ; *
##  Remove a factory from the list of registered factories
##  static void UnRegisterFactory ( vtkObjectFactory * ) ; *
##  Unregister all factories
##  static void UnRegisterAllFactories ( ) ; *
##  Return the list of all registered factories.  This is NOT a copy,
##  do not remove items from this list!
##  static vtkObjectFactoryCollection * GetRegisteredFactories ( ) ; *
##  return 1 if one of the registered factories
##  overrides the given class name
##  static int HasOverrideAny ( const char * className ) ; *
##  Fill the given collection with all the overrides for
##  the class with the given name.
##  static void GetOverrideInformation ( const char * name , vtkOverrideInformationCollection * ) ; *
##  Set the enable flag for a given named class for all registered
##  factories.
##  static void SetAllEnableFlags ( vtkTypeBool flag , const char * className ) ; *
##  Set the enable flag for a given named class subclass pair
##  for all registered factories.
##  static void SetAllEnableFlags ( vtkTypeBool flag , const char * className , const char * subclassName ) ;  Instance methods to be used on individual instances of vtkObjectFactory  Methods from vtkObject protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkObjectFactory :: IsTypeOf ( type ) ; } static vtkObjectFactory * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkObjectFactory * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkObjectFactory * NewInstance ( ) const { return vtkObjectFactory :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkObjectFactory :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkObjectFactory :: New ( ) ; } public : ; *
##  Print ObjectFactory to stream.
##  void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  All sub-classes of vtkObjectFactory should must return the version of
##  VTK they were built with.  This should be implemented with the macro
##  VTK_SOURCE_VERSION and NOT a call to vtkVersion::GetVTKSourceVersion.
##  As the version needs to be compiled into the file as a string constant.
##  This is critical to determine possible incompatible dynamic factory loads.
##  virtual const char * GetVTKSourceVersion ( ) = 0 ; *
##  Return a descriptive string describing the factory.
##  virtual const char * GetDescription ( ) = 0 ; *
##  Return number of overrides this factory can create.
##  virtual int GetNumberOfOverrides ( ) ; *
##  Return the name of a class override at the given index.
##  virtual const char * GetClassOverrideName ( int index ) ; *
##  Return the name of the class that will override the class
##  at the given index
##  virtual const char * GetClassOverrideWithName ( int index ) ; *
##  Return the enable flag for the class at the given index.
##  virtual vtkTypeBool GetEnableFlag ( int index ) ; *
##  Return the description for a the class override at the given
##  index.
##  virtual const char * GetOverrideDescription ( int index ) ; /@{ *
##  Set and Get the Enable flag for the specific override of className.
##  if subclassName is null, then it is ignored.
##  virtual void SetEnableFlag ( vtkTypeBool flag , const char * className , const char * subclassName ) ; virtual vtkTypeBool GetEnableFlag ( const char * className , const char * subclassName ) ; /@} *
##  Return 1 if this factory overrides the given class name, 0 otherwise.
##  virtual int HasOverride ( const char * className ) ; *
##  Return 1 if this factory overrides the given class name, 0 otherwise.
##  virtual int HasOverride ( const char * className , const char * subclassName ) ; *
##  Set all enable flags for the given class to 0.  This will
##  mean that the factory will stop producing class with the given
##  name.
##  virtual void Disable ( const char * className ) ; /@{ *
##  This returns the path to a dynamically loaded factory.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetLibraryPath ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LibraryPath  of  << ( this -> LibraryPath ? this -> LibraryPath : (null) ) ) ; return this -> LibraryPath ; } ; /@} typedef vtkObject * ( * CreateFunction ) ( ) ; protected : *
##  Register object creation information with the factory.
##  void RegisterOverride ( const char * classOverride , const char * overrideClassName , const char * description , int enableFlag , CreateFunction createFunction ) ; *
##  This method is provided by sub-classes of vtkObjectFactory.
##  It should create the named vtk object or return 0 if that object
##  is not supported by the factory implementation.
##  virtual vtkObject * CreateObject ( const char * vtkclassname ) ; vtkObjectFactory ( ) ; ~ vtkObjectFactory ( ) override ; struct OverrideInformation { char * Description ; char * OverrideWithName ; vtkTypeBool EnabledFlag ; CreateFunction CreateCallback ; } ; OverrideInformation * OverrideArray ; char * * OverrideClassNames ; int SizeOverrideArray ; int OverrideArrayLength ; private : void GrowOverrideArray ( ) ; *
##  Initialize the static members of vtkObjectFactory.   RegisterDefaults
##  is called here.
##  static void Init ( ) ; *
##  Register default factories which are not loaded at run time.
##  static void RegisterDefaults ( ) ; *
##  Load dynamic factories from the VTK_AUTOLOAD_PATH
##  static void LoadDynamicFactories ( ) ; *
##  Load all dynamic libraries in the given path
##  static void LoadLibrariesInPath ( const std :: string & ) ;  list of registered factories static vtkObjectFactoryCollection * RegisteredFactories ;  member variables for a factory set by the base class
##  at load or register time void * LibraryHandle ; char * LibraryVTKVersion ; char * LibraryPath ; private : vtkObjectFactory ( const vtkObjectFactory & ) = delete ; void operator = ( const vtkObjectFactory & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Implementation detail for Schwarz counter idiom.

## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkObjectFactoryRegistryCleanup { public : vtkObjectFactoryRegistryCleanup ( ) ; ~ vtkObjectFactoryRegistryCleanup ( ) ; private : vtkObjectFactoryRegistryCleanup ( const vtkObjectFactoryRegistryCleanup & other ) = delete ; vtkObjectFactoryRegistryCleanup & operator = ( const vtkObjectFactoryRegistryCleanup & rhs ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

var vtkObjectFactoryRegistryCleanupInstance* {.
    importcpp: "vtkObjectFactoryRegistryCleanupInstance",
    header: "vtkObjectFactory.h".}: vtkObjectFactoryRegistryCleanup

##  Macro to create an object creation function.
##  The name of the function will by vtkObjectFactoryCreateclassname
##  where classname is the name of the class being created

## !!!Ignored construct:  # VTK_CREATE_CREATE_FUNCTION ( classname ) static vtkObject * vtkObjectFactoryCreate ## classname ( ) { return classname :: New ( ) ; } [NewLine] # [NewLine] # VTK_FACTORY_INTERFACE_EXPORT VTKCOMMONCORE_EXPORT [NewLine]  Macro to create the interface "C" functions used in
##  a dll or shared library that contains a VTK object factory.
##  Put this function in the .cxx file of your object factory,
##  and pass in the name of the factory sub-class that you want
##  the dll to create. # VTK_FACTORY_INTERFACE_IMPLEMENT ( factoryName ) extern C VTK_FACTORY_INTERFACE_EXPORT const char * vtkGetFactoryVersion ( ) { return VTK_SOURCE_VERSION ; } extern C VTK_FACTORY_INTERFACE_EXPORT vtkObjectFactory * vtkLoad ( ) { return factoryName :: New ( ) ; } [NewLine]  Macro to implement the body of the object factory form of the New() method. # VTK_OBJECT_FACTORY_NEW_BODY ( thisClass ) vtkObject * ret = vtkObjectFactory :: CreateInstance ( # , false ) ;
## Error: token expected: ; but got: ##!!!

if ret:
  return static_cast[ptr thisClass](ret)
var result* {.importcpp: "result", header: "vtkObjectFactory.h".}: auto

result.InitializeObjectBase()
## !!!Ignored construct:  return result [NewLine]  Macro to implement the body of the abstract object factory form of the New()
##  method, i.e. an abstract base class that can only be instantiated if the
##  object factory overrides it. # VTK_ABSTRACT_OBJECT_FACTORY_NEW_BODY ( thisClass ) vtkObject * ret = vtkObjectFactory :: CreateInstance ( # , true ) ;
## Error: token expected: ; but got: [NewLine]!!!

if ret:
  return static_cast[ptr thisClass](ret)
while true:
  if GetGlobalWarningDisplay():
    var endl: EndlType
    UseEndl(endl)
    var vtkmsg: vtkOStrStreamWrapper
    ## !!!Ignored construct:  vtkmsg <<  Error: no override found for ' # '. ;
    ## Error: expected ';'!!!
    var _filename: string
    vtkOutputWindowDisplayGenericWarningText(_filename.c_str(), __LINE__,
        vtkmsg.str())
    vtkmsg.rdbuf().freeze(0)
  if not false:
    break
## !!!Ignored construct:  return nullptr [NewLine]  Macro to implement the body of the standard form of the New() method. # defined ( VTK_ALL_NEW_OBJECT_FACTORY ) [NewLine] # VTK_STANDARD_NEW_BODY ( thisClass ) VTK_OBJECT_FACTORY_NEW_BODY ( thisClass ) [NewLine] # [NewLine] # VTK_STANDARD_NEW_BODY ( thisClass ) auto result = new thisClass ;
## Error: token expected: ; but got: [NewLine]!!!

result.InitializeObjectBase()
## !!!Ignored construct:  return result [NewLine] # [NewLine]  Macro to implement the standard form of the New() method. # vtkStandardNewMacro ( thisClass ) thisClass * thisClass :: New ( ) { VTK_STANDARD_NEW_BODY ( thisClass ) ; } [NewLine]  Macro to implement the ExtendedNew() to create an object in a memkind extended memory space. If
##  VTK is not compiled with VTK_USE_MEMKIND this is equivalent to New() # vtkStandardExtendedNewMacro ( thisClass ) thisClass * thisClass :: ExtendedNew ( ) { auto mkhold = vtkMemkindRAII ( true ) ; ( void ) mkhold ; return thisClass :: New ( ) ; } [NewLine]  Macro to implement the object factory form of the New() method. # vtkObjectFactoryNewMacro ( thisClass ) thisClass * thisClass :: New ( ) { VTK_OBJECT_FACTORY_NEW_BODY ( thisClass ) ; } [NewLine]  Macro to implement the abstract object factory form of the New() method.
##  That is an abstract base class that can only be instantiated if the
##  object factory overrides it. # vtkAbstractObjectFactoryNewMacro ( thisClass ) thisClass * thisClass :: New ( ) { VTK_ABSTRACT_OBJECT_FACTORY_NEW_BODY ( thisClass ) ; } [NewLine]
## Error: token expected: ; but got: [NewLine]!!!

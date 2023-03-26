## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkObject.h
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
##  @class   vtkObject
##  @brief   abstract base class for most VTK objects
##
##  vtkObject is the base class for most objects in the visualization
##  toolkit. vtkObject provides methods for tracking modification time,
##  debugging, printing, and event callbacks. Most objects created
##  within the VTK framework should be a subclass of vtkObject or one
##  of its children.  The few exceptions tend to be very small helper
##  classes that usually never get instantiated or situations where
##  multiple inheritance gets in the way.  vtkObject also performs
##  reference counting: objects that are reference counted exist as
##  long as another object uses them. Once the last reference to a
##  reference counted object is removed, the object will spontaneously
##  destruct.
##
##  @warning
##  Note: in VTK objects should always be created with the New() method
##  and deleted with the Delete() method. VTK objects cannot be
##  allocated off the stack (i.e., automatic objects) because the
##  constructor is a protected method.
##
##  @sa
##  vtkCommand vtkTimeStamp
##
import
    vtkType, vtkIndent
import
  vtkCommonCoreModule, vtkObjectBase, vtkTimeStamp, vtkWeakPointerBase # vtkSetGet, 

type
  ostream* = object # FIXME

discard "forward decl of vtkSubjectHelper"
discard "forward decl of vtkCommand"
type
  vtkObject* {.importcpp: "vtkObject", header: "vtkObject.h", bycopy.} = object of vtkObjectBase
    #vtkObject* {.importc: "vtkObject".}: VTK_NEWINSTANCE
    ##  Enable debug messages
    ##  Keep track of modification time
    ##  List of observers on this object
    ##  Name of this object for reporting
    ## /@{
    ## *
    ##  These methods allow a command to exclusively grab all events. (This
    ##  method is typically used by widgets to grab events once an event
    ##  sequence begins.)  These methods are provided in support of the
    ##  public methods found in the class vtkInteractorObserver. Note that
    ##  these methods are designed to support vtkInteractorObservers since
    ##  they use two separate vtkCommands to watch for mouse and keypress events.
    ##

  vtkObjectSuperclass* = vtkObjectBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkObject::IsTypeOf(@)",
    header: "vtkObject.h".}
proc IsA*(this: var vtkObject; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkObject.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkObject {.
    importcpp: "vtkObject::SafeDownCast(@)", header: "vtkObject.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkObject :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObjectBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : virtual vtkObjectBase * NewInstanceInternal ( ) const { return vtkObject :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkObject {.importcpp: "vtkObject::New(@)", header: "vtkObject.h".}
## !!!Ignored construct:  # _WIN32 [NewLine]  avoid dll boundary problems void * operator new ( size_t tSize ) ;
## Error: identifier expected, but got:  avoid dll boundary problems!!!

proc `delete`*(this: var vtkObject; p: pointer) {.
    importcpp: "vtkObject::operator delete", header: "vtkObject.h".}
proc DebugOn*(this: var vtkObject) {.importcpp: "DebugOn", header: "vtkObject.h".}
proc DebugOff*(this: var vtkObject) {.importcpp: "DebugOff", header: "vtkObject.h".}
proc GetDebug*(this: var vtkObject): bool {.importcpp: "GetDebug",
                                       header: "vtkObject.h".}
proc SetDebug*(this: var vtkObject; debugFlag: bool) {.importcpp: "SetDebug",
    header: "vtkObject.h".}
proc BreakOnError*() {.importcpp: "vtkObject::BreakOnError(@)",
                     header: "vtkObject.h".}
proc Modified*(this: var vtkObject) {.importcpp: "Modified", header: "vtkObject.h".}
proc GetMTime*(this: var vtkObject): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkObject.h".}
proc PrintSelf*(this: var vtkObject; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkObject.h".}
proc SetGlobalWarningDisplay*(val: cint) {.importcpp: "vtkObject::SetGlobalWarningDisplay(@)",
                                        header: "vtkObject.h".}
proc GlobalWarningDisplayOn*() {.importcpp: "vtkObject::GlobalWarningDisplayOn(@)",
                               header: "vtkObject.h".}
proc GlobalWarningDisplayOff*() {.importcpp: "vtkObject::GlobalWarningDisplayOff(@)",
                                header: "vtkObject.h".}
proc GetGlobalWarningDisplay*(): cint {.importcpp: "vtkObject::GetGlobalWarningDisplay(@)",
                                     header: "vtkObject.h".}
proc AddObserver*(this: var vtkObject; event: culong; a3: ptr vtkCommand;
                 priority: cfloat = 0.0f): culong {.importcpp: "AddObserver",
    header: "vtkObject.h".}
proc AddObserver*(this: var vtkObject; event: cstring; a3: ptr vtkCommand;
                 priority: cfloat = 0.0f): culong {.importcpp: "AddObserver",
    header: "vtkObject.h".}
proc GetCommand*(this: var vtkObject; tag: culong): ptr vtkCommand {.
    importcpp: "GetCommand", header: "vtkObject.h".}
proc RemoveObserver*(this: var vtkObject; a2: ptr vtkCommand) {.
    importcpp: "RemoveObserver", header: "vtkObject.h".}
proc RemoveObservers*(this: var vtkObject; event: culong; a3: ptr vtkCommand) {.
    importcpp: "RemoveObservers", header: "vtkObject.h".}
proc RemoveObservers*(this: var vtkObject; event: cstring; a3: ptr vtkCommand) {.
    importcpp: "RemoveObservers", header: "vtkObject.h".}
proc HasObserver*(this: var vtkObject; event: culong; a3: ptr vtkCommand): vtkTypeBool {.
    importcpp: "HasObserver", header: "vtkObject.h".}
proc HasObserver*(this: var vtkObject; event: cstring; a3: ptr vtkCommand): vtkTypeBool {.
    importcpp: "HasObserver", header: "vtkObject.h".}
proc RemoveObserver*(this: var vtkObject; tag: culong) {.importcpp: "RemoveObserver",
    header: "vtkObject.h".}
proc RemoveObservers*(this: var vtkObject; event: culong) {.
    importcpp: "RemoveObservers", header: "vtkObject.h".}
proc RemoveObservers*(this: var vtkObject; event: cstring) {.
    importcpp: "RemoveObservers", header: "vtkObject.h".}
proc RemoveAllObservers*(this: var vtkObject) {.importcpp: "RemoveAllObservers",
    header: "vtkObject.h".}
proc HasObserver*(this: var vtkObject; event: culong): vtkTypeBool {.
    importcpp: "HasObserver", header: "vtkObject.h".}
proc HasObserver*(this: var vtkObject; event: cstring): vtkTypeBool {.
    importcpp: "HasObserver", header: "vtkObject.h".}
## !!!Ignored construct:  /@{ *
##  Overloads to AddObserver that allow developers to add class member
##  functions as callbacks for events.  The callback function can
##  be one of these two types:
##  \code
##  void foo(void);\n
##  void foo(vtkObject*, unsigned long, void*);
##  \endcode
##  If the callback is a member of a vtkObjectBase-derived object,
##  then the callback will automatically be disabled if the object
##  destructs (but the observer will not automatically be removed).
##  If the callback is a member of any other type of object, then
##  the observer must be removed before the object destructs or else
##  its dead pointer will be used the next time the event occurs.
##  Typical usage of these functions is as follows:
##  \code
##  SomeClassOfMine* observer = SomeClassOfMine::New();\n
##  to_observe->AddObserver(event, observer, \&SomeClassOfMine::SomeMethod);
##  \endcode
##  Note that this does not affect the reference count of a
##  vtkObjectBase-derived \c observer, which can be safely deleted
##  with the observer still in place. For non-vtkObjectBase observers,
##  the observer should never be deleted before it is removed.
##  Return value is a tag that can be used to remove the observer.
##  template < class U , class T > [end of template] unsigned long AddObserver ( unsigned long event , U observer , void ( T :: * callback ) ( ) , float priority = 0.0f ) { vtkClassMemberCallback < T > * callable = new vtkClassMemberCallback < T > ( observer , callback ) ;  callable is deleted when the observer is cleaned up (look at
##  vtkObjectCommandInternal) return this -> AddTemplatedObserver ( event , callable , priority ) ; } template < class U , class T > unsigned long AddObserver ( unsigned long event , U observer , void ( T :: * callback ) ( vtkObject * , unsigned long , void * ) , float priority = 0.0f ) { vtkClassMemberCallback < T > * callable = new vtkClassMemberCallback < T > ( observer , callback ) ;  callable is deleted when the observer is cleaned up (look at
##  vtkObjectCommandInternal) return this -> AddTemplatedObserver ( event , callable , priority ) ; } /@} /@{ *
##  Allow user to set the AbortFlagOn() with the return value of the callback
##  method.
##  template < class U , class T > unsigned long AddObserver ( unsigned long event , U observer , bool ( T :: * callback ) ( vtkObject * , unsigned long , void * ) , float priority = 0.0f ) { vtkClassMemberCallback < T > * callable = new vtkClassMemberCallback < T > ( observer , callback ) ;  callable is deleted when the observer is cleaned up (look at
##  vtkObjectCommandInternal) return this -> AddTemplatedObserver ( event , callable , priority ) ; } /@} /@{ *
##  This method invokes an event and return whether the event was
##  aborted or not. If the event was aborted, the return value is 1,
##  otherwise it is 0.
##  int InvokeEvent ( unsigned long event , void * callData ) ;
## Error: token expected: ) but got: ::!!!

proc InvokeEvent*(this: var vtkObject; event: cstring; callData: pointer): cint {.
    importcpp: "InvokeEvent", header: "vtkObject.h".}
proc InvokeEvent*(this: var vtkObject; event: culong): cint {.importcpp: "InvokeEvent",
    header: "vtkObject.h".}
proc InvokeEvent*(this: var vtkObject; event: cstring): cint {.
    importcpp: "InvokeEvent", header: "vtkObject.h".}
proc SetObjectName*(this: var vtkObject; objectName: string) {.
    importcpp: "SetObjectName", header: "vtkObject.h".}
proc GetObjectName*(this: vtkObject): string {.noSideEffect,
    importcpp: "GetObjectName", header: "vtkObject.h".}
proc GetObjectDescription*(this: vtkObject): string {.noSideEffect,
    importcpp: "GetObjectDescription", header: "vtkObject.h".}
##  VTK-HeaderTest-Exclude: vtkObject.h

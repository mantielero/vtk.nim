## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGarbageCollector.h
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
##  @class   vtkGarbageCollector
##  @brief   Detect and break reference loops
##
##  vtkGarbageCollector is used by VTK classes that may be involved in
##  reference counting loops (such as Algorithm <-> Executive).  It
##  detects strongly connected components of the reference graph that
##  have been leaked deletes them.  The garbage collector uses the
##  ReportReferences method to search the reference graph and construct
##  a net reference count for each connected component.  If the net
##  reference count is zero the entire set of objects is deleted.
##  Deleting each component may leak other components, which are then
##  collected recursively.
##
##  To enable garbage collection for a class, add these members:
##
##  \code
##
##   public:
##    bool UsesGarbageCollector() const override { return true; }
##
##   protected:
##
##    void ReportReferences(vtkGarbageCollector* collector) override
##    {
##      // Report references held by this object that may be in a loop.
##      this->Superclass::ReportReferences(collector);
##      vtkGarbageCollectorReport(collector, this->OtherObject, "Other Object");
##    }
##  \endcode
##
##  The implementations should be in the .cxx file in practice.
##  It is important that the reference be reported using the real
##  pointer or smart pointer instance that holds the reference.  When
##  collecting the garbage collector will actually set this pointer to
##  nullptr.  The destructor of the class should be written to deal with
##  this.  It is also expected that an invariant is maintained for any
##  reference that is reported.  The variable holding the reference
##  must always either be nullptr or refer to a fully constructed valid
##  object.  Therefore code like "this->Object->UnRegister(this)" must
##  be avoided if "this->Object" is a reported reference because it
##  is possible that the object is deleted before UnRegister returns
##  but then "this->Object" will be left as a dangling pointer.  Instead
##  use code like
##
##  \code
##    vtkObjectBase* obj = this->Object;
##    this->Object = 0;
##    obj->UnRegister(this);
##  \endcode
##
##  so that the reported reference maintains the invariant.
##
##  If subclassing from a class that already supports garbage
##  collection, one need only provide the ReportReferences method.
##

import
  vtkCommonCoreModule, vtkGarbageCollectorManager, vtkObject

##  This function is a friend of the collector so that it can call the
##  internal report method.

proc vtkGarbageCollectorReportInternal*(a1: ptr vtkGarbageCollector;
                                       a2: ptr vtkObjectBase; a3: pointer;
                                       a4: cstring) {.
    importcpp: "vtkGarbageCollectorReportInternal(@)",
    header: "vtkGarbageCollector.h".}
##  This allows vtkObjectBase to get at the methods it needs.

discard "forward decl of vtkObjectBaseToGarbageCollectorFriendship"
type
  vtkGarbageCollector* {.importcpp: "vtkGarbageCollector",
                        header: "vtkGarbageCollector.h", bycopy.} = object of vtkObject ## *
                                                                                 ##  Called by UnRegister method of an object that supports garbage
                                                                                 ##  collection.  The UnRegister may not actually decrement the
                                                                                 ##  reference count, but instead hands the reference to the garbage
                                                                                 ##  collector.  If a reference can be given, this method accepts it
                                                                                 ##  from the caller by returning 1.  If the reference cannot be
                                                                                 ##  accepted then it returns 0.  This may be the case when delayed
                                                                                 ##  garbage collection is disabled, or when the collector has decided
                                                                                 ##  it is time to do a check.
                                                                                 ##
    vtkGarbageCollector* {.importc: "vtkGarbageCollector".}: VTK_NEWINSTANCE

  vtkGarbageCollectorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGarbageCollector::IsTypeOf(@)", header: "vtkGarbageCollector.h".}
proc IsA*(this: var vtkGarbageCollector; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGarbageCollector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGarbageCollector {.
    importcpp: "vtkGarbageCollector::SafeDownCast(@)",
    header: "vtkGarbageCollector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGarbageCollector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGarbageCollector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGarbageCollector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGarbageCollector; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGarbageCollector.h".}
proc New*(): ptr vtkGarbageCollector {.importcpp: "vtkGarbageCollector::New(@)",
                                   header: "vtkGarbageCollector.h".}
proc Collect*() {.importcpp: "vtkGarbageCollector::Collect(@)",
                header: "vtkGarbageCollector.h".}
proc Collect*(root: ptr vtkObjectBase) {.importcpp: "vtkGarbageCollector::Collect(@)",
                                     header: "vtkGarbageCollector.h".}
proc DeferredCollectionPush*() {.importcpp: "vtkGarbageCollector::DeferredCollectionPush(@)",
                               header: "vtkGarbageCollector.h".}
proc DeferredCollectionPop*() {.importcpp: "vtkGarbageCollector::DeferredCollectionPop(@)",
                              header: "vtkGarbageCollector.h".}
proc SetGlobalDebugFlag*(flag: bool) {.importcpp: "vtkGarbageCollector::SetGlobalDebugFlag(@)",
                                    header: "vtkGarbageCollector.h".}
proc GetGlobalDebugFlag*(): bool {.importcpp: "vtkGarbageCollector::GetGlobalDebugFlag(@)",
                                header: "vtkGarbageCollector.h".}
discard "forward decl of vtkSmartPointerBase"
proc vtkGarbageCollectorReport*(collector: ptr vtkGarbageCollector;
                               `ptr`: var vtkSmartPointerBase; desc: cstring) {.
    importcpp: "vtkGarbageCollectorReport(@)", header: "vtkGarbageCollector.h".}
## *
##  Function to report a reference held by a raw pointer to a collector.
##

proc vtkGarbageCollectorReport*[T](collector: ptr vtkGarbageCollector; `ptr`: ptr T;
                                  desc: cstring) =
  discard

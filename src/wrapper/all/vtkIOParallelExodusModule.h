
#ifndef VTKIOPARALLELEXODUS_EXPORT_H
#define VTKIOPARALLELEXODUS_EXPORT_H

#ifdef VTKIOPARALLELEXODUS_STATIC_DEFINE
#  define VTKIOPARALLELEXODUS_EXPORT
#  define VTKIOPARALLELEXODUS_NO_EXPORT
#else
#  ifndef VTKIOPARALLELEXODUS_EXPORT
#    ifdef IOParallelExodus_EXPORTS
        /* We are building this library */
#      define VTKIOPARALLELEXODUS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOPARALLELEXODUS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOPARALLELEXODUS_NO_EXPORT
#    define VTKIOPARALLELEXODUS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOPARALLELEXODUS_DEPRECATED
#  define VTKIOPARALLELEXODUS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOPARALLELEXODUS_DEPRECATED_EXPORT
#  define VTKIOPARALLELEXODUS_DEPRECATED_EXPORT VTKIOPARALLELEXODUS_EXPORT VTKIOPARALLELEXODUS_DEPRECATED
#endif

#ifndef VTKIOPARALLELEXODUS_DEPRECATED_NO_EXPORT
#  define VTKIOPARALLELEXODUS_DEPRECATED_NO_EXPORT VTKIOPARALLELEXODUS_NO_EXPORT VTKIOPARALLELEXODUS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOPARALLELEXODUS_NO_DEPRECATED
#    define VTKIOPARALLELEXODUS_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkIOExodusModule.h"


/* AutoInit implementations. */
#ifdef vtkIOParallelExodus_AUTOINIT_INCLUDE
#include vtkIOParallelExodus_AUTOINIT_INCLUDE
#endif
#ifdef vtkIOParallelExodus_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkIOParallelExodus)
#endif

#endif /* VTKIOPARALLELEXODUS_EXPORT_H */

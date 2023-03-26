
#ifndef VTKIOPARALLELXDMF3_EXPORT_H
#define VTKIOPARALLELXDMF3_EXPORT_H

#ifdef VTKIOPARALLELXDMF3_STATIC_DEFINE
#  define VTKIOPARALLELXDMF3_EXPORT
#  define VTKIOPARALLELXDMF3_NO_EXPORT
#else
#  ifndef VTKIOPARALLELXDMF3_EXPORT
#    ifdef IOParallelXdmf3_EXPORTS
        /* We are building this library */
#      define VTKIOPARALLELXDMF3_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOPARALLELXDMF3_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOPARALLELXDMF3_NO_EXPORT
#    define VTKIOPARALLELXDMF3_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOPARALLELXDMF3_DEPRECATED
#  define VTKIOPARALLELXDMF3_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOPARALLELXDMF3_DEPRECATED_EXPORT
#  define VTKIOPARALLELXDMF3_DEPRECATED_EXPORT VTKIOPARALLELXDMF3_EXPORT VTKIOPARALLELXDMF3_DEPRECATED
#endif

#ifndef VTKIOPARALLELXDMF3_DEPRECATED_NO_EXPORT
#  define VTKIOPARALLELXDMF3_DEPRECATED_NO_EXPORT VTKIOPARALLELXDMF3_NO_EXPORT VTKIOPARALLELXDMF3_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOPARALLELXDMF3_NO_DEPRECATED
#    define VTKIOPARALLELXDMF3_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkIOXdmf3Module.h"


/* AutoInit implementations. */
#ifdef vtkIOParallelXdmf3_AUTOINIT_INCLUDE
#include vtkIOParallelXdmf3_AUTOINIT_INCLUDE
#endif
#ifdef vtkIOParallelXdmf3_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkIOParallelXdmf3)
#endif

#endif /* VTKIOPARALLELXDMF3_EXPORT_H */

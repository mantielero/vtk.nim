
#ifndef VTKIOMPIPARALLEL_EXPORT_H
#define VTKIOMPIPARALLEL_EXPORT_H

#ifdef VTKIOMPIPARALLEL_STATIC_DEFINE
#  define VTKIOMPIPARALLEL_EXPORT
#  define VTKIOMPIPARALLEL_NO_EXPORT
#else
#  ifndef VTKIOMPIPARALLEL_EXPORT
#    ifdef IOMPIParallel_EXPORTS
        /* We are building this library */
#      define VTKIOMPIPARALLEL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOMPIPARALLEL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOMPIPARALLEL_NO_EXPORT
#    define VTKIOMPIPARALLEL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOMPIPARALLEL_DEPRECATED
#  define VTKIOMPIPARALLEL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOMPIPARALLEL_DEPRECATED_EXPORT
#  define VTKIOMPIPARALLEL_DEPRECATED_EXPORT VTKIOMPIPARALLEL_EXPORT VTKIOMPIPARALLEL_DEPRECATED
#endif

#ifndef VTKIOMPIPARALLEL_DEPRECATED_NO_EXPORT
#  define VTKIOMPIPARALLEL_DEPRECATED_NO_EXPORT VTKIOMPIPARALLEL_NO_EXPORT VTKIOMPIPARALLEL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOMPIPARALLEL_NO_DEPRECATED
#    define VTKIOMPIPARALLEL_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkIOGeometryModule.h"
#include "vtkIOParallelModule.h"


/* AutoInit implementations. */
#ifdef vtkIOMPIParallel_AUTOINIT_INCLUDE
#include vtkIOMPIParallel_AUTOINIT_INCLUDE
#endif
#ifdef vtkIOMPIParallel_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkIOMPIParallel)
#endif

#endif /* VTKIOMPIPARALLEL_EXPORT_H */

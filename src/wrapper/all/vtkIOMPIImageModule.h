
#ifndef VTKIOMPIIMAGE_EXPORT_H
#define VTKIOMPIIMAGE_EXPORT_H

#ifdef VTKIOMPIIMAGE_STATIC_DEFINE
#  define VTKIOMPIIMAGE_EXPORT
#  define VTKIOMPIIMAGE_NO_EXPORT
#else
#  ifndef VTKIOMPIIMAGE_EXPORT
#    ifdef IOMPIImage_EXPORTS
        /* We are building this library */
#      define VTKIOMPIIMAGE_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOMPIIMAGE_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOMPIIMAGE_NO_EXPORT
#    define VTKIOMPIIMAGE_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOMPIIMAGE_DEPRECATED
#  define VTKIOMPIIMAGE_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOMPIIMAGE_DEPRECATED_EXPORT
#  define VTKIOMPIIMAGE_DEPRECATED_EXPORT VTKIOMPIIMAGE_EXPORT VTKIOMPIIMAGE_DEPRECATED
#endif

#ifndef VTKIOMPIIMAGE_DEPRECATED_NO_EXPORT
#  define VTKIOMPIIMAGE_DEPRECATED_NO_EXPORT VTKIOMPIIMAGE_NO_EXPORT VTKIOMPIIMAGE_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOMPIIMAGE_NO_DEPRECATED
#    define VTKIOMPIIMAGE_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkIOImageModule.h"


/* AutoInit implementations. */
#ifdef vtkIOMPIImage_AUTOINIT_INCLUDE
#include vtkIOMPIImage_AUTOINIT_INCLUDE
#endif
#ifdef vtkIOMPIImage_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkIOMPIImage)
#endif

#endif /* VTKIOMPIIMAGE_EXPORT_H */

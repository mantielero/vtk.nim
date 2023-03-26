
#ifndef VTKIOPARALLELNETCDF_EXPORT_H
#define VTKIOPARALLELNETCDF_EXPORT_H

#ifdef VTKIOPARALLELNETCDF_STATIC_DEFINE
#  define VTKIOPARALLELNETCDF_EXPORT
#  define VTKIOPARALLELNETCDF_NO_EXPORT
#else
#  ifndef VTKIOPARALLELNETCDF_EXPORT
#    ifdef IOParallelNetCDF_EXPORTS
        /* We are building this library */
#      define VTKIOPARALLELNETCDF_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOPARALLELNETCDF_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOPARALLELNETCDF_NO_EXPORT
#    define VTKIOPARALLELNETCDF_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOPARALLELNETCDF_DEPRECATED
#  define VTKIOPARALLELNETCDF_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOPARALLELNETCDF_DEPRECATED_EXPORT
#  define VTKIOPARALLELNETCDF_DEPRECATED_EXPORT VTKIOPARALLELNETCDF_EXPORT VTKIOPARALLELNETCDF_DEPRECATED
#endif

#ifndef VTKIOPARALLELNETCDF_DEPRECATED_NO_EXPORT
#  define VTKIOPARALLELNETCDF_DEPRECATED_NO_EXPORT VTKIOPARALLELNETCDF_NO_EXPORT VTKIOPARALLELNETCDF_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOPARALLELNETCDF_NO_DEPRECATED
#    define VTKIOPARALLELNETCDF_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkIONetCDFModule.h"


/* AutoInit implementations. */
#ifdef vtkIOParallelNetCDF_AUTOINIT_INCLUDE
#include vtkIOParallelNetCDF_AUTOINIT_INCLUDE
#endif
#ifdef vtkIOParallelNetCDF_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkIOParallelNetCDF)
#endif

#endif /* VTKIOPARALLELNETCDF_EXPORT_H */

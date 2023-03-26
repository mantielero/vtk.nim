
#ifndef VTKFILTERSPARALLELGEOMETRY_EXPORT_H
#define VTKFILTERSPARALLELGEOMETRY_EXPORT_H

#ifdef VTKFILTERSPARALLELGEOMETRY_STATIC_DEFINE
#  define VTKFILTERSPARALLELGEOMETRY_EXPORT
#  define VTKFILTERSPARALLELGEOMETRY_NO_EXPORT
#else
#  ifndef VTKFILTERSPARALLELGEOMETRY_EXPORT
#    ifdef FiltersParallelGeometry_EXPORTS
        /* We are building this library */
#      define VTKFILTERSPARALLELGEOMETRY_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKFILTERSPARALLELGEOMETRY_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKFILTERSPARALLELGEOMETRY_NO_EXPORT
#    define VTKFILTERSPARALLELGEOMETRY_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKFILTERSPARALLELGEOMETRY_DEPRECATED
#  define VTKFILTERSPARALLELGEOMETRY_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKFILTERSPARALLELGEOMETRY_DEPRECATED_EXPORT
#  define VTKFILTERSPARALLELGEOMETRY_DEPRECATED_EXPORT VTKFILTERSPARALLELGEOMETRY_EXPORT VTKFILTERSPARALLELGEOMETRY_DEPRECATED
#endif

#ifndef VTKFILTERSPARALLELGEOMETRY_DEPRECATED_NO_EXPORT
#  define VTKFILTERSPARALLELGEOMETRY_DEPRECATED_NO_EXPORT VTKFILTERSPARALLELGEOMETRY_NO_EXPORT VTKFILTERSPARALLELGEOMETRY_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKFILTERSPARALLELGEOMETRY_NO_DEPRECATED
#    define VTKFILTERSPARALLELGEOMETRY_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkFiltersCoreModule.h"
#include "vtkFiltersParallelModule.h"


/* AutoInit implementations. */
#ifdef vtkFiltersParallelGeometry_AUTOINIT_INCLUDE
#include vtkFiltersParallelGeometry_AUTOINIT_INCLUDE
#endif
#ifdef vtkFiltersParallelGeometry_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkFiltersParallelGeometry)
#endif

#endif /* VTKFILTERSPARALLELGEOMETRY_EXPORT_H */
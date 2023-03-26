
#ifndef VTKIOPOSTGRESQL_EXPORT_H
#define VTKIOPOSTGRESQL_EXPORT_H

#ifdef VTKIOPOSTGRESQL_STATIC_DEFINE
#  define VTKIOPOSTGRESQL_EXPORT
#  define VTKIOPOSTGRESQL_NO_EXPORT
#else
#  ifndef VTKIOPOSTGRESQL_EXPORT
#    ifdef IOPostgreSQL_EXPORTS
        /* We are building this library */
#      define VTKIOPOSTGRESQL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOPOSTGRESQL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOPOSTGRESQL_NO_EXPORT
#    define VTKIOPOSTGRESQL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOPOSTGRESQL_DEPRECATED
#  define VTKIOPOSTGRESQL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOPOSTGRESQL_DEPRECATED_EXPORT
#  define VTKIOPOSTGRESQL_DEPRECATED_EXPORT VTKIOPOSTGRESQL_EXPORT VTKIOPOSTGRESQL_DEPRECATED
#endif

#ifndef VTKIOPOSTGRESQL_DEPRECATED_NO_EXPORT
#  define VTKIOPOSTGRESQL_DEPRECATED_NO_EXPORT VTKIOPOSTGRESQL_NO_EXPORT VTKIOPOSTGRESQL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOPOSTGRESQL_NO_DEPRECATED
#    define VTKIOPOSTGRESQL_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkIOSQLModule.h"


/* AutoInit implementations. */
#ifdef vtkIOPostgreSQL_AUTOINIT_INCLUDE
#include vtkIOPostgreSQL_AUTOINIT_INCLUDE
#endif
#ifdef vtkIOPostgreSQL_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkIOPostgreSQL)
#endif

#endif /* VTKIOPOSTGRESQL_EXPORT_H */

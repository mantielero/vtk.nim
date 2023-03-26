
#ifndef VTKIOMYSQL_EXPORT_H
#define VTKIOMYSQL_EXPORT_H

#ifdef VTKIOMYSQL_STATIC_DEFINE
#  define VTKIOMYSQL_EXPORT
#  define VTKIOMYSQL_NO_EXPORT
#else
#  ifndef VTKIOMYSQL_EXPORT
#    ifdef IOMySQL_EXPORTS
        /* We are building this library */
#      define VTKIOMYSQL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOMYSQL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOMYSQL_NO_EXPORT
#    define VTKIOMYSQL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOMYSQL_DEPRECATED
#  define VTKIOMYSQL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOMYSQL_DEPRECATED_EXPORT
#  define VTKIOMYSQL_DEPRECATED_EXPORT VTKIOMYSQL_EXPORT VTKIOMYSQL_DEPRECATED
#endif

#ifndef VTKIOMYSQL_DEPRECATED_NO_EXPORT
#  define VTKIOMYSQL_DEPRECATED_NO_EXPORT VTKIOMYSQL_NO_EXPORT VTKIOMYSQL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOMYSQL_NO_DEPRECATED
#    define VTKIOMYSQL_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkIOSQLModule.h"


/* AutoInit implementations. */
#ifdef vtkIOMySQL_AUTOINIT_INCLUDE
#include vtkIOMySQL_AUTOINIT_INCLUDE
#endif
#ifdef vtkIOMySQL_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkIOMySQL)
#endif

#endif /* VTKIOMYSQL_EXPORT_H */

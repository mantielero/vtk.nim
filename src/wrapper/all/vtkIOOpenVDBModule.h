
#ifndef VTKIOOPENVDB_EXPORT_H
#define VTKIOOPENVDB_EXPORT_H

#ifdef VTKIOOPENVDB_STATIC_DEFINE
#  define VTKIOOPENVDB_EXPORT
#  define VTKIOOPENVDB_NO_EXPORT
#else
#  ifndef VTKIOOPENVDB_EXPORT
#    ifdef IOOpenVDB_EXPORTS
        /* We are building this library */
#      define VTKIOOPENVDB_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOOPENVDB_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOOPENVDB_NO_EXPORT
#    define VTKIOOPENVDB_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOOPENVDB_DEPRECATED
#  define VTKIOOPENVDB_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOOPENVDB_DEPRECATED_EXPORT
#  define VTKIOOPENVDB_DEPRECATED_EXPORT VTKIOOPENVDB_EXPORT VTKIOOPENVDB_DEPRECATED
#endif

#ifndef VTKIOOPENVDB_DEPRECATED_NO_EXPORT
#  define VTKIOOPENVDB_DEPRECATED_NO_EXPORT VTKIOOPENVDB_NO_EXPORT VTKIOOPENVDB_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOOPENVDB_NO_DEPRECATED
#    define VTKIOOPENVDB_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOOPENVDB_EXPORT_H */

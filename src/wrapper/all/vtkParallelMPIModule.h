
#ifndef VTKPARALLELMPI_EXPORT_H
#define VTKPARALLELMPI_EXPORT_H

#ifdef VTKPARALLELMPI_STATIC_DEFINE
#  define VTKPARALLELMPI_EXPORT
#  define VTKPARALLELMPI_NO_EXPORT
#else
#  ifndef VTKPARALLELMPI_EXPORT
#    ifdef ParallelMPI_EXPORTS
        /* We are building this library */
#      define VTKPARALLELMPI_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKPARALLELMPI_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKPARALLELMPI_NO_EXPORT
#    define VTKPARALLELMPI_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKPARALLELMPI_DEPRECATED
#  define VTKPARALLELMPI_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKPARALLELMPI_DEPRECATED_EXPORT
#  define VTKPARALLELMPI_DEPRECATED_EXPORT VTKPARALLELMPI_EXPORT VTKPARALLELMPI_DEPRECATED
#endif

#ifndef VTKPARALLELMPI_DEPRECATED_NO_EXPORT
#  define VTKPARALLELMPI_DEPRECATED_NO_EXPORT VTKPARALLELMPI_NO_EXPORT VTKPARALLELMPI_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKPARALLELMPI_NO_DEPRECATED
#    define VTKPARALLELMPI_NO_DEPRECATED
#  endif
#endif

#endif /* VTKPARALLELMPI_EXPORT_H */

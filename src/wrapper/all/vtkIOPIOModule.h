
#ifndef VTKIOPIO_EXPORT_H
#define VTKIOPIO_EXPORT_H

#ifdef VTKIOPIO_STATIC_DEFINE
#  define VTKIOPIO_EXPORT
#  define VTKIOPIO_NO_EXPORT
#else
#  ifndef VTKIOPIO_EXPORT
#    ifdef IOPIO_EXPORTS
        /* We are building this library */
#      define VTKIOPIO_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOPIO_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOPIO_NO_EXPORT
#    define VTKIOPIO_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOPIO_DEPRECATED
#  define VTKIOPIO_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOPIO_DEPRECATED_EXPORT
#  define VTKIOPIO_DEPRECATED_EXPORT VTKIOPIO_EXPORT VTKIOPIO_DEPRECATED
#endif

#ifndef VTKIOPIO_DEPRECATED_NO_EXPORT
#  define VTKIOPIO_DEPRECATED_NO_EXPORT VTKIOPIO_NO_EXPORT VTKIOPIO_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOPIO_NO_DEPRECATED
#    define VTKIOPIO_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOPIO_EXPORT_H */

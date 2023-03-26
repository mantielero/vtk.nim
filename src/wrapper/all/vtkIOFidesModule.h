
#ifndef VTKIOFIDES_EXPORT_H
#define VTKIOFIDES_EXPORT_H

#ifdef VTKIOFIDES_STATIC_DEFINE
#  define VTKIOFIDES_EXPORT
#  define VTKIOFIDES_NO_EXPORT
#else
#  ifndef VTKIOFIDES_EXPORT
#    ifdef IOFides_EXPORTS
        /* We are building this library */
#      define VTKIOFIDES_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOFIDES_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOFIDES_NO_EXPORT
#    define VTKIOFIDES_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOFIDES_DEPRECATED
#  define VTKIOFIDES_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOFIDES_DEPRECATED_EXPORT
#  define VTKIOFIDES_DEPRECATED_EXPORT VTKIOFIDES_EXPORT VTKIOFIDES_DEPRECATED
#endif

#ifndef VTKIOFIDES_DEPRECATED_NO_EXPORT
#  define VTKIOFIDES_DEPRECATED_NO_EXPORT VTKIOFIDES_NO_EXPORT VTKIOFIDES_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOFIDES_NO_DEPRECATED
#    define VTKIOFIDES_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOFIDES_EXPORT_H */

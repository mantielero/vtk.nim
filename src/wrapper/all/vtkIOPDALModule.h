
#ifndef VTKIOPDAL_EXPORT_H
#define VTKIOPDAL_EXPORT_H

#ifdef VTKIOPDAL_STATIC_DEFINE
#  define VTKIOPDAL_EXPORT
#  define VTKIOPDAL_NO_EXPORT
#else
#  ifndef VTKIOPDAL_EXPORT
#    ifdef IOPDAL_EXPORTS
        /* We are building this library */
#      define VTKIOPDAL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOPDAL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOPDAL_NO_EXPORT
#    define VTKIOPDAL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOPDAL_DEPRECATED
#  define VTKIOPDAL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOPDAL_DEPRECATED_EXPORT
#  define VTKIOPDAL_DEPRECATED_EXPORT VTKIOPDAL_EXPORT VTKIOPDAL_DEPRECATED
#endif

#ifndef VTKIOPDAL_DEPRECATED_NO_EXPORT
#  define VTKIOPDAL_DEPRECATED_NO_EXPORT VTKIOPDAL_NO_EXPORT VTKIOPDAL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOPDAL_NO_DEPRECATED
#    define VTKIOPDAL_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOPDAL_EXPORT_H */

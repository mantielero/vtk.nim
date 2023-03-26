
#ifndef VTKJAVA_EXPORT_H
#define VTKJAVA_EXPORT_H

#ifdef VTKJAVA_STATIC_DEFINE
#  define VTKJAVA_EXPORT
#  define VTKJAVA_NO_EXPORT
#else
#  ifndef VTKJAVA_EXPORT
#    ifdef Java_EXPORTS
        /* We are building this library */
#      define VTKJAVA_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKJAVA_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKJAVA_NO_EXPORT
#    define VTKJAVA_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKJAVA_DEPRECATED
#  define VTKJAVA_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKJAVA_DEPRECATED_EXPORT
#  define VTKJAVA_DEPRECATED_EXPORT VTKJAVA_EXPORT VTKJAVA_DEPRECATED
#endif

#ifndef VTKJAVA_DEPRECATED_NO_EXPORT
#  define VTKJAVA_DEPRECATED_NO_EXPORT VTKJAVA_NO_EXPORT VTKJAVA_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKJAVA_NO_DEPRECATED
#    define VTKJAVA_NO_DEPRECATED
#  endif
#endif

#endif /* VTKJAVA_EXPORT_H */

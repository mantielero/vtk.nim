
#ifndef VTKIOFFMPEG_EXPORT_H
#define VTKIOFFMPEG_EXPORT_H

#ifdef VTKIOFFMPEG_STATIC_DEFINE
#  define VTKIOFFMPEG_EXPORT
#  define VTKIOFFMPEG_NO_EXPORT
#else
#  ifndef VTKIOFFMPEG_EXPORT
#    ifdef IOFFMPEG_EXPORTS
        /* We are building this library */
#      define VTKIOFFMPEG_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOFFMPEG_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOFFMPEG_NO_EXPORT
#    define VTKIOFFMPEG_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOFFMPEG_DEPRECATED
#  define VTKIOFFMPEG_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOFFMPEG_DEPRECATED_EXPORT
#  define VTKIOFFMPEG_DEPRECATED_EXPORT VTKIOFFMPEG_EXPORT VTKIOFFMPEG_DEPRECATED
#endif

#ifndef VTKIOFFMPEG_DEPRECATED_NO_EXPORT
#  define VTKIOFFMPEG_DEPRECATED_NO_EXPORT VTKIOFFMPEG_NO_EXPORT VTKIOFFMPEG_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOFFMPEG_NO_DEPRECATED
#    define VTKIOFFMPEG_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOFFMPEG_EXPORT_H */

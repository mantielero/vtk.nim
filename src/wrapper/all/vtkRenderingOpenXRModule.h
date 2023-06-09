
#ifndef VTKRENDERINGOPENXR_EXPORT_H
#define VTKRENDERINGOPENXR_EXPORT_H

#ifdef VTKRENDERINGOPENXR_STATIC_DEFINE
#  define VTKRENDERINGOPENXR_EXPORT
#  define VTKRENDERINGOPENXR_NO_EXPORT
#else
#  ifndef VTKRENDERINGOPENXR_EXPORT
#    ifdef RenderingOpenXR_EXPORTS
        /* We are building this library */
#      define VTKRENDERINGOPENXR_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKRENDERINGOPENXR_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKRENDERINGOPENXR_NO_EXPORT
#    define VTKRENDERINGOPENXR_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKRENDERINGOPENXR_DEPRECATED
#  define VTKRENDERINGOPENXR_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKRENDERINGOPENXR_DEPRECATED_EXPORT
#  define VTKRENDERINGOPENXR_DEPRECATED_EXPORT VTKRENDERINGOPENXR_EXPORT VTKRENDERINGOPENXR_DEPRECATED
#endif

#ifndef VTKRENDERINGOPENXR_DEPRECATED_NO_EXPORT
#  define VTKRENDERINGOPENXR_DEPRECATED_NO_EXPORT VTKRENDERINGOPENXR_NO_EXPORT VTKRENDERINGOPENXR_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKRENDERINGOPENXR_NO_DEPRECATED
#    define VTKRENDERINGOPENXR_NO_DEPRECATED
#  endif
#endif

#endif /* VTKRENDERINGOPENXR_EXPORT_H */

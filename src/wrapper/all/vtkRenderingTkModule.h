
#ifndef VTKRENDERINGTK_EXPORT_H
#define VTKRENDERINGTK_EXPORT_H

#ifdef VTKRENDERINGTK_STATIC_DEFINE
#  define VTKRENDERINGTK_EXPORT
#  define VTKRENDERINGTK_NO_EXPORT
#else
#  ifndef VTKRENDERINGTK_EXPORT
#    ifdef RenderingTk_EXPORTS
        /* We are building this library */
#      define VTKRENDERINGTK_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKRENDERINGTK_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKRENDERINGTK_NO_EXPORT
#    define VTKRENDERINGTK_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKRENDERINGTK_DEPRECATED
#  define VTKRENDERINGTK_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKRENDERINGTK_DEPRECATED_EXPORT
#  define VTKRENDERINGTK_DEPRECATED_EXPORT VTKRENDERINGTK_EXPORT VTKRENDERINGTK_DEPRECATED
#endif

#ifndef VTKRENDERINGTK_DEPRECATED_NO_EXPORT
#  define VTKRENDERINGTK_DEPRECATED_NO_EXPORT VTKRENDERINGTK_NO_EXPORT VTKRENDERINGTK_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKRENDERINGTK_NO_DEPRECATED
#    define VTKRENDERINGTK_NO_DEPRECATED
#  endif
#endif

#endif /* VTKRENDERINGTK_EXPORT_H */

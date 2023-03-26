when defined(VTKRENDERINGTK_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGTK_DEPRECATED):
  discard
when not defined(VTKRENDERINGTK_DEPRECATED_EXPORT):
  const
    VTKRENDERINGTK_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGTK_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGTK_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
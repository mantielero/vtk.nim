when defined(VTKRENDERINGOPENVR_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGOPENVR_DEPRECATED):
  discard
when not defined(VTKRENDERINGOPENVR_DEPRECATED_EXPORT):
  const
    VTKRENDERINGOPENVR_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGOPENVR_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGOPENVR_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
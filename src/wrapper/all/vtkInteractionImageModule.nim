when defined(VTKINTERACTIONIMAGE_STATIC_DEFINE):
else:
when not defined(VTKINTERACTIONIMAGE_DEPRECATED):
  discard
when not defined(VTKINTERACTIONIMAGE_DEPRECATED_EXPORT):
  const
    VTKINTERACTIONIMAGE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKINTERACTIONIMAGE_DEPRECATED_NO_EXPORT):
  const
    VTKINTERACTIONIMAGE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
when defined(VTKCOMMONSYSTEM_STATIC_DEFINE):
else:
when not defined(VTKCOMMONSYSTEM_DEPRECATED):
  discard
when not defined(VTKCOMMONSYSTEM_DEPRECATED_EXPORT):
  const
    VTKCOMMONSYSTEM_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONSYSTEM_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONSYSTEM_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
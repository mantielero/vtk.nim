when defined(VTKRENDERINGEXTERNAL_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGEXTERNAL_DEPRECATED):
  discard
when not defined(VTKRENDERINGEXTERNAL_DEPRECATED_EXPORT):
  const
    VTKRENDERINGEXTERNAL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGEXTERNAL_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGEXTERNAL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
when defined(VTKRENDERINGANNOTATION_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGANNOTATION_DEPRECATED):
  discard
when not defined(VTKRENDERINGANNOTATION_DEPRECATED_EXPORT):
  const
    VTKRENDERINGANNOTATION_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGANNOTATION_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGANNOTATION_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
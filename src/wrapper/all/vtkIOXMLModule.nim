when defined(VTKIOXML_STATIC_DEFINE):
else:
when not defined(VTKIOXML_DEPRECATED):
  discard
when not defined(VTKIOXML_DEPRECATED_EXPORT):
  const
    VTKIOXML_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOXML_DEPRECATED_NO_EXPORT):
  const
    VTKIOXML_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
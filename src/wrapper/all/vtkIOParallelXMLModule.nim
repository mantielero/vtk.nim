when defined(VTKIOPARALLELXML_STATIC_DEFINE):
else:
when not defined(VTKIOPARALLELXML_DEPRECATED):
  discard
when not defined(VTKIOPARALLELXML_DEPRECATED_EXPORT):
  const
    VTKIOPARALLELXML_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOPARALLELXML_DEPRECATED_NO_EXPORT):
  const
    VTKIOPARALLELXML_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
when defined(VTKCOMMONTRANSFORMS_STATIC_DEFINE):
else:
when not defined(VTKCOMMONTRANSFORMS_DEPRECATED):
  discard
when not defined(VTKCOMMONTRANSFORMS_DEPRECATED_EXPORT):
  const
    VTKCOMMONTRANSFORMS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONTRANSFORMS_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONTRANSFORMS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
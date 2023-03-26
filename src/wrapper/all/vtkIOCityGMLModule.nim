when defined(VTKIOCITYGML_STATIC_DEFINE):
else:
when not defined(VTKIOCITYGML_DEPRECATED):
  discard
when not defined(VTKIOCITYGML_DEPRECATED_EXPORT):
  const
    VTKIOCITYGML_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOCITYGML_DEPRECATED_NO_EXPORT):
  const
    VTKIOCITYGML_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
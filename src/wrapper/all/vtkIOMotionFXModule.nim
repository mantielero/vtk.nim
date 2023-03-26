when defined(VTKIOMOTIONFX_STATIC_DEFINE):
else:
when not defined(VTKIOMOTIONFX_DEPRECATED):
  discard
when not defined(VTKIOMOTIONFX_DEPRECATED_EXPORT):
  const
    VTKIOMOTIONFX_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOMOTIONFX_DEPRECATED_NO_EXPORT):
  const
    VTKIOMOTIONFX_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
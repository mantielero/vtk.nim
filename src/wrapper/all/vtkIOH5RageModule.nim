when defined(VTKIOH5RAGE_STATIC_DEFINE):
else:
when not defined(VTKIOH5RAGE_DEPRECATED):
  discard
when not defined(VTKIOH5RAGE_DEPRECATED_EXPORT):
  const
    VTKIOH5RAGE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOH5RAGE_DEPRECATED_NO_EXPORT):
  const
    VTKIOH5RAGE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
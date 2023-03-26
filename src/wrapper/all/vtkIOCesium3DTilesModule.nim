when defined(VTKIOCESIUM3DTILES_STATIC_DEFINE):
else:
when not defined(VTKIOCESIUM3DTILES_DEPRECATED):
  discard
when not defined(VTKIOCESIUM3DTILES_DEPRECATED_EXPORT):
  const
    VTKIOCESIUM3DTILES_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOCESIUM3DTILES_DEPRECATED_NO_EXPORT):
  const
    VTKIOCESIUM3DTILES_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
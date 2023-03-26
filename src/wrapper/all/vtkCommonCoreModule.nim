when defined(VTKCOMMONCORE_STATIC_DEFINE):
else:
when not defined(VTKCOMMONCORE_DEPRECATED):
  discard
when not defined(VTKCOMMONCORE_DEPRECATED_EXPORT):
  const
    VTKCOMMONCORE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONCORE_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONCORE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
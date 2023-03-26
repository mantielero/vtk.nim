when defined(VTKCOMMONCOLOR_STATIC_DEFINE):
else:
when not defined(VTKCOMMONCOLOR_DEPRECATED):
  discard
when not defined(VTKCOMMONCOLOR_DEPRECATED_EXPORT):
  const
    VTKCOMMONCOLOR_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONCOLOR_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONCOLOR_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
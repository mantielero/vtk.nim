when defined(VTKCOMMONMISC_STATIC_DEFINE):
else:
when not defined(VTKCOMMONMISC_DEPRECATED):
  discard
when not defined(VTKCOMMONMISC_DEPRECATED_EXPORT):
  const
    VTKCOMMONMISC_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONMISC_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONMISC_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
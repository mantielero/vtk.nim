when defined(VTKCOMMONARCHIVE_STATIC_DEFINE):
else:
when not defined(VTKCOMMONARCHIVE_DEPRECATED):
  discard
when not defined(VTKCOMMONARCHIVE_DEPRECATED_EXPORT):
  const
    VTKCOMMONARCHIVE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONARCHIVE_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONARCHIVE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
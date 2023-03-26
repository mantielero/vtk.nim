when defined(VTKIOCGNSREADER_STATIC_DEFINE):
else:
when not defined(VTKIOCGNSREADER_DEPRECATED):
  discard
when not defined(VTKIOCGNSREADER_DEPRECATED_EXPORT):
  const
    VTKIOCGNSREADER_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOCGNSREADER_DEPRECATED_NO_EXPORT):
  const
    VTKIOCGNSREADER_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
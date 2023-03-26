when defined(VTKIOXMLPARSER_STATIC_DEFINE):
else:
when not defined(VTKIOXMLPARSER_DEPRECATED):
  discard
when not defined(VTKIOXMLPARSER_DEPRECATED_EXPORT):
  const
    VTKIOXMLPARSER_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOXMLPARSER_DEPRECATED_NO_EXPORT):
  const
    VTKIOXMLPARSER_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
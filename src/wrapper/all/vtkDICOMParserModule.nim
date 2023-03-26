when defined(VTKDICOMPARSER_STATIC_DEFINE):
else:
when not defined(VTKDICOMPARSER_DEPRECATED):
  discard
when not defined(VTKDICOMPARSER_DEPRECATED_EXPORT):
  const
    VTKDICOMPARSER_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKDICOMPARSER_DEPRECATED_NO_EXPORT):
  const
    VTKDICOMPARSER_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
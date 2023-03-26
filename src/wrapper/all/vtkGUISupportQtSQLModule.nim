when defined(VTKGUISUPPORTQTSQL_STATIC_DEFINE):
else:
when not defined(VTKGUISUPPORTQTSQL_DEPRECATED):
  discard
when not defined(VTKGUISUPPORTQTSQL_DEPRECATED_EXPORT):
  const
    VTKGUISUPPORTQTSQL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKGUISUPPORTQTSQL_DEPRECATED_NO_EXPORT):
  const
    VTKGUISUPPORTQTSQL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
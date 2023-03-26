when defined(VTKRENDERINGVTKJS_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGVTKJS_DEPRECATED):
  discard
when not defined(VTKRENDERINGVTKJS_DEPRECATED_EXPORT):
  const
    VTKRENDERINGVTKJS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGVTKJS_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGVTKJS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
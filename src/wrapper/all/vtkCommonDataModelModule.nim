when defined(VTKCOMMONDATAMODEL_STATIC_DEFINE):
else:
when not defined(VTKCOMMONDATAMODEL_DEPRECATED):
  discard
when not defined(VTKCOMMONDATAMODEL_DEPRECATED_EXPORT):
  const
    VTKCOMMONDATAMODEL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONDATAMODEL_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONDATAMODEL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
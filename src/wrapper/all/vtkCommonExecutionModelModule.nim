# when defined(VTKCOMMONEXECUTIONMODEL_STATIC_DEFINE):
#   discard
# else:
#   discard

# when not defined(VTKCOMMONEXECUTIONMODEL_DEPRECATED):
#   discard
# when not defined(VTKCOMMONEXECUTIONMODEL_DEPRECATED_EXPORT):
#   const
#     VTKCOMMONEXECUTIONMODEL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
# when not defined(VTKCOMMONEXECUTIONMODEL_DEPRECATED_NO_EXPORT):
#   const
#     VTKCOMMONEXECUTIONMODEL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
# when 0:
#   discard
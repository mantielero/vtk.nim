when defined(VTKTESTINGIOSQL_STATIC_DEFINE):
else:
when not defined(VTKTESTINGIOSQL_DEPRECATED):
  discard
when not defined(VTKTESTINGIOSQL_DEPRECATED_EXPORT):
  const
    VTKTESTINGIOSQL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKTESTINGIOSQL_DEPRECATED_NO_EXPORT):
  const
    VTKTESTINGIOSQL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
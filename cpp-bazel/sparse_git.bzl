def sparse_cone(name, **kwargs):
  native.new_local_repository(
      name = name,
      path = ".",
      build_file = "./%s/BUILD" % name
  )
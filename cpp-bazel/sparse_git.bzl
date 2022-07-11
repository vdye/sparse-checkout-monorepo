def _impl(repository_ctx):
  workspace_root = repository_ctx.path(Label("@//:WORKSPACE")).dirname
  for i in range(10):
    res = repository_ctx.execute(
      ["git", "sparse-checkout", "add", repository_ctx.attr.path],
      quiet = True,
      working_directory = str(workspace_root)
    )
    if res.return_code == 0:
      break

  if res.return_code != 0:
    print("Failed to add to sparse-checkout: %s" % res.stderr)

  repository_ctx.symlink(str(workspace_root) + "/" + repository_ctx.attr.path, repository_ctx.attr.path)

sparse_git_repo = repository_rule(
    implementation=_impl,
    local=True,
    attrs={"path": attr.string(mandatory=True)})

def sparse_cone(name, **kwargs):
  native.new_local_repository(
      name = name,
      path = ".",
      build_file = "./%s/BUILD" % name
  )
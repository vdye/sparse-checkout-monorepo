def _impl(adapter_ctx, file_path):
  res = adapter_ctx.execute(
    ["git", "-C", adapter_ctx.workspace_root, "ls-files", "--error-unmatch", "-s", file_path]
  )
  if res.return_code != 0:
    return None

  blob_hash = res.stdout.split(" ")[1]

  res = adapter_ctx.execute(
    ["git", "-C", adapter_ctx.workspace_root, "cat-file", "blob", blob_hash]
  )
  if res.return_code == 0:
    return res.stdout
  else:
    return None

sparse_checkout_adapter = dependency_adapter(
  implementation=_impl
)

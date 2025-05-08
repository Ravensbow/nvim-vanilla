return {
  cmd = { 'csharp-ls' },
  root_makers = { '.sln', '.csproj' },
  filetypes = { 'cs' },
  init_options = {
    AutomaticWorkspaceInit = true,
  },
}

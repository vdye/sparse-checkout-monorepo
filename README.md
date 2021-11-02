## Notes

## TODOs
- (MSBuild) find a way to prevent `dotnet build` of a `.sln` from needing all projects available
  - in Visual Studio, you can open a solution without all projects - why can't we do the same with `dotnet build`?
- Implement other build system extensions
  - Bazel
  - CMake
  - ...?
- Write a wrapper for handling file-based, named pattern sets
  - e.g., "dotnet-dev" would include "csharp-msbuild/" & "csharp-msbuild/SparseApp", build from there

### Nice-to-have sparse checkout features
- `sparse checkout add|set` "truncated cone" (include directory but not its subdirectories)
  - allows creating a "minimal" sparse checkout definition with the build system "filling in" the rest
- `sparse checkout add|set` with paths relative to current working directory
  - currently only accepts paths relative to repo root
  - build systems, especially in monorepos, typically work in their on subset of the repository where relative paths are more "natural" (i.e., require less `git` finagling)
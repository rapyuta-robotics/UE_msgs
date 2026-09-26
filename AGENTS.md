# AGENTS.md

Guidance for coding agents and contributors working in this repository.

## Component graph (component.yaml)

This repository's `component.yaml` declares the `ue_msgs` package to the
rest of the OKS system. It is a message package (`kind: msgs`) with no nodes,
so it declares no topics, services, actions or config keys. The `oks_graph`
tool in [rr_oks_deps](https://github.com/rapyuta-robotics/rr_oks_deps) reads
the manifest and extracts the definitions in `msg/` and `srv/` itself. rr_oks
CI uses the result to decide which components and end-to-end suites a change
affects, and which release lines a fix must reach.

Update `component.yaml` in the same commit when you rename the package
(`package:` must equal the `<name>` in `package.xml`) or when its
`description` no longer says what the package holds. Adding, changing or
removing a `.msg` or `.srv` file needs no manifest change.

Skipping this does not break the build. It makes impact analysis blind to
your change.

### Check locally

```bash
uv run --directory ../rr_oks_deps python -m oks_graph check --rr-oks ../UE_msgs
```

`--directory ../rr_oks_deps` runs the tool from inside its own checkout, so
the `--rr-oks` path is resolved relative to `rr_oks_deps`, not to this
repository (hence `../UE_msgs`, not `.`). Adjust the `..`s if your
`rr_oks_deps` checkout lives somewhere else relative to this one.

### How changes reach rr_oks

rr_oks consumes this repository as a git submodule at `external/UE_msgs`.
A manifest change here reaches rr_oks's component-graph CI only after rr_oks
bumps that submodule pointer.

rr_oks's common and guardian Docker images build this submodule.

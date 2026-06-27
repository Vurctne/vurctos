# Scripts

Small helper scripts that support the workflow. Do not add dependencies or a runtime here.

Current scripts:

- `smoke-dispatch.sh`: one-shot end-to-end check of `vurctos dispatch` against a real logged-in `claude` CLI (the unit tests mock the subprocess). Positive mode asserts a trivial card lands in `review` with the exact expected output; `--negative` asserts a card whose expected output escapes the project lands in `blocked`. This is the only check that spends subscription quota; run it once after install and again only after changing the dispatch path. See `cli/README.md`.

Future scripts may include:

- generate task files
- package outputs
- validate project folder structure

Scripts should stay small and local-first. They should support the workflow, not replace the project files as the source of truth.

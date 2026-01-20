# Repository Guidelines

## Project Structure & Module Organization
- `package.json` defines the VS Code extension manifest and contribution points.
- `language-configuration.json` contains bracket and basic editor rules for the language.
- `syntaxes/eBPF assembly.tmLanguage.json` holds the TextMate grammar for syntax highlighting.
- `README.md` describes how to generate `.S` files and use the extension.

## Build, Test, and Development Commands
- No build step is required; this extension is shipped as static JSON metadata.
- Local smoke check: install the extension from the repo (VS Code: "Developer: Install Extension from Location...") and reload the window.
- Validate behavior by opening a sample `.S` file and selecting `eBPF assembly` as the language.

## Coding Style & Naming Conventions
- Keep JSON formatting consistent with the file you edit; avoid reformatting unrelated sections.
- Preserve existing naming patterns for TextMate scopes (for example, `keyword.ebpf`, `constant.numeric.ebpf`).
- Use clear, descriptive regex names and keep grammar patterns grouped logically in `repository.keywords`.

## Testing Guidelines
- There is no automated test suite in this repository.
- Manual verification is expected: update the grammar, then confirm highlighting in VS Code against a real `.S` file.

## Commit & Pull Request Guidelines
- Commit messages in history are short, imperative, and lower-case (for example, “simplify the tokenization”).
- Pull requests should include: a brief description, the motivation for the change, and a screenshot or snippet showing the highlighting result if grammar changes are involved.

## Agent-Specific Instructions
- Prefer small, focused edits to the grammar and configuration files.
- When changing highlighting behavior, document the new or adjusted pattern in the PR description with a sample line.

# Dev Flake

My personal multi-language development environment using **Nix Flakes**.

This repo is a reusable development shell for building projects across different languages without installing everything globally on my machine.

The goal is to have a consistent, reproducible environment that I can use across my projects and easily recreate on any supported system.

## Included Tools

### Languages

- Rust
  - rustc
  - cargo
  - rustfmt
  - clippy
  - rust-analyzer

- C / C++
  - GCC
  - GDB
  - CMake

- Python
  - Python 3.13
  - uv
  - ruff
  - pyright

- JavaScript
  - Node.js 24

### Development Tools

- PostgreSQL
- Git
- Neovim
- ripgrep
- fd
- jq
- yq
- tree
- curl
- wget
- just

---

## Usage

Clone the repo:

```bash
git clone git@github.com:TaiFong/dev-flake.git

cd dev-flake
````

Enter the development environment:

```bash
nix develop
```

Now the development tools are available:

```bash
rustc --version
python --version
node --version
psql --version
```

Exit the environment:

```bash
exit
```

---

## Why I Use Nix

I use Nix because I want my development environments to be:

* Reproducible
* Version controlled
* Easy to rebuild
* Consistent across machines

Instead of configuring every machine manually, each project can define the tools it needs through a `flake.nix`.

---

## Project Template

I use this repo as a starting point for new projects.

Example:

```bash
cp -R dev-flake my-project

cd my-project

nix develop
```

Then I customize the flake based on the project's requirements.

---

## Supported Systems

Currently configured for:

* Apple Silicon macOS
* Intel macOS
* x86 Linux
* ARM Linux

---

## Future Improvements

* direnv automatic environment loading
* More language-specific shells
* Security research environments
* Docker and Kubernetes tooling
* CI/CD integration

# 🌐 Oliver's Portfolio Website

<div align="center">

  ![GitHub License](https://img.shields.io/github/license/larssonoliver/larssonoliver.com)
  [![CI status](https://woodpecker.larssonoliver.com/api/badges/4/status.svg)](https://woodpecker.larssonoliver.com/repos/4)
  ![GitHub package.json version](https://img.shields.io/github/package-json/v/larssonoliver/larssonoliver.com)
  ![Vue JS](https://img.shields.io/badge/Vue.js-35495E?logo=vuedotjs&logoColor=4FC08D)

</div>

This is the source code for my personal website, built using [Vue.js](https://vuejs.org/). Deployed website can be found at [larssonoliver.com](https://larssonoliver.com).

## 🛠 Tech Stack

- [Vue.js 3](https://vuejs.org/) + [Vite](https://vitejs.dev/)
- [Node.js](https://nodejs.org/)
- [GitHub Actions](https://docs.github.com/en/actions) for CI/CD
    - Running on self-hosted runners using [GHA Runner Scale Sets](https://github.com/actions/actions-runner-controller).
- Deployed via self-hosted [Kubernetes](https://kubernetes.io/)
    - [Argo CD](https://argo-cd.readthedocs.io) for GitOps.

---

## 💻 Local Development

```bash
# Install dependencies
npm install

# Compiles and hot-reloads for development
npm run dev
```

See [package.json](./package.json) for more scripts.

## 🐳 Building

Building local image:

```bash
# Build image
docker build -t larssonoliver/larssonoliver.com .
```

Build multi-arch image for release:

```bash
# Builds image tagged both "latest" and the tag based on "git describe"
TAG="$(git describe --tags --always --dirty)" docker buildx bake
```

## 📄 License

This project is licensed under the [MIT License](./LICENSE).

# Distroless Container Image for PHP

[![docker](https://github.com/s6n-labs/distroless-php/actions/workflows/docker.yaml/badge.svg)](https://github.com/s6n-labs/distroless-php/actions/workflows/docker.yaml)

Lightweight container runtime for PHP based on Google's Distroless.

## Getting Started

### Using as a CLI

```shell
docker run -it ghcr.io/s6n-labs/distroless-php:8.2.6-bullseye \
    -r 'phpinfo();'
```

### Using as a base image

```dockerfile
FROM ghcr.io/s6n-labs/distroless-php:8.2.6-zts-bullseye
```

## Comparison

|Image|php|distroless-php|Δ|
|---|---|---|
|8.2.6-zts-bullseye|419 MB|108 MB|-311 MB|
|8.2.6-bullseye|450 MB|139 MB|-311 MB|
|8.1.19-zts-bullseye|418 MB|108 MB|-310 MB|
|8.1.19-bullseye|448 MB|138 MB|-310 MB|

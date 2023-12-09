# Distroless Container Image for PHP

[![docker](https://github.com/s6n-labs/distroless-php/actions/workflows/docker.yaml/badge.svg)](https://github.com/s6n-labs/distroless-php/actions/workflows/docker.yaml)

Lightweight container runtime for PHP based on Google's Distroless.

## Getting Started

### Using as a CLI

```shell
docker run -it ghcr.io/s6n-labs/distroless-php:8.3.0-bookworm \
    -r 'phpinfo();'
```

### Using as a base image

```dockerfile
FROM ghcr.io/s6n-labs/distroless-php:8.3.0-zts-bookworm
```

## Comparison

|Image|php|distroless-php|Δ|
|---|---|---|---|
|8.3.0-zts-bookworm|497 MB|128 MB|-369 MB|
|8.3.0-bookworm|530 MB|161 MB|-369 MB|
|8.2.13-zts-bookworm|495 MB|125 MB|-370 MB|
|8.2.13-bookworm|526 MB|157 MB|-369 MB|
|8.1.26-zts-bookworm|494 MB|125 MB|-369 MB|
|8.1.26-bookworm|524 MB|156 MB|-368 MB|

# README

## TL;DR

Personal dockerfiles for common devops tools.

## Table of Contents

- [Intro](#intro)
- [RoadMap](#roadmap)
- [Usage](#usage)
- [Related Efforts](#related-efforts)
- [Maintainers](#maintainers)
- [License](#license)

## Intro

Personal dockerfiles for common devops tools. Most of them are used during devops routines.

## RoadMap

- Autobuild with bot.
- Triggers on Dockerfile CVE and shellcheck.
- Try `earthly` build with `earthfile` later.

## Usage

Choose the image you need on [Dockerhub](https://hub.docker.com/) or [my Harbor](https://harbor.leryn.top). Or you can run the script `docker-build.sh` to build yourself.

Only lastet versions would be kept on Harbor.

Build with local binary is NOT recommended.

### Name convention

If the image you need is named `image`:

- Dockerhub: `docker.io/leryn/<image>`
- Harbor: `harbor.leryn.top/infra/<image>`

## Related Efforts

Those repos are referenced on:

- [jessfraz/dockerfiles](https://github.com/jessfraz/dockerfiles)
- [mritd/autobuild](https://github.com/mritd/autobuild)

## Maintainers

[@Leryn](https://github.com/leryn1122).

## License

[MIT](LICENSE) © Leryn

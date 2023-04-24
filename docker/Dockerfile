ARG LILYPOND_VERSION=2.24.1

FROM jeandeaual/lilypond:$LILYPOND_VERSION as lilypond

FROM debian:bullseye-slim AS base
COPY --from=lilypond /lilypond /lilypond
ENV PATH "/lilypond/bin:${PATH}"

RUN apt update
# See https://github.com/jeandeaual/docker-lilypond/blob/b9ccedde161cf7258844c9b9c5a17d37b64887c9/Dockerfile#L77
RUN \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    # LilyPond run dependencies
    libglib2.0-0 \
    guile-2.2 \
    libpangoft2-1.0-0 \
    fontconfig \
    fonts-dejavu \
    # Not installed by LilyPond anymore since 2.23.80
    fonts-urw-base35 \
    # Remove if / when Ghostscript gets replaced by Cairo
    ghostscript \
    # Required when building with --enable-cairo-backend
    libcairo2 \
    # For convert-ly
    python-is-python3 \
    # LilyPond optional dependencies
    extractpdfmark \
    # To transform PDFs (e.g. rotate)
    qpdf

RUN apt install -y make

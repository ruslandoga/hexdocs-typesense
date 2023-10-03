FROM alpine:3.18.3 AS artifacts

RUN apk add --no-cache curl
RUN mkdir -p /var/lib/typesense && \
  cd /var/lib/typesense && \
  curl -O https://hexdocs-artifacts.s3.eu-central-003.backblazeb2.com/typesense_hexdocs_v0.tar.gz && \
  tar -xf typesense_hexdocs_v0.tar.gz .

FROM typesense/typesense:0.25.1

COPY --from=artifacts /var/lib/typesense /var/lib/typesense

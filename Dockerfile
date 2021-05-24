FROM scratch
RUN apt-get update && apt-get install build-essential

COPY artifacts/build/release/linux/amd64/echo-server /bin/echo-server
ARG XDG_CONFIG_HOME=/tmp/.cache
ENV PORT 8080
EXPOSE 8080
ENTRYPOINT ["/bin/echo-server"]

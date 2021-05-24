FROM scratch
RUN apt-get update && apt-get install build-essential

ENV XDG_CONFIG_HOME=/tmp/.cache
COPY artifacts/build/release/linux/amd64/echo-server /bin/echo-server
ENV PORT 8080
EXPOSE 8080
ENTRYPOINT ["/bin/echo-server"]

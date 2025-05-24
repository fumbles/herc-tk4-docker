# Stage 1: Build stage (for cleaning up or future expansions)
FROM ubuntu:18.04 AS builder
WORKDIR /tk4-/
COPY . /tk4-/

# Remove unneeded directories
RUN rm -rf /tk4-/hercules/darwin /tk4-/hercules/windows /tk4-/hercules/source

# Stage 2: Final image
FROM ubuntu:18.04
LABEL maintainer="daniel@yourdomain.com"
LABEL version="1.00"
LABEL description="Hercules TK4- MVS 3.8j emulator"

WORKDIR /tk4-/
COPY --from=builder /tk4-/ /tk4-/

EXPOSE 3270 8038

CMD ["/tk4-/mvs"]


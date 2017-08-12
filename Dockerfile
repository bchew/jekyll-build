FROM alpine:3.6

ENV JAVA_ALPINE_VERSION 8.131.11-r2
ENV NODEJS_ALPINE_VERSION 6.10.3-r1
ENV RUBY_ALPINE_VERSION 2.4.1-r3
ENV RUBY_BUNDLER_ALPINE_VERSION 1.15.0-r0

# Install base packages
RUN apk update
RUN apk upgrade
RUN apk add curl tar ca-certificates bash build-base libffi-dev

# Install ruby and ruby-bundler
RUN apk add ruby="$RUBY_ALPINE_VERSION" \
  ruby-dev="$RUBY_ALPINE_VERSION" \
  ruby-io-console="$RUBY_ALPINE_VERSION" \
  ruby-bundler="$RUBY_BUNDLER_ALPINE_VERSION"

# Install NodeJS
RUN apk add nodejs="$NODEJS_ALPINE_VERSION"

# Install java
RUN apk add openjdk8-jre="$JAVA_ALPINE_VERSION"

# Clean APK cache
RUN rm -rf /var/cache/apk/*

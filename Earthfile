VERSION 0.8

# Latest ruby & and bundler from June-2025
FROM ruby:3.3.3
WORKDIR /apps
ENV BUNDLER_VERSION=2.5.14

# Deps setup budler with simple check, any addition
# to source get automated to deps in build step
deps:
    RUN gem install bundler:$BUNDLER_VERSION
    COPY Gemfile Gemfile.lock ./
    RUN bundle check || bundle install
    SAVE ARTIFACT Gemfile.lock AS LOCAL ./Gemfile.lock

build:
    FROM +deps
    COPY src src
    SAVE ARTIFACT src /src

docker:
    FROM +deps
    COPY +build/src src
    ENTRYPOINT ["ruby", "./src/hello.rb"]
    SAVE IMAGE --push earthly/examples:ruby
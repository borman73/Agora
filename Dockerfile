FROM ruby:3.2.0-slim

ARG RAILS_ROOT=/agora

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    bash \
    build-essential \
    curl \
    gnupg2 \
    git \
    less \
    libpq-dev \
    libvips42 \
    nodejs \
    postgresql-client \
    screen \
    vim \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
  
RUN gem update --system && gem install bundler

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock  ./
RUN bundle install --jobs 5

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000

CMD bundle exec rails s -b '0.0.0.0' -p 3000
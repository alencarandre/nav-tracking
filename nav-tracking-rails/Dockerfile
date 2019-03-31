FROM ruby:2.5.5

RUN apt-get update && apt-get install -y sudo cron apt-transport-https curl \
  qt4-dev-tools libqt4-dev xvfb postgresql-client imagemagick qt5-default \
  libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

ADD . /app/nav-tracking/nav-tracking-rails
WORKDIR /app/nav-tracking/nav-tracking-rails

RUN chmod -R +x bin && chmod +x start
RUN bundle install --without development test
RUN yarn install

EXPOSE 3000

CMD bash start

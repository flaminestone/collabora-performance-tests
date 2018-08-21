FROM ubuntu:16.04

MAINTAINER Dmitriy.Rotatii "kvazilife@gmail.com"
#ENV SERVER 'https://demo.us.collaboraonline.com'
#ENV LOGIN 'cba6k@vmani.com'
#ENV PASSWORD 'owncloud1234'
RUN apt-get update && apt-get install -y ca-certificates \
                                         curl \
                                         git \
                                         net-tools \
                                         software-properties-common \
                                         xdg-user-dirs \
                                         ffmpeg \
                                         libmagickwand-dev \
                                         wget

RUN apt-add-repository ppa:brightbox/ruby-ng


RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

RUN apt-get update && \
    apt-get -y install build-essential \
                       ghostscript \
                       google-chrome-stable \
                       imagemagick \
                       libcurl3 \
                       libhunspell-dev \
                       libmagic-dev \
                       libmysqlclient-dev \
                       poppler-utils \
                       psmisc \
                       ruby2.5 \
                       ruby2.5-dev \
                       tzdata \
                       xdotool \
                       libav-tools \
                       xvfb
RUN mkdir /collabora-performance-tests
WORKDIR /collabora-performance-tests
ADD . /collabora-performance-tests
RUN gem install bundler
RUN bundle install
RUN mkdir ~/.s3
RUN echo 'AKIAJZMO53VQCE2FHR4A' > ~/.s3/key
RUN echo 'a/FGvYv0Dh/HryIFQTH/7GD3HGdrRZBY09tlYqVr' > ~/.s3/private_key
CMD rake simple_runner


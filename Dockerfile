FROM ubuntu:16.04
MAINTAINER Forge UK "info@forge.uk"

# Update and install packages
RUN apt-get update && apt-get install curl apt-transport-https -yq

# Add yarn source to apt-get
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Add node source to apt-get
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Install apt-get packages
RUN apt-get update
RUN apt-get install build-essential libgmp-dev unzip rsync php7.0 php7.0-curl composer nodejs ruby-dev git yarn -yq

# Set git configuration
git config --global user.name "Forge CI/CD Deployment"
git config --global user.email "deployments@forge.uk"

# Install WP Cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Install scss-lint gem
RUN gem install scss_lint

# Install Wraith (for future testing)
# RUN gem install wraith

# Install global NPM packages
RUN npm install -g gulp bower webpack

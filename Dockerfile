FROM wordpress

# Install requirements for wp-cli support
RUN apt-get update \
  && apt-get install -y sudo less mysql-client \
  && rm -rf /var/lib/apt/lists/*

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar

# Install Elementor
RUN wp plugin install elementor --activate

# Install Git
RUN apt-get install -y git --fix-missing

# Install PHPENV
RUN cd ~ \ 
  && git clone git://github.com/phpenv/phpenv.git .phpenv \
  && export PATH="$HOME/.phpenv/bin:$PATH"

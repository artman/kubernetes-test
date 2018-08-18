FROM gcr.io/google_appengine/nodejs
RUN /usr/local/bin/install_node '>=8.5.0'
COPY . /app/

# NPM Install
RUN npm install --unsafe-perm || \
  ((if [ -f npm-debug.log ]; then \
      cat npm-debug.log; \
    fi) && false)

# Run application
CMD npm run start-production

FROM 676007236/myrails-env:latest
#RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
WORKDIR /app
COPY . /app/
#RUN bundle install
# Start the main process.
#CMD ['/home/app/webapp/entrypoint.sh']


#COPY Gemfile /app/Gemfile
#COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

CMD [ "bundle", "exec", "sidekiq", "-C", "config/sidekiq.yml"]

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

EXPOSE 3000

CMD [ "bundle", "exec", "puma", "-p", "3000"]

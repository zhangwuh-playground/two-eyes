class SendMessageWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'usermessages', retry: 3, backtrace: 10

  def perform(id, message)
    logger.info "SendMessageWorker.perform #{message} #{id} by sidekiq start"
    sleep 3.second
    logger.info "SendMessageWorker.perform #{message} to #{id} by sidekiq end"
  end
end
require 'thrift'
require 'user_service'
require 'user_service_types'
require "base64"
BUSH_SERVICE_ADDR = ENV["BUSH_SERVICE_ADDR"].nil? ? "localhost" : ENV["BUSH_SERVICE_ADDR"]
PORT = 9090

module BushService
  include Tracer
  def getUser(id)
    trace("bush:client:get user by id") {
      begin
        transport = Thrift::BufferedTransport.new(Thrift::Socket.new(BUSH_SERVICE_ADDR, PORT))
        client = Bush::UserService::Client.new(Thrift::BinaryProtocol.new(transport))
        transport.open()
        carrier = {}
        OpenTracing.inject(OpenTracing.active_span.context, OpenTracing::FORMAT_TEXT_MAP,carrier)
        return client.getUser(Bush::TraceContext.new(carrier: carrier.to_json), id.to_i)
      rescue Thrift::Exception => tx
        print 'Thrift::Exception: ', tx.message, "\n"
      ensure
        transport.close
      end
    }
  end
end

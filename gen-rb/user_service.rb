#
# Autogenerated by Thrift Compiler (0.14.2)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'user_service_types'

module Bush
  module UserService
    class Client
      include ::Thrift::Client

      def getUser(tc, id)
        send_getUser(tc, id)
        return recv_getUser()
      end

      def send_getUser(tc, id)
        send_message('getUser', GetUser_args, :tc => tc, :id => id)
      end

      def recv_getUser()
        result = receive_message(GetUser_result)
        return result.success unless result.success.nil?
        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getUser failed: unknown result')
      end

    end

    class Processor
      include ::Thrift::Processor

      def process_getUser(seqid, iprot, oprot)
        args = read_args(iprot, GetUser_args)
        result = GetUser_result.new()
        result.success = @handler.getUser(args.tc, args.id)
        write_result(result, oprot, 'getUser', seqid)
      end

    end

    # HELPER FUNCTIONS AND STRUCTURES

    class GetUser_args
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TC = 1
      ID = 2

      FIELDS = {
        TC => {:type => ::Thrift::Types::STRUCT, :name => 'tc', :class => ::Bush::TraceContext},
        ID => {:type => ::Thrift::Types::I32, :name => 'id'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class GetUser_result
      include ::Thrift::Struct, ::Thrift::Struct_Union
      SUCCESS = 0

      FIELDS = {
        SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::Bush::RcpResponse}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

  end

end

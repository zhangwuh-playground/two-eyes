# frozen_string_literal: true

require 'jaeger/client'

JAEAGER_COLLECTOR_ADDR = ENV['JAEAGER_COLLECTOR_ADDR'].nil? ? 'http://localhost:14268' : ENV['JAEAGER_COLLECTOR_ADDR']
OpenTracing.global_tracer = Jaeger::Client.build(service_name: 'twoeyes',
                                                 reporter: Jaeger::Reporters::RemoteReporter.new(
                                                   sender: Jaeger::HttpSender.new(
                                                     url: "#{JAEAGER_COLLECTOR_ADDR}/api/traces",
                                                     encoder: Jaeger::Encoders::ThriftEncoder.new(service_name: 'twoeyes')
                                                   ),
                                                   flush_interval: 10
                                                 ),
                                                 )

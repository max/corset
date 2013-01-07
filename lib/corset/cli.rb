require 'corset'
require 'thor'

module Corset
  class CLI < Thor

    desc 'set', 'Set the CORS configuration on the bucket.'

    method_option :key, aliases: '-k', desc: 'AWS access key', default: ENV['AWS_ACCESS_KEY_ID'], required: true
    method_option :secret, aliases: '-s', desc: 'AWS access secret', default: ENV['AWS_SECRET_ACCESS_KEY'], required: true
    method_option :bucket, aliases: '-b', desc: 'AWS S3 bucket to use.', default: ENV['FOG_DIRECTORY'], required: true
    method_option :origin, aliases: '-o', desc: 'Allowed origin.', default: ENV['AWS_CORS_ALLOWED_ORIGIN'] || '*', required: true

    def set
      storage.put_bucket_cors(options[:bucket], cors)
    end

  private

    def storage
      @storage ||= Fog::Storage.new(
        provider: 'aws',
        aws_access_key_id: options[:key],
        aws_secret_access_key: options[:secret]
      )
    end

    def cors
      { 'CORSConfiguration' => [{
          'AllowedHeader' => ['Content-*', 'Host'],
          'AllowedMethod' => 'GET',
          'AllowedOrigin' => options[:origin],
          'MaxAgeSeconds' => '3000' }] }
    end

  end
end

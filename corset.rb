require 'fog'

cors = {
  'CORSConfiguration' => [{
    'AllowedHeader' => ['Content-*', 'Host'],
    'AllowedMethod' => 'GET',
    'AllowedOrigin' => ENV['AWS_CORS_ALLOWED_ORIGIN'],
    'MaxAgeSeconds' => '3000'
  }]
}

storage = Fog::Storage.new(:provider => 'aws',
                           :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                           :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])

storage.put_bucket_cors(ENV['FOG_DIRECTORY'], cors)

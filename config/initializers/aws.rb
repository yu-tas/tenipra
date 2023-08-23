Aws.config.update({
  region: 'ap-northeast-3',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
})

s3 = Aws::S3::Client.new
# S3の操作

ec2 = Aws::EC2::Client.new
# EC2の操作

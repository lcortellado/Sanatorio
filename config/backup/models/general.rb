# encoding: utf-8
require 'dotenv'
require "rails"

##
# Backup Generated: general
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t general [-c <path_to_configuration_file>]
#
Backup::Model.new(:general, 'Description for general') do
  Dotenv.load

  root_path = File.dirname(__FILE__)
  archive :code do |archive|
    archive.root root_path
    archive.add "."
    archive.exclude root_path + '/log'
    archive.exclude root_path + '/tmp'
  end

  compress_with Gzip do

  end

  if ENV['SSL_PASSWORD']
    encrypt_with OpenSSL do |encryption|
      encryption.password = ENV['SSL_PASSWORD']
      encryption.base64   = true
      encryption.salt     = true
    end
  end

  if File.exists? root_path + "/config/database.yml"
    environment = 'production'
    dbconfig = YAML::load(ERB.new(IO.read(File.join(root_path, 'config', 'database.yml'))).result)[environment]
    if dbconfig['adapter'] == 'mysql2'
      database MySQL do |db|
        db.name               = dbconfig['sanatorio']
        db.username           = dbconfig['root']
        db.password           = dbconfig['admin']
        db.host               = dbconfig['127.0.0.1']
        db.port               = dbconfig['3306']
        db.socket             = dbconfig['socket']
      end
    elsif dbconfig['adapter'] == 'postgresql'
      database PostgreSQL do |db|
        db.name               = dbconfig['database']
        db.username           = dbconfig['username']
        db.password           = dbconfig['password']
        db.host               = dbconfig['host']
        db.port               = dbconfig['port']
        db.socket             = dbconfig['socket']
      end
    end
  end

  if File.exists? root_path + "/config/mongoid.yml"
    environment = 'production'
    dbconfig = YAML::load(ERB.new(IO.read(File.join(root_path, 'config', 'mongoid.yml'))).result)[environment]
    if dbconfig
      database MongoDB do |db|
        db.name               = dbconfig['sessions']['default']['database']
        db.username           = dbconfig['sessions']['default']['username']
        db.password           = dbconfig['sessions']['default']['password']
        #db.host               = dbconfig['host']
        #db.port               = dbconfig['port']
        db.ipv6               = false
        db.lock               = false
        db.oplog              = false
      end
    end
  end

  if ENV['LOCAL_PATH']
    store_with Local do |local|
      local.path = ENV['LOCAL_PATH']
      local.keep = 5
    end
  end

  if ENV['S3_ACCESS_KEY_ID'] && ENV['S3_SECRET_ACCESS_KEY'] && ENV['S3_BUCKET']
    store_with S3 do |s3|
      # AWS Credentials
      s3.access_key_id     = ENV['S3_ACCESS_KEY_ID']
      s3.secret_access_key = ENV['S3_SECRET_ACCESS_KEY']
      # Or, to use a IAM Profile:
      # s3.use_iam_profile = true

      s3.region             = ENV['S3_REGION']
      s3.bucket             = ENV['S3_BUCKET']
      #s3.path               = ENV['S3_PATH']
    end
  end

  if ENV['NOTIFY_MAIL_USER_NAME']
    notify_by Mail do |mail|
      mail.on_success           = true
      mail.on_warning           = true
      mail.on_failure           = true

      mail.from                 = ENV['luiscarlosortecabral@gmail.com']
      mail.to                   = ENV['luiscarlosortecabral@hotmail.es']
      mail.address              = ENV['smtp.gmail.com']
      mail.port                 = ENV['587']
      mail.domain               = ENV['sannasys.herokuapp.com']
      mail.user_name            = ENV['luiscarlosortecabral@gmail.com']
      mail.password             = ENV['19911991charly']
      mail.authentication       = ENV['plain']
      mail.encryption           = :starttls
    end
  end
end

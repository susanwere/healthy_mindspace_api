# frozen_string_literal: true

require 'carrierwave/orm/activerecord'

if Rails.env.test?

  CarrierWave.configure do |config|
    config.storage = :file   # Setup Carrierwave to use local storage 
    config.enable_processing = false  #Disable file processing in test environment
    config.cache_dir = Rails.root.join 'spec/support/uploads/tmp' #separate test uploads from any other uploads
    config.asset_host = ActionController::Base.asset_host # Setup asset_host
  end

end

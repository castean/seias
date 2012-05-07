CanTango.config do |config|
  config.debug.set :on
  config.engines.all :on
  #config.permits.disable :account, :special, :role_group
  # more configuration here...
  config.engine(:permission).set :off
  config.engine(:cache).set :off
end

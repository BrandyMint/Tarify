if defined? Airbrake
  Airbrake.configure do |config|
    config.api_key = '15067887c3641231a488433e585b0bb7'
    config.host    = 'errbit.brandymint.ru'
    config.port    = 80
    config.secure  = config.port == 443
  end
end

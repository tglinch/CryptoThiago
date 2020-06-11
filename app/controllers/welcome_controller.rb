class WelcomeController < ApplicationController
  layout "wellcome"
  def index
    cookies[:user_name] = "Thiago"
    cookies[:login] = {value: "TG-2802", expires: 1.hour, domain: %w('google.com')}
    cookies[:lat_lon] = JSON.generate([123.45, -127.55])
    cookies[:curso] = "Ruby on Rails"
    session[:curso] = "Ruby on Rails"
    @nome = params[:nome]
  end
end

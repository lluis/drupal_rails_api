class ApplicationController < ActionController::API

  def error404
    render plain: 'not found', status: 404
  end

end

class ApplicationController < ActionController::API

  def error404
    render text: 'not found', status: 404
  end

end

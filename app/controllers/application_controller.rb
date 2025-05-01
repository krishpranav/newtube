class ApplicationController < ActionController::API
  def current_user
    header = request.headers['Authorization']
    token = header.split(' ').last
    decoded = JWT.decode(token, ENV['JWT_SECRET'])[0]
    @current_user ||= User.find(decoded['user_id'])
  rescue
    head :unauthorized
  end
end

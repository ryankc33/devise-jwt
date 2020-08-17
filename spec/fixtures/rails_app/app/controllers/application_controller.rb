class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  respond_to :json

  def jwt_with_jti_matcher_user_auth_action
    puts 'Running jwt_with_jti_matcher_user_auth_action'
    puts "Instance ancestor #{current_jwt_with_jti_matcher_user.class.ancestors[1]}"
    puts "Class ancestor #{JwtWithJtiMatcherUser.ancestors[1]}"
    head :ok
  end
  before_action :authenticate_jwt_with_jti_matcher_user!,
                only: :jwt_with_jti_matcher_user_auth_action

  def jwt_with_jti_matcher_user_testing_code_reload_action
    # ActiveSupport::Reloader.reload!
    puts 'Running jwt_with_jti_matcher_user_testing_code_reload_action'
    puts "Instance ancestor #{current_jwt_with_jti_matcher_user.class.ancestors[1]}"
    puts "Class ancestor #{JwtWithJtiMatcherUser.ancestors[1]}"
    head current_jwt_with_jti_matcher_user.is_a?(JwtWithJtiMatcherUser) ? :ok : :internal_server_error
  end
  before_action :authenticate_jwt_with_jti_matcher_user!,
    only: [
      :jwt_with_jti_matcher_user_auth_action,
      :jwt_with_jti_matcher_user_testing_code_reload_action
  ]

  def jwt_with_denylist_user_auth_action
    head :ok
  end
  before_action :authenticate_jwt_with_denylist_user!,
                only: :jwt_with_denylist_user_auth_action

  def jwt_with_allowlist_user_auth_action
    head :ok
  end
  before_action :authenticate_jwt_with_allowlist_user!,
                only: :jwt_with_allowlist_user_auth_action

  def jwt_with_null_user_auth_action
    head :ok
  end
  before_action :authenticate_jwt_with_null_user!,
                only: :jwt_with_null_user_auth_action
end

# frozen_string_literal: true

require 'spec_helper'

describe 'Autoreloading', type: :request do
  include_context 'feature'
  include_context 'fixtures'

  context 'JWT user with JTI matcher revocation' do
    let(:user) { jwt_with_jti_matcher_user }
    let(:user_params) do
      {
        jwt_with_jti_matcher_user: {
          email: user.email,
          password: user.password
        }
      }
    end

    it 'authorizes requests with a valid token' do
      auth = sign_in(jwt_with_jti_matcher_user_session_path, user_params)

      get_with_auth('/jwt_with_jti_matcher_user_auth_action', auth)
      get_with_auth('/jwt_with_jti_matcher_user_testing_code_reload_action', auth)

      expect(response.status).to eq(200)
    end
  end
end

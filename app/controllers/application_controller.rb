class ApplicationController < ActionController::Base
    # csrf token 없어도 되게 하는 코드
    skip_before_action :verify_authenticity_token, raise: false
end

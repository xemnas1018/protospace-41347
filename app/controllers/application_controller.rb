class ApplicationController < ActionController::Base
    # もしdeviseコントローラーのアクションなら動作前にメソッドを実行
    before_action :devise_user_parameters, if: :devise_controller?
  
    private
  
    def devise_user_parameters
      # deviseのuserモデルに保存するパラメーターを追加
      # 新規登録時パラメーター
      devise_parameter_sanitizer.permit(:sign_up,keys: [:name,:profile,:occupation,:position])
    end
end

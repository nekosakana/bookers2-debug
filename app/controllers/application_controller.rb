class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
	protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    root_path
  end

  private
#sign_up時の登録情報追加
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profle_image, :email, :postal_code, :prefecture_code, :city, :building])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) # ログイン時はnameを使用
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :postal_code, :prefecture_code, :city, :building])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end
end

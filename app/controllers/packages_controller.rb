class PackagesController < ApplicationController
  # 一覧表示
  def index
    @packages = Package.all
  end
  #一件表示
  def show
    @package = Package.find(params[:id])
  end
  # 作成
  def create
    package = Package.new(package_params)
    #current_user(application_controller.rbに定義)で現在ログイン中のUserをプラグイン作成者として登録
    package.user = current_user
    #saveメソッドの返り値が結果なのでそれをそのままViewに渡す
    @state = package.save
  end
  # 削除
  def destroy
    package = Package.find(params[:id])
    if package.user == current_user
      @state = package.destroy
    elsif can? :destroy, current_user
      @state = package.destroy
    else
      @state = :unauthorized
    end
  end
  private
  #ストロングパラメータ
  def package_params
    params.permit(:name,:main_assembly,:homepage,:description,:description_short,:tags,:uuid,:license)
  end
end

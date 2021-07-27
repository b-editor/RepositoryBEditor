class PackagesController < ApplicationController
  #一覧表示
  def index
    @packages = Package.all
  end
  #一件表示
  def show
    @package = Package.find(params[:id])
  end
  #作成
  def create
    package = Package.new(package_params)
    #current_user(application_controller.rbに定義)で現在ログイン中のUserをプラグイン作成者として登録
    package.user = current_user
    #saveメソッドの返り値が結果なのでそれをそのままViewに渡す
    @state = package.save
  end

  private
  #ストロングパラメータ
  def package_params
    params.permit(:name,:main_assembly,:homepage,:description,:description_short,:tags,:uuid,:license)
  end
end

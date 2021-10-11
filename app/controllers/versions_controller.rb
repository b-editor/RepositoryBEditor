class VersionsController < ApplicationController
  def index
    package = Package.find(params[:package_id])
    @versions = package.versions.all
  end
  def show
    package = Package.find(params[:package_id])
    @version = package.versions.find(params[:id])
  end
  def create
    package = Package.find(params[:package_id])
    if current_user == User.find(package.user_id)
      version = Version.new(version_params)
      #パラメータからもらったパッケージ番号のパッケージをバージョン追加先として登録
      version.package = Package.find(params[:package_id])
      version.release_datetime = Time.current
      #saveメソッドの返り値が結果なのでそれをそのままViewに渡す
      @state = version.save
    else
      @state = :unauthorized
    end
  end
  # 更新
  def update
    package = Package.find(params[:package_id])
    version = Version.find(params[:id])
    if package.user == current_user
      @state = version.update(version_params)
    elsif can? :update, current_user
      @state = version.update(version_params)
    else
      @state = :unauthorized
    end
  end
  # 削除
  def destroy
    package = Package.find(params[:package_id])
    version = Version.find(params[:id])
    if package.user == current_user
      @state = version.destroy
    elsif can? :destroy, current_user
      @state = version.destroy
    else
      @state = :unauthorized
    end
  end
  private
  def version_params
    params.permit(:download_url,:update_note,:update_note_short)
  end
end

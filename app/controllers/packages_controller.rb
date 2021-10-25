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
  # 更新
  def update
    package = Package.find(params[:id])
    if package.user == current_user
      @state = package.update(package_params)
    elsif can? :update, current_user
      @state = package.update(user_params)
    else
      @state = :unauthorized
    end
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
  # パッケージをそのままアップロードする
  def uploading
    #アップロードされた.bepkgファイルを取得
    uploaded = params[:package]
    # パッケージファイルの保存先パスを取得
    output_path = Rails.root.join('public/packages', params[:package].original_filename)
    #上で指定した場所へパッケージファイルを保存する
    File.open("." + output_path.to_s, 'w+b') do |fp|
      fp.write(uploaded.read)
    end
    unzip_and_parse_json
  end

  private
  #ストロングパラメータ
  def package_params
    params.permit(:name,:main_assembly,:homepage,:description,:description_short,:tags,:uuid,:license)
  end

  def unzip_and_parse_json

  end
end

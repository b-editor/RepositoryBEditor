class PackagesController < ApplicationController
  #一覧表示
  def index
    @packages = Package.all
  end
  def show
    @package = Package.find(params[:id])
  end

end

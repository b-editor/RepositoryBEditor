class VersionsController < ApplicationController
  def index
    package = Package.find(params[:package_id])
    @versions = package.versions.all
  end
end

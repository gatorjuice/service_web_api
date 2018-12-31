# frozen_string_literal: true

class Api::V1::SharesController < ApplicationController
  def create
    resource = Resource.find(params.require(:id))
    share = Share.new(resource)
    if share.save
      render_success(share)
    end
  end
end

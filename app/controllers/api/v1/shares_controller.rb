# frozen_string_literal: true

class Api::V1::SharesController < ApplicationController
  def create
    Resource.find(params.require(:id)).share_sms(params.require(:to))
  end
end

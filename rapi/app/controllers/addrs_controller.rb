# frozen_string_literal: true

# AddrsController
class AddrsController < ApplicationController
  before_action :set_addr, only: [:index, :show, :create, :update, :destroy]

  # GET /addrs
  def index
    render json: @addr.index
  end

  # GET /addrs/aid
  def show
    render json: @addr.get(params[:id])
  end

  # POST /addrs
  def create
    aid = @addr.add(addr_params)
    if aid
      render json: @addr.get(aid), status: :created
    else
      render json: @addr.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addrs/aid
  def update
    if @addr.set(addr_params)
      render json: @addr
    else
      render json: @addr.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addrs/aid
  def destroy
    @addr.delete(params[:id])
  end

  private

  def set_addr
    @addr = Addr.new()
  end

  def addr_params
    params.require(:addr).permit(:name, :birthday, :gender, :address, :job, :note)
  end
end

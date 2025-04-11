# frozen_string_literal: true

class AttributesController < ApplicationController
  def index
    @attributes = Evatribute.all
  end

  def new
    @attribute = Evatribute.new
    render :form
  end

  def create
    @attribute = Evatribute.new(attribute_params)

    if @attribute.save
      redirect_to evatributes_path
    else
      render :form, status: :unprocessable_entity
    end
  end

  def edit
    @attribute = Evatribute.find(params[:id])
    render :form
  end

  def update
    @attribute = Evatribute.find(params[:id])

    if @attribute.update(attribute_params)
      redirect_to evatributes_path
    else
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    Evatribute.find(params[:id]).destroy

    redirect_to evatributes_path
  end

  private

  def attribute_params
    params.require(:evatribute)
          .permit(:name, :data_type, :entity_type)
  end
end

class UtilityController < ApplicationController

  def risk_document
    @risk_documents = RiskDocument.all
  end

  def edit_risk_sheet
    if params[:document_id]
      @risk_document = find_risk_document
    else
      @risk_document = RiskDocument.new
    end
  end

  def create_risk_sheet
    @risk_document = RiskDocument.new(risk_document_params)
    if @risk_document.save
      flash[:success] = 'Risk Document Has Been Added Successfully'
      redirect_to risk_document_utility_index_path
    else
      render :edit_risk_sheet
    end
  end

  def update_risk_sheet
    if params[:document_id]
      @risk_document = find_risk_document
      @risk_document.update_attributes(risk_document_params)
      flash[:success] = 'Risk Document Has Been Updated Successfully'
      redirect_to risk_document_utility_index_path
    else
      render :edit_risk_sheet
    end
  end

  def remove_risk_sheet
    if params[:document_id]
      @risk_document = find_risk_document
      @risk_document.update_attribute(:enabled, !@risk_document.enabled)
      flash[:success] = 'Updated!'
      redirect_to risk_document_utility_index_path and return
    end
    redirect_to risk_document_utility_index_path
  end


  def risk_document_params
    params[:risk_document].permit(:feature_id, :feature_link, :feature_name, :status, :prd, :ux, :iteration, :notes)
  end

  private

  def find_risk_document
    return RiskDocument.where(:id => params[:document_id]).first
  end

end

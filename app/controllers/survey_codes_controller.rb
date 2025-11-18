class SurveyCodesController < ApplicationController
  before_action :authenticate_user!  # se quiser proteger a área administrativa

  def index
    @survey_codes = SurveyCode.all
  end

  def import
    if params[:file].present?
      SurveyCode.import(params[:file])
      redirect_to survey_codes_path, notice: "Códigos importados com sucesso!"
    else
      redirect_to survey_codes_path, alert: "Nenhum arquivo selecionado."
    end
  end

  def destroy_all
    SurveyCode.delete_all
    redirect_to survey_codes_path, notice: "Todos os códigos foram apagados com sucesso."
  end
end

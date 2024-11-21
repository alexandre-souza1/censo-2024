class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @questions = Question.all

        # Mapeamento das categorias para seus nomes
        @category_names = {
          1 => "LIDERANÇAS",
          2 => "SEGURANÇA",
          3 => "SERVIÇOS GERAIS",
          4 => "RECONHECIMENTO",
          5 => "TREINAMENTO E DESENVOLVIMENTO",
          6 => "PLANEJAMENTO (FÉRIAS E JORNADA)",
          7 => "REMUNERAÇÃO E BENEFÍCIOS",
          8 => "PERTENCIMENTO",
          9 => "COMUNICAÇÃO",
          10 => "SEGURANÇA PSICOLÓGICA",
          11 => "BENEFÍCIOS"
        }
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to root_path, notice: 'Pesquisa salva com sucesso!'
    else
      render :new, alert: 'Erro ao salvar pesquisa.'
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:code, *(1..62).map { |i| "response#{i}".to_sym })
  end
end

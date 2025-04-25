module SurveysHelper
  def nome_por_codigo(code)
    Codigo.find_by(code: code)&.name || 'Nome não encontrado'
  end
end

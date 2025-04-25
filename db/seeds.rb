# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# categorias = [
#  "Lideranças",
#  "Segurança",
#  "Reconhecimento",
#  "Treinamento e Desenvolvimento",
#  "Planejamento e Bem Estar",
#  "Remuneração e Benefícios",
#  "Cultura e Pertencimento",
#  "Comunicação",
#  "Segurança Psicológica",
#  "Saúde Mental",
#  "NPS"
# ]

# categorias = [
# "Estrutura Física",
# "Condições De Trabalho",
# "Higiene E Limpeza",
# "Recursos E Equipamentos De Trabalho",
# "Atendimento De Serviços Gerais",
# "Serviços Gerais E Saúde Mental",
# "Diversidade E Inclusão",
# "NPS Censo"
# ]

categorias.each do |nome|
  Category.find_or_create_by!(name: nome)
end

puts "Categorias criadas com sucesso!"

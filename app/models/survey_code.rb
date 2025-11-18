require "roo"

class SurveyCode < ApplicationRecord
  def self.import(file)
    # Abre o Excel automaticamente (.xlsx ou .xls)
    xlsx = Roo::Spreadsheet.open(file.path)

    # Pega a primeira aba
    sheet = xlsx.sheet(0)

    # Lê cabeçalhos normalizados
    headers = sheet.row(1).map { |h| h.to_s.strip.downcase }

    # Itera pelas linhas (começando da 2)
    (2..sheet.last_row).each do |i|
      row = Hash[[headers, sheet.row(i)].transpose]

      create!(
        unidade:      row["unidade"],
        colaborador:  row["colaborador"],
        cpf:          row["cpf"],
        status:       row["status"],
        code:         row["código"] || row["codigo"],  # aceita com acento ou sem
        used: false
      )
    end
  end
end

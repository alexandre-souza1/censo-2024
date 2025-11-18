# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# questions = [
# "1.1 - Meu/minha líder confia em mim e me dá autonomia para desempenhar meu trabalho.",
# "1.2 - Meu/minha líder sempre conversa comigo sobre como estou trabalhando.",
# "1.3 - Minha liderança me auxilia e orienta em busca dos resultados DPO/VPO.",
# "1.4 - O(a) gerente desta operação é presente, acessível e atento aos problemas.",
# "2.1 - As pessoas da minha área seguem todas as regras e procedimentos de segurança.",
# "2.2 - São disponibilizados EPIs e treinamentos para que eu realize meu trabalho com segurança.",
# "2.3 - Minha unidade é um lugar seguro para trabalhar.",
# "3.1 - Minha unidade está sempre limpa e os ambientes bem conservados.",
# "3.2 - As áreas em comum (refeitório, sala de matinal, banheiros, vestiários, armários etc.), estão sempre limpas e bem conservadas.",
# "3.3 - Sempre encontro materiais disponíveis para uso pessoal nas áreas (copos descartáveis, papel higiênico, sabonete etc.)",
# "3.4 - Os equipamentos disponíveis (caminhões, empilhadeiras, paleteiras, celular etc.) são novos e bem conservados.",
# "3.5 - Os chamados para melhoria no ambiente de trabalho são concluídos e divulgados.",
# "4.1 - Esta empresa investe nas pessoas e reconhece aquelas que se destacam.",
# "4.2 - Sou reconhecido(a) quando faço um bom trabalho.",
# "4.3 - O programa de reconhecimento realmente premia os melhores resultados.",
# "4.4 - Nesta empresa, celebramos momentos e eventos especiais.",
# "5.1 - Recebo treinamentos para meu desenvolvimento profissional.",
# "5.2 - Os treinamentos recebidos para a realização das minhas atividades são suficientes.",
# "5.3 - Sei utilizar corretamente todas as ferramentas tecnológicas no trabalho que executo.",
# "5.4 - Faço bom uso das minhas habilidades na minha função atual.",
# "5.5 - Eu tenho impacto direto no alcance das minhas metas.",
# "5.6 - Eu entendo como o meu desempenho é avaliado no Ciclo de Gente.",
# "6.1 - Nesta empresa as responsabilidades e atividades são distribuídas de forma equilibrada entre os colaboradores.",
# "6.2 - Sempre consigo executar minhas atividades dentro do tempo previsto e raramente excedo a minha jornada de trabalho.",
# "6.3 - Consigo manter um equilíbrio entre minha vida pessoal e trabalho.",
# "6.4 - Meu banco de horas é bem gerenciado e as folgas são comunicadas com antecedência.",
# "6.5 - Consigo planejar minhas férias de forma que não haja prejuízo para mim ou para a empresa.",
# "7.1 - Estou satisfeito(a) com a remuneração que recebo aqui.",
# "7.2 - Estou satisfeito(a) com os benefícios que recebo aqui.",
# "7.3 - Entendo como funciona a Remuneração Variável e acho a justa a forma de cálculo.",
# "7.4 - Consulto minha RV com frequência, pois o terminal está sempre atualizado e correto.",
# "7.5 - Eu confio no meu pagamento, pois ele sempre é realizado corretamente.",
# "7.6 - Eu continuaria trabalhando aqui, mesmo que recebesse uma proposta de trabalho com mesma remuneração e benefícios.",
# "8.1 - Esta empresa consegue transmitir - na prática - sua missão, visão e valores.",
# "8.2 - Eu me sinto motivado(a) com a missão, a visão e os valores desta empresa.",
# "8.3 - Meu trabalho desempenha papel fundamental na realização do sonho da empresa.",
# "8.4 - Esta empresa atua de forma ética e transparente na relação com seus colaboradores, clientes, fornecedores, meio ambiente e sociedade.",
# "8.5 - Gosto do meu trabalho e me identifico com esta empresa.",
# "8.6 - Considero esta empresa um bom lugar para trabalhar.",
# "9.1 - Estou bem informado(a) sobre os planos e processos da empresa, pois existe uma boa comunicação interna.",
# "10.1 - Eu sinto que os líderes e colegas se preocupam em nos ouvir e nos apoiar no dia-a-dia.",
# "10.2 - Me sinto seguro(a) para falar sobre minhas opiniões e me expressar.",
# "10.3 - Se vejo algo errado, me sinto confortável e motivado(a) para agir no momento e corrigir.",
# "10.4 - Este é um lugar emocionalmente saudável para trabalhar.",
# "10.5 - Os colaboradores são tratados igualmente e de forma justa independente do gênero, idade, raça, deficiência, religião, orientação sexual ou condição social.",
# "10.6 - O canal de ouvidoria é confiável.",
# "1.1 - Você é uma pessoa com deficiência?",
# "2.1 - Qual a sua escolaridade?",
# "2.2 - Estado civil",
# "2.3 - Tem filhos ou dependentes socioafetivos? Se sim, quantos você tem?",
# "3.1 - Onde você nasceu?",
# "4.1 - Qual é a sua situação de moradia atual?",
# "4.2 - Quantas pessoas moram com você?",
# "4.3 - Você mora ou já morou na periferia?",
# "5.1 - Você se identifica como?",
# "5.2 - Qual a sua orientação sexual?",
# "5.3 - Qual a sua cor/etnia?",
# "6.1 - Qual sua Renda Total Familiar?",
# "6.2 - Além de você, quais integrantes da família trabalham?",
# "6.3 - Você possui outra fonte de renda?",
# "7.1 - Você sente ou sofreu algum tipo de discriminação e/ou preconceito no seu ambiente de trabalho? Se sim, qual?",
# "7.2 - Qual(is) fator(es) você atribui como o(s) mais impactante(s) para o seu dia a dia?",
# "8.1 - Você tem algum problema de saúde? (Pode marcar mais de uma opção, se for o caso)",
# "9.1 - Como você se locomove de casa para o trabalho?",
# "9.2 - Quanto tempo você leva no deslocamento casa x trabalho"
# ]

# questions.each do |question_text|
#   Question.create(text: question_text)
# end


# --- PARTE 1: ENGAGEMENT (1.1 a 1.28) ---
engagement_questions = [
  "1.1 - Minha liderança imediata direta é acessível e aberta ao diálogo.",
  "1.2 - Confio nas decisões da minha liderança imediata.",
  "1.3 - Minha liderança imediata demonstra preocupação com meu bem-estar.",
  "1.4 - Minha liderança é justa e coerente.",
  "1.5 - As regras de segurança são sempre respeitadas, mesmo que o trabalho demore mais a ser realizado.",
  "1.6 - São disponibilizados EPIs e treinamentos para que eu realize meu trabalho com segurança.",
  "1.7 - Sou reconhecido(a) quando faço um bom trabalho.",
  "1.8 - Sinto que meu trabalho é importante e faz diferença para a empresa.",
  "1.9 - Tenho oportunidades reais de aprender e crescer profissionalmente.",
  "1.10 - Recebo treinamentos, orientações ou outras oportunidades de desenvolvimento na empresa.",
  "1.11 - Sei quais são minhas metas e responsabilidades.",
  "1.12 - Consigo manter um equilíbrio entre minha vida pessoal e trabalho.",
  "1.13 - Sempre consigo executar minhas atividades dentro do tempo previsto e raramente excedo a minha jornada de trabalho.",
  "1.14 - Consigo planejar minhas férias de forma que não haja prejuízo para mim ou para a empresa.",
  "1.15 - Sinto que minha remuneração é justa em relação ao meu trabalho e responsabilidades.",
  "1.16 - O programa de benefícios que recebo fazem diferença no meu dia a dia.",
  "1.17 - Sinto que posso contar com meus colegas.",
  "1.18 - Pretendo continuar trabalhando nesta empresa pelos próximos 12 meses.",
  "1.19 - Me identifico com a cultura da empresa em que trabalho.",
  "1.20 - As informações importantes chegam até mim de forma clara.",
  "1.21 - Sei a quem recorrer quando tenho dúvidas ou problemas.",
  "1.22 - Os times se comunicam de forma clara e ajudam uns aos outros.",
  "1.23 - Me sinto seguro(a) e respeitado(a) no ambiente de trabalho.",
  "1.24 - Sinto que posso falar sobre saúde mental sem medo de represálias.",
  "1.25 - Este é um lugar emocionalmente saudável para trabalhar.",
  "1.26 - O local onde trabalho é limpo, bem cuidado e confortável para realizar minhas atividades.",
  "1.27 - Tenho os equipamentos e materiais necessários, em boas condições, para realizar meu trabalho.",
  "1.28 - Quando preciso, consigo ajuda rápida para resolver problemas com estrutura ou equipamentos."
]

engagement_questions.each do |question_text|
  Question.create!(
    text: question_text,
    category: "Engagement",
    response_type: "radio"
  )
end


# --- PARTE 2: CENSO (2.1 a 2.15) ---
censo_questions = [
  {
    text: "2.1 - Qual a sua escolaridade?",
    response_type: "radio",
    options: [
      "Pós Graduado(a)",
      "Superior Completo",
      "Superior Incompleto",
      "Ensino Médio Completo (antigo 2º Grau)",
      "Ensino Médio Incompleto (antigo 2º Grau)",
      "Ensino Fundamental Completo (antigo 1º Grau)",
      "Ensino Fundamental Incompleto (antigo 1º Grau)",
      "Nunca estudei"
    ]
  },
  {
    text: "2.2 - Você é uma pessoa com deficiência?",
    response_type: "radio",
    options: ["Sim", "Não"]
  },
  {
    text: "2.3 - Tem filhos ou dependentes socioafetivos? Se sim, quantos você tem?",
    response_type: "radio",
    options: ["Sim", "Não"]
  },
  {
    text: "2.4 - Onde você nasceu?",
    response_type: "dropdown",
    options: [
      "Acre (AC)", "Alagoas (AL)", "Amapá (AP)", "Amazonas (AM)", "Bahia (BA)", "Ceará (CE)",
      "Distrito Federal (DF)", "Espírito Santo (ES)", "Goiás (GO)", "Maranhão (MA)",
      "Mato Grosso (MT)", "Mato Grosso do Sul (MS)", "Minas Gerais (MG)", "Pará (PA)",
      "Paraíba (PB)", "Paraná (PR)", "Pernambuco (PE)", "Piauí (PI)", "Rio de Janeiro (RJ)",
      "Rio Grande do Norte (RN)", "Rio Grande do Sul (RS)", "Rondônia (RO)", "Roraima (RR)",
      "Santa Catarina (SC)", "São Paulo (SP)", "Sergipe (SE)", "Tocantins (TO)", "Estrangeiro"
    ]
  },
  {
    text: "2.5 - Você mora ou já morou na periferia?",
    response_type: "radio",
    options: ["Não", "Sim e ainda moro", "Sim, mas não moro mais"]
  },
  {
    text: "2.6 - Qual sua identidade de gênero?",
    response_type: "radio",
    options: [
      "Mulher Cis",
      "Homem Cis",
      "Mulher Trans",
      "Homem Trans",
      "Não-binário",
      "Outros",
      "Prefiro não responder"
    ]
  },
  {
    text: "2.7 - Qual a sua orientação sexual?",
    response_type: "radio",
    options: [
      "Heterossexual",
      "Homossexual",
      "Bissexual",
      "Assexual",
      "Pansexual",
      "Outro",
      "Prefiro não responder"
    ]
  },
  {
    text: "2.8 - Qual a sua cor/etnia?",
    response_type: "radio",
    options: [
      "Cor branca",
      "Cor amarela (de origem oriental)",
      "Cor parda",
      "Cor preta",
      "Etnia indígena",
      "Outro",
      "Prefiro não responder"
    ]
  },
  {
    text: "2.9 - Qual sua Renda Total Familiar?",
    response_type: "radio",
    options: [
      "Abaixo de 2 Salários Mínimos (R$ 3.036,00)",
      "De 2 a 4 Salários Mínimos (R$ 3.036,01 a R$ 6.072,00)",
      "De 4 a 10 Salários Mínimos (R$ 6.072,01 a R$ 15.180,00)",
      "De 10 a 20 Salários Mínimos (R$ 15.180,01 a R$ 30.360,00)",
      "Acima de 20 Salários Mínimos (R$ 30.360,01 ou mais)"
    ]
  },
  {
    text: "2.10 - Você possui outra fonte de renda?",
    response_type: "radio",
    options: ["Sim", "Não"]
  },
  {
    text: "2.11 - Você tem algum problema de saúde? (Pode marcar mais de uma opção)",
    response_type: "multiple",
    options: [
      "Não",
      "Sim, pressão alta",
      "Sim, colesterol alto",
      "Sim, diabetes",
      "Sim, obesidade",
      "Sim, perda auditiva",
      "Sim, coração",
      "Sim, de coluna",
      "Sim, psicológico",
      "Sim, dor/inflamação membros superiores",
      "Sim, dor/inflamação membros inferiores"
    ]
  },
  {
    text: "2.12 - Você sente ou sofreu algum tipo de discriminação e/ou preconceito no seu ambiente de trabalho?",
    response_type: "radio",
    options: ["Sim", "Não", "Prefiro não responder"]
  },
  {
    text: "2.13 - Qual(is) fator(es) você atribui como o(s) mais impactante(s) para o seu dia a dia?",
    response_type: "multiple",
    options: [
      "Pressões e prazos no trabalho",
      "Liderança e forma de trabalho",
      "Finanças pessoais",
      "Relacionamentos familiares e conjugais",
      "Outros (exemplifique)",
      "Prefiro não responder"
    ]
  },
  {
    text: "2.14 - Como você se locomove de casa para o trabalho?",
    response_type: "radio",
    options: [
      "Carro",
      "Moto",
      "Ônibus",
      "Metrô",
      "Bicicleta",
      "A pé",
      "Carona",
      "Outros"
    ]
  },
  {
    text: "2.15 - Quanto tempo você leva no deslocamento casa x trabalho?",
    response_type: "radio",
    options: [
      "Até 10min",
      "Até 20min",
      "Até 40min",
      "Até 60min",
      "Acima de 60min"
    ]
  }
]

censo_questions.each do |q|
  Question.create!(
    text: q[:text],
    category: "Censo",
    response_type: q[:response_type],
    options: q[:options]
  )
end

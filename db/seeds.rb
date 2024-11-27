# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


questions = [
"1.1 - Meu/minha líder confia em mim e me dá autonomia para desempenhar meu trabalho.",
"1.2 - Meu/minha líder sempre conversa comigo sobre como estou trabalhando.",
"1.3 - Minha liderança me auxilia e orienta em busca dos resultados DPO/VPO.",
"1.4 - O(a) gerente desta operação é presente, acessível e atento aos problemas.",
"2.1 - As pessoas da minha área seguem todas as regras e procedimentos de segurança.",
"2.2 - São disponibilizados EPIs e treinamentos para que eu realize meu trabalho com segurança.",
"2.3 - Minha unidade é um lugar seguro para trabalhar.",
"3.1 - Minha unidade está sempre limpa e os ambientes bem conservados.",
"3.2 - As áreas em comum (refeitório, sala de matinal, banheiros, vestiários, armários etc.), estão sempre limpas e bem conservadas.",
"3.3 - Sempre encontro materiais disponíveis para uso pessoal nas áreas (copos descartáveis, papel higiênico, sabonete etc.)",
"3.4 - Os equipamentos disponíveis (caminhões, empilhadeiras, paleteiras, celular etc.) são novos e bem conservados.",
"3.5 - Os chamados para melhoria no ambiente de trabalho são concluídos e divulgados.",
"4.1 - Esta empresa investe nas pessoas e reconhece aquelas que se destacam.",
"4.2 - Sou reconhecido(a) quando faço um bom trabalho.",
"4.3 - O programa de reconhecimento realmente premia os melhores resultados.",
"4.4 - Nesta empresa, celebramos momentos e eventos especiais.",
"5.1 - Recebo treinamentos para meu desenvolvimento profissional.",
"5.2 - Os treinamentos recebidos para a realização das minhas atividades são suficientes.",
"5.3 - Sei utilizar corretamente todas as ferramentas tecnológicas no trabalho que executo.",
"5.4 - Faço bom uso das minhas habilidades na minha função atual.",
"5.5 - Eu tenho impacto direto no alcance das minhas metas.",
"5.6 - Eu entendo como o meu desempenho é avaliado no Ciclo de Gente.",
"6.1 - Nesta empresa as responsabilidades e atividades são distribuídas de forma equilibrada entre os colaboradores.",
"6.2 - Sempre consigo executar minhas atividades dentro do tempo previsto e raramente excedo a minha jornada de trabalho.",
"6.3 - Consigo manter um equilíbrio entre minha vida pessoal e trabalho.",
"6.4 - Meu banco de horas é bem gerenciado e as folgas são comunicadas com antecedência.",
"6.5 - Consigo planejar minhas férias de forma que não haja prejuízo para mim ou para a empresa.",
"7.1 - Estou satisfeito(a) com a remuneração que recebo aqui.",
"7.2 - Estou satisfeito(a) com os benefícios que recebo aqui.",
"7.3 - Entendo como funciona a Remuneração Variável e acho a justa a forma de cálculo.",
"7.4 - Consulto minha RV com frequência, pois o terminal está sempre atualizado e correto.",
"7.5 - Eu confio no meu pagamento, pois ele sempre é realizado corretamente.",
"7.6 - Eu continuaria trabalhando aqui, mesmo que recebesse uma proposta de trabalho com mesma remuneração e benefícios.",
"8.1 - Esta empresa consegue transmitir - na prática - sua missão, visão e valores.",
"8.2 - Eu me sinto motivado(a) com a missão, a visão e os valores desta empresa.",
"8.3 - Meu trabalho desempenha papel fundamental na realização do sonho da empresa.",
"8.4 - Esta empresa atua de forma ética e transparente na relação com seus colaboradores, clientes, fornecedores, meio ambiente e sociedade.",
"8.5 - Gosto do meu trabalho e me identifico com esta empresa.",
"8.6 - Considero esta empresa um bom lugar para trabalhar.",
"9.1 - Estou bem informado(a) sobre os planos e processos da empresa, pois existe uma boa comunicação interna.",
"10.1 - Eu sinto que os líderes e colegas se preocupam em nos ouvir e nos apoiar no dia-a-dia.",
"10.2 - Me sinto seguro(a) para falar sobre minhas opiniões e me expressar.",
"10.3 - Se vejo algo errado, me sinto confortável e motivado(a) para agir no momento e corrigir.",
"10.4 - Este é um lugar emocionalmente saudável para trabalhar.",
"10.5 - Os colaboradores são tratados igualmente e de forma justa independente do gênero, idade, raça, deficiência, religião, orientação sexual ou condição social.",
"10.6 - O canal de ouvidoria é confiável.",
"1.1 - Você é uma pessoa com deficiência?",
"2.1 - Qual a sua escolaridade?",
"2.2 - Estado civil",
"2.3 - Tem filhos ou dependentes socioafetivos? Se sim, quantos você tem?",
"3.1 - Onde você nasceu?",
"4.1 - Qual é a sua situação de moradia atual?",
"4.2 - Quantas pessoas moram com você?",
"4.3 - Você mora ou já morou na periferia?",
"5.1 - Você se identifica como?",
"5.2 - Qual a sua orientação sexual?",
"5.3 - Qual a sua cor/etnia?",
"6.1 - Qual sua Renda Total Familiar?",
"6.2 - Além de você, quais integrantes da família trabalham?",
"6.3 - Você possui outra fonte de renda?",
"7.1 - Você sente ou sofreu algum tipo de discriminação e/ou preconceito no seu ambiente de trabalho? Se sim, qual?",
"7.2 - Qual(is) fator(es) você atribui como o(s) mais impactante(s) para o seu dia a dia?",
"8.1 - Você tem algum problema de saúde? (Pode marcar mais de uma opção, se for o caso)",
"9.1 - Como você se locomove de casa para o trabalho?",
"9.2 - Quanto tempo você leva no deslocamento casa x trabalho"
]

questions.each do |question_text|
  Question.create(text: question_text)
end

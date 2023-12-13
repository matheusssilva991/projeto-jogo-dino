Jogo = Classe:extend()

function Jogo:new()
   local personagens_sorteados = SorteaDino()
   Dino_1 = Dino(personagens_sorteados[1], 0, (LARGURA_TELA / 2), {"a", "d"})
   Dino_2 = Dino(personagens_sorteados[2], (LARGURA_TELA / 2), LARGURA_TELA, {"left", "right"})
   Fonte = love.graphics.newFont("/recursos/fonte/Kaph-Regular.ttf", 18)
   love.graphics.setFont(Fonte)

   Fundo = Fundo()

   Lista_meteoros_1 = {}
   Lista_meteoros_2 = {}
   Tempo_meteoro = 0
   Sorte_1 = 1
   Sorte_2 = 1

   Tempo_jogo = 0
end

function love.update(dt)
   if Tempo_jogo <= 30 and Dino_1.pontuacao > 0 and Dino_2.pontuacao > 0 then
      Dino_1:update(dt)
      Dino_2:update(dt)

      Tempo_meteoro = Tempo_meteoro + dt

      if Tempo_meteoro > 0.20 - dt then
         Sorte_meteoro(Lista_meteoros_1, 0, LARGURA_TELA / 2 - 24)
         Sorte_meteoro(Lista_meteoros_2, LARGURA_TELA / 2, LARGURA_TELA - 24)

         Tempo_meteoro = 0
      end

      AtualizaMeteoro(Lista_meteoros_1, Dino_1, dt)
      AtualizaMeteoro(Lista_meteoros_2, Dino_2, dt)

      Tempo_jogo = Tempo_jogo + dt
   end
end
  
function love.draw()
   Fundo:draw()
   Dino_1:draw()
   Dino_2:draw()
  
   DesenhaMeteoro(Lista_meteoros_1)
   DesenhaMeteoro(Lista_meteoros_2)

   love.graphics.print("Tempo: " .. math.floor(Tempo_jogo), 10, 30)
   love.graphics.print("Tempo: " .. math.floor(Tempo_jogo), (LARGURA_TELA / 2) + 10, 30)

   if  Dino_1.pontuacao == 0 then
      love.graphics.print("Parabens, Jogador 2 Ganhou!!!", (LARGURA_TELA / 2) + 10, ALTURA_TELA / 2)
   elseif Dino_2.pontuacao == 0 then
      love.graphics.print("Parabens, Jogador 1 Ganhou!!!", 10, ALTURA_TELA / 2)
   elseif Tempo_jogo > 30 then
      if Dino_1.pontuacao > Dino_2.pontuacao then
         love.graphics.print("Parabens, Jogador 1 Ganhou!!!", 10, ALTURA_TELA / 2)
      elseif Dino_2.pontuacao > Dino_1.pontuacao then
         love.graphics.print("Parabens, Jogador 2 Ganhou!!!", (LARGURA_TELA / 2) + 10, ALTURA_TELA / 2)
      else
         love.graphics.print("Empate!!!", (LARGURA_TELA / 2) - 60, ALTURA_TELA / 2)
      end
   end
end

function VerificaColisao(A, B)      
   if A.x <= B.x + B.largura and
       A.x + A.largura >= B.x and 
       A.y <= B.y + B.altura and 
       A.y + A.altura >= B.y then
          return true
   end
end

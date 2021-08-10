Algoritmo "LiberSoft_v.0.0.2"
Var

   nome : vetor [0..2] de caracter
   senha : vetor [0..2] de caracter
   cpf : vetor [0..2] de caracter

   livro : vetor[0..2] de caracter
   tempoRestante : vetor[0..2] de inteiro

   opcao, x, renovaLivro, usuario : inteiro
   novaSenha, novaSenhaConfirmacao : caracter
   tentativaLogin, tentativaSenha : caracter
   confirmacao, login, tentativa : logico

Inicio

   nome[0] := "raul"
   nome[1] := "lays"
   nome[2] := "david"

   senha[0] := "a123"
   senha[1] := "b123"
   senha[2] := "c123"

   cpf[0] := "11111111199"
   cpf[1] := "99999999911"
   cpf[2] := "12345678900"

   livro[0] := "As Crônicas de Nárnia"
   livro[1] := "Harry Potter"
   livro[2] := "O Guia do Mochileiro das Galáxias"

   tempoRestante[0] := 7
   tempoRestante[1] := 4
   tempoRestante[2] := 3

   repita
      limpatela()
      escreval("****** LIBERSOFT ******")
      escreval("1 - Login")
      escreval("2 - Work in progress")
      escreval("3 - Sair")
      leia(opcao)

      escolha opcao
      caso 1
         escreva("Login: ")
         leia(tentativaLogin)
         escreva("Senha: ")
         leia(tentativaSenha)

         para x de 0 ate 2 faca
            se (tentativaLogin = nome[x]) ou (tentativaLogin = cpf[x]) entao
               tentativa := Verdadeiro
               se tentativaSenha = senha[x] entao
                  login := Verdadeiro
                  usuario := x
                  interrompa()
               senao
                  tentativa := Falso
               fimse
            fimse
         fimpara

         se tentativa = falso entao
            escreval()
            escreval("Login ou senha inválido(s).")
            escreval()
            escreval("Aperte F9 para voltar ao menu anterior.")
            pausa()
         fimse

      caso 2

      outrocaso

      fimescolha


      se login entao
         repita
            limpatela()

            escreval("Olá, ", nome[usuario], "!")
            escreval()
            escreval("****** LIBERSOFT ******")
            escreval("1 - Consulta Livros")
            escreval("2 - Renovação")
            escreval("3 - Alterar Senha")
            escreval("4 - Pular 1 dia")
            escreval("5 - Sair")
            leia(opcao)

            escolha opcao
            caso 1

               escreval()
               escreval("Seus livros emprestados são:")
               para x de 0 ate 2 faca
                  se tempoRestante[x] < 0 entao
                     escreval("- ", livro[x], " -", abs(tempoRestante[x]), " dia(s) atrasado(s).")
                  senao
                     se tempoRestante[x] = 0 entao
                        escreval("- ", livro[x], " - O tempo expira hoje.")
                     senao
                        escreval("- ", livro[x], " -", tempoRestante[x], " dia(s) restante(s).")
                     fimse
                  fimse
               fimpara

               escreval()
               escreval("Aperte F9 para voltar a tela inicial")
               pausa()

            caso 2

               escreval()
               escreval("Digite o número do livro a ser renovado:")
               para x de 0 ate 2 faca
                  escreval(x + 1, " - ", livro[x])
               fimpara

               leia(renovaLivro)
               se tempoRestante[renovaLivro -1] < 4 entao
                  tempoRestante[renovaLivro - 1] := tempoRestante[renovaLivro - 1] + 7
                  escreval()
                  escreval("O empréstimo do título '", livro[renovaLivro - 1], "'")
                  escreval("foi renovado.")
                  escreval("Agora você tem", tempoRestante[renovaLivro - 1], " dias restantes.")
                  escreval()
                  escreval("Aperte F9 para voltar a tela inicial")
                  pausa()
               senao
                  escreval()
                  escreval("O empréstimo precisa estar a menos de")
                  escreval("4 dias restantes para poder ser renovado.")
                  escreval()
                  escreval("Aperte F9 para voltar a tela inicial")
                  pausa()
               fimse

            caso 3

               enquanto confirmacao = Falso faca

                  escreval()
                  escreval("Digite sua nova senha:")
                  leia(novaSenha)
                  escreval("Digite novamente para confirmar:")
                  leia(novaSenhaConfirmacao)

                  se novaSenha = novaSenhaConfirmacao entao
                     senha[usuario] := novaSenha
                     escreval("Sua senha foi alterada.")
                     confirmacao := Verdadeiro
                  senao
                     escreval("As senhas não correspondem.")
                  fimse

               fimenquanto

            caso 4
               para x de 0 ate 2 faca
                  tempoRestante[x] := tempoRestante[x] - 1
               fimpara
            caso 5
               login := Falso
               tentativa := Falso
            outrocaso
               escreval("Opção inválida, tente novamente.")

            fimescolha

         ate opcao = 5
      fimse
   ate opcao = 3
Fimalgoritmo

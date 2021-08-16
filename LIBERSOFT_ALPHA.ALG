Algoritmo "LiberSoft_v0.0.5"
Var

   nome : vetor [0..2] de caracter
   senha : vetor [0..2] de caracter
   cpf : vetor [0..2] de caracter
   usuario : vetor [0..2] de inteiro

   livro : vetor[0..2,0..2] de caracter
   tempoRestante : vetor[0..2,0..2] de inteiro
   tipoUsuario : vetor[0..2] de caracter

   opcao, contador, renovaLivro, usuarioAtual : inteiro
   tentativaLogin, tentativaSenha, tentativaUsuario : caracter
   confirmacao, login, tentativa : logico
   //              dados do bibliotecario
   nomeBibliotecario : vetor [0..2] de caracter
   senhaBibliotecario : vetor [0..2] de caracter
   cpfBibliotecario : vetor [0..2] de caracter

procedimento menu_aluno()
inicio

   repita
      escreval("Olá, ", nome[usuarioAtual], "!")
      escreval()
      escreval("** LIBERSOFT **")
      escreval("1 - Consulta Livros")
      escreval("2 - Renovação")
      escreval("3 - Alterar Senha")
      escreval("4 - Pular 1 dia (EXEMPLO)")
      escreval("5 - Sair")
      leia(opcao)

      escolha opcao
      caso 1

         escreval()
         escreval("Seus livros emprestados são:")
         para contador de 0 ate 2 faca
            se tempoRestante[contador] < 0 entao
               escreval("- ", livro[contador, usuarioAtual], " -", abs(tempoRestante[contador]), " dia(s) atrasado(s).")
            senao
               se tempoRestante[contador] = 0 entao
                  escreval("- ", livro[contador, usuarioAtual], " - O tempo expira hoje.")
               senao
                  escreval("- ", livro[contador, usuarioAtual], " -", tempoRestante[contador], " dia(s) restante(s).")
               fimse
            fimse
         fimpara

         escreval()
         escreval("Aperte F9 para voltar a tela inicial")
         pausa()
         limpatela()

      caso 2

         escreval()
         escreval("Digite o número do livro a ser renovado:")
         para contador de 0 ate 2 faca
            escreval(contador + 1, " - ", livro[contador, usuarioAtual])
         fimpara

         leia(renovaLivro)
         se tempoRestante[renovaLivro - 1, usuarioAtual] < 4 entao
            tempoRestante[renovaLivro - 1, usuarioAtual] := tempoRestante[renovaLivro - 1, usuarioAtual] + 7
            escreval()
            escreval("O empréstimo do título '", livro[renovaLivro - 1, usuarioAtual], "'")
            escreval("foi renovado.")
            escreval("Agora você tem", tempoRestante[renovaLivro - 1, usuarioAtual], " dias restantes.")
            escreval()
            escreval("Aperte F9 para voltar a tela inicial")
            pausa()
            limpatela()
         senao
            escreval()
            escreval("O empréstimo precisa estar a menos de")
            escreval("4 dias restantes para poder ser renovado.")
            escreval()
            escreval("Aperte F9 para voltar a tela inicial")
            pausa()
            limpatela()
         fimse

      caso 3
         senha[usuarioAtual] := alterar_senha(senha[usuarioAtual])

      caso 4
         para contador de 0 ate 2 faca
            tempoRestante[contador, usuarioAtual] := tempoRestante[contador, usuarioAtual] - 1
         fimpara
         limpatela()
      caso 5
         login := Falso
         tentativa := Falso
         limpatela()
      outrocaso
         limpatela()
         escreval("Opção inválida, tente novamente.")
         escreval()

      fimescolha

   ate opcao = 5

fimprocedimento

procedimento menu_bibliotecario()
inicio

   repita
      limpatela()

      escreval("Olá, ", nome[usuarioAtual], "!")
      escreval()
      escreval("* LIBERSOFT *")
      escreval("1 - Acervo")
      escreval("2 - Cadastrar Aluno")
      escreval("3 - Adicionar Livros")
      escreval("4 - Excluir Livros")
      escreval("5 - Sair")
      leia(opcao)

      escolha opcao
      caso 1
         escreval("Todos os livros do acervo")
         escreval(livro[0])
         escreval(livro[1])
         escreval(livro[2])
         pausa()
         
      caso 2
         escreval("Digite o nome do aluno:")
         leia(nome[contador])
         escreval("Digite a matricula:")
         leia(senha[contador])
         escreval("Digite o cpf:")
         leia(cpf[contador])
         escreval()
         escreval("Aluno cadastrado!")
         escreval("Aperte F9 para voltar ao menu")
         pausa()

      caso 3
         escreval("Add novos livros")
         escreval("Digite o titulo do livro:")
         leia(titulo)
         escreval("Nome do autor: ")
         leia(nomeAutor)
         escreval("Digite a quantidade de exemplares:")
         leia(qtdExemplares)

      caso 5
         login := Falso
         tentativa := Falso
         limpatela()
         
      outrocaso
      limpatela()
         escreval("Opção inválida, tente novamente.")
         escreval()
         
      fimescolha
      
   ate opcao = 5
   
fimprocedimento

funcao alterar_senha(senhaSolicitada : caracter) : caracter
var
novaSenha, novaSenhaConfirmacao : caracter
inicio
   enquanto Verdadeiro faca

      escreval()
      escreval("Digite sua nova senha:")
      leia(novaSenha)
      
      escreval("Digite novamente para confirmar:")
      leia(novaSenhaConfirmacao)

      se novaSenha = novaSenhaConfirmacao entao
         escreval("Sua senha foi alterada.")
         escreval()
         escreval("Aperte F9 para voltar ao menu")
         pausa()
         limpatela()
         retorne novaSenha
         interrompa()
      senao
         escreval("As senhas não correspondem.")
         escreval()
         escreval("Aperte F9 para voltar ao menu")
         pausa()
         limpatela()
         retorne senhaSolicitada
         interrompa()
      fimse

   fimenquanto
   
fimfuncao

Inicio
   // USUARIOS

   tipoUsuario[0] := "aluno"
   tipoUsuario[1] := "bibliotecario"
   tipoUsuario[2] := "adm"

   nome[0] := "raul"
   nome[1] := "lays"
   nome[2] := "david"

   senha[0] := "a123"
   senha[1] := "b123"
   senha[2] := "c123"

   cpf[0] := "11111111199"
   cpf[1] := "99999999911"
   cpf[2] := "12345678900"

   usuario[0] := 0
   usuario[1] := 1
   usuario[2] := 2

   nomeBibliotecario[0] := "Lauanne Catarine"
   nomeBibliotecario[1] := "Alvaro"
   nomeBibliotecario[2] := "Milene Alexandre"

   senhaBibliotecario[0] := "bibi321"
   senhaBibliotecario[1] := "123bolinho"
   senhaBibliotecario[2] := "123Lasanha"

   cpfBibliotecario[0] := "88888888888"
   cpfBibliotecario[1] := "55566611122"
   cpfBibliotecario[2] := "77775556665"

   // LIVROS

   livro[0, 0] := "As Crônicas de Nárnia"
   livro[1, 0] := "Harry Potter"
   livro[2, 0] := "O Guia do Mochileiro das Galáxias"

   tempoRestante[0, 0] := 7
   tempoRestante[1, 0] := 4
   tempoRestante[2, 0] := 3

   // ---------------------------------

   repita
      escreval("** LIBERSOFT **")
      escreval("1 - Login")
      escreval("2 - Sair")
      leia(opcao)

      escolha opcao
      caso 1
         escreva("Login: ")
         leia(tentativaLogin)
         escreva("Senha: ")
         leia(tentativaSenha)

         para contador de 0 ate 2 faca
            se (tentativaLogin = nome[contador]) ou (tentativaLogin = cpf[contador]) entao
               tentativa := Verdadeiro
               se tentativaSenha = senha[contador] entao
                  login := Verdadeiro
                  usuarioAtual := contador
                  limpatela()
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
            limpatela()
         fimse

      caso 2
         limpatela()
         escreval("Até a próxima!")
         interrompa()

      outrocaso
         limpatela()
         escreval("Opção inválida, tente novamente.")
         escreval()

      fimescolha

      se login entao
         escolha usuario[usuarioAtual]
         caso 0
            menu_aluno()
         caso 1
            menu_bibliotecario()
         caso 2
            escreval("MEU CU CARALHO")
         fimescolha
      fimse

   ate opcao = 2

Fimalgoritmo

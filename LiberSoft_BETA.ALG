Algoritmo "LiberSoft_BETA"
Var
   // informações do usuário
   nome : vetor [0..3] de caracter
   senha : vetor [0..3] de caracter
   cpf : vetor [0..3] de caracter

   // tipos de usuario
   tipoUsuario : vetor[0..3] de inteiro

   // variáveis para consulta
   consulta : caracter

   // cadastro de usuario
   cadastroNome : caracter
   cadastroCpf : caracter

   // informações dos livros
   livro : vetor[0..3,0..3] de caracter
   tempoRestante : vetor[0..3,0..3] de inteiro

   opcao, contador, renovaLivro, usuarioAtual, linha, coluna : inteiro
   tentativaLogin, tentativaSenha, tentativaUsuario : caracter
   confirmacao, login, tentativa, cadastro : logico

procedimento menu_aluno()
inicio

   repita
      escreval("Olá, ", nome[usuarioAtual], "!")
      escreval()
      escreval("** LIBERSOFT **")
      escreval("1 - Meus Livros")
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
            se tempoRestante[contador, usuarioAtual] < 0 entao
               escreval("- ", livro[contador, usuarioAtual], " -", abs(tempoRestante[contador, usuarioAtual]), " dia(s) atrasado(s).")
            senao
               se tempoRestante[contador, usuarioAtual] = 0 entao
                  escreval("- ", livro[contador, usuarioAtual], " - O tempo expira hoje.")
               senao
                  escreval("- ", livro[contador, usuarioAtual], " -", tempoRestante[contador, usuarioAtual], " dia(s) restante(s).")
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
      escreval("1 - Todos os Livros")
      escreval("2 - Gerenciar Alunos")
      escreval("3 - Gerenciar Livros [NOT WORKING]")
      escreval("4 - Alterar Senha")
      escreval("5 - Sair")
      leia(opcao)

      escolha opcao
      caso 1
         // escreve todos os elementos preenchidos da matriz livro[,]
         escreval("Todos os livros da biblioteca:")
         escreval()
         para coluna de 0 ate 3 faca
            para linha de 0 ate 3 faca
               se livro[linha, coluna] <> "" entao
                  escreval("- ", livro[linha, coluna])
                  // AQUI
                  escreval()
               fimse
            fimpara
         fimpara

         escreval("Aperte F9 para voltar ao menu")
         pausa()

      caso 2
         repita
            limpatela()
            para contador de 0 ate 3 faca
               se (tipoUsuario[contador] = 0) e (nome[contador] <> "") entao
                  escreval("ID Usuário:", contador)
                  escreval("Nome: ", nome[contador])
                  escreval("CPF: ", cpf[contador])
                  escreval()
               fimse
            fimpara

            escreval("Ações:")
            escreval("1 - Modificar Aluno")
            escreval("2 - Adicionar Aluno")
            escreval("3 - Remover Aluno")
            escreval("4 - Sair")
            leia(opcao)

            limpatela()

            escolha opcao
            caso 1
               // modificar aluno
               escreval("Modificar Cadastro do Aluno")
               escreval()
               escreval("Digite o CPF do aluno:")
               leia(consulta)

               confirmacao := Falso
               escreval()
               para contador de 0 ate 3 faca
                  se (consulta = cpf[contador]) e (tipoUsuario[contador] = 0) entao
                     confirmacao := Verdadeiro
                     escreval("ID Usuário:", contador)
                     escreval("Nome: ", nome[contador])
                     escreval("CPF: ", cpf[contador])
                     escreval()
                     interrompa()
                  fimse
               fimpara

               se confirmacao entao
                  escreval("1 - Alterar Nome")
                  escreval("2 - Alterar CPF")
                  escreval("3 - Redefinir Senha")
                  escreval("4 - Sair")
                  leia(opcao)

                  escreval()
                  escolha opcao
                  caso 1
                     escreval("Digite o novo nome para o usuário:")
                     nome[contador] := alterar_nome(nome[contador])

                  caso 2
                     escreval("Digite o novo CPF para o usuário:")
                     cpf[contador] := alterar_cpf(cpf[contador])

                  caso 3
                     senha[contador] := copia(cpf[contador], 1, 6)
                     escreval("A senha foi redefinida para o padrão.")
                     escreval("Aperte F9 para voltar ao menu")
                     pausa()

                  caso 4
                     opcao := 0
                  fimescolha
               senao
                  escreval("CPF não cadastrado ou usuário sem permissão.")
                  escreval("Aperte F9 para voltar ao menu")
                  pausa()
               fimse

            caso 2
               // adicionar aluno
               escreval("Adicionar Cadastro de Aluno")
               escreval()
               escreval("Digite o nome do aluno:")
               leia(cadastroNome)
               escreval("Digite o CPF do aluno:")
               leia(cadastroCpf)

               cadastro := Verdadeiro

               se compr(cadastroCpf) <> 11 entao
                  escreval()
                  escreval("O CPF precisa ter 11 dígitos.")
               senao
                  para contador de 0 ate 3 faca
                     se cadastroCpf = cpf[contador] entao
                        cadastro := Falso
                        interrompa()
                     fimse
                  fimpara

                  se cadastro entao
                     para contador de 0 ate 3 faca
                        se nome[contador] = "" entao
                           nome[contador] := cadastroNome
                           cpf[contador] := cadastroCpf
                           senha[contador] := copia(cadastroCpf, 1, 6)
                           tipoUsuario[contador] := 0
                           interrompa()
                        fimse
                     fimpara
                     escreval()
                     escreval("Aluno cadastrado com sucesso.")
                  senao
                     escreval()
                     escreval("CPF já cadastrado.")
                  fimse
               fimse

               escreval("Aperte F9 para voltar ao menu")
               pausa()
               opcao := 0

            caso 3
               // remover aluno
               escreval("Remover Cadastro de Aluno")
               escreval()
               escreval("Digite o CPF do aluno:")
               leia(consulta)

               confirmacao := Falso
               escreval()
               para contador de 0 ate 3 faca
                  se (cpf[contador] = consulta) e (tipoUsuario[contador] = 0) entao
                     nome[contador] := ""
                     cpf[contador] := ""
                     senha[contador] := ""
                     confirmacao := Verdadeiro
                  fimse
               fimpara

               se confirmacao entao
                  escreval("Aluno removido com sucesso.")
               senao
                  escreval("Aluno não existe ou usuário sem permissão.")
               fimse
               escreval("Aperte F9 para voltar ao menu")
               pausa()

               opcao := 0

            fimescolha

         ate opcao = 4

      caso 3
         // gerenciar livros
      caso 4
         // alterar senha
         senha[usuarioAtual] := alterar_senha(senha[usuarioAtual])
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

funcao alterar_nome(nomeAntigo : caracter) : caracter
var
   novoNome : caracter
inicio
   escreval("Digite SAIR para cancelar.")
   leia(novoNome)

   se minusc(novoNome) = "sair" entao
      retorne nomeAntigo
   senao
      retorne novoNome
   fimse

fimfuncao

funcao alterar_cpf(cpfAntigo : caracter) : caracter
var
   novoCpf : caracter
   confirmaCpf : logico
inicio

   escreval("Digite SAIR para cancelar.")
   leia(novoCpf)

   escreval()

   se minusc(novoCpf) = "sair" entao
      retorne cpfAntigo
   senao
      se compr(novoCpf) <> 11 entao
         escreval("O CPF precisa ter 11 dígitos.")
         retorne cpfAntigo
      senao
         confirmaCpf := Verdadeiro
         para contador de 0 ate 3 faca
            se cpf[contador] = novoCpf entao
               confirmaCpf := Falso
            fimse
         fimpara

         se confirmaCpf entao
            escreval("CPF alterado com sucesso.")
            retorne novoCpf
         senao
            escreval("CPF não foi alterado.")
            escreval("Motivo: CPF já cadastrado.")
            retorne cpfAntigo
         fimse
      fimse
   fimse

   escreval("Aperte F9 para voltar ao menu")
   pausa()

fimfuncao

Inicio
   // USUARIOS

   nome[0] := "adm"
   nome[1] := "lays"
   nome[2] := ""
   nome[3] := ""


   senha[0] := "123"
   senha[1] := "124484"
   senha[2] := ""
   senha[3] := ""

   cpf[0] := "70278002412"
   cpf[1] := "12448437416"
   cpf[2] := ""
   cpf[3] := ""

   tipoUsuario[0] := 1
   tipoUsuario[1] := 0
   tipoUsuario[2] := 0
   tipoUsuario[3] := 0

   // LIVROS

   livro[0, 1] := "Sniper de Elite"
   livro[1, 1] := "À Espera de um Milagre"
   livro[2, 1] := "O Universo numa Casca de Noz"

   tempoRestante[0, 1] := 0
   tempoRestante[1, 1] := 3
   tempoRestante[2, 1] := 2

   livro[0, 2] := "As Crônicas de Nárnia"
   livro[1, 2] := "Harry Potter"
   livro[2, 2] := "O Guia do Mochileiro das Galáxias"

   tempoRestante[0, 2] := 7
   tempoRestante[1, 2] := 4
   tempoRestante[2, 2] := 3

   livro[0, 3] := "A Sutil Arte de Ligar o Foda-se"
   livro[1, 3] := "O Diário de um Banana"
   livro[2, 3] := "Arte da Guerra"

   tempoRestante[0, 3] := 2
   tempoRestante[1, 3] := 10
   tempoRestante[2, 3] := 1

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

         // validação de login
         para contador de 0 ate 3 faca
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

         // retorno se login falhar
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

      // redirecionamento após login efetuado
      se login entao
         escolha tipoUsuario[usuarioAtual]
         caso 0
            menu_aluno()
         caso 1
            menu_bibliotecario()
         fimescolha
      fimse

   ate opcao = 2

Fimalgoritmo

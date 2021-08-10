Algoritmo "libersoft_ALPHA"
Var
   nome  : vetor [0..2] de caracter
   senha : vetor [0..2] de caracter
   cpf   : vetor [0..2] de real

   livro : vetor[0..2] de caracter

   opcao, x, renovaLivro, usuario : inteiro
   novaSenha, novaSenhaConfirmacao : caracter
   confirmacao : logico
Inicio

   nome[0] := "raul"
   nome[1] := "lays"
   nome[2] := "david"

   senha[0] := "a123"
   senha[1] := "b123"
   senha[2] := "c123"

   cpf[0] := 11111111199
   cpf[1] := 99999999911
   cpf[2] := 12345678900

   livro[0] := "As Crônicas de Nárnia"
   livro[1] := "Harry Potter"
   livro[2] := "O Guia do Mochileiro das Galáxias"

   usuario := 0
   
   repita
      limpatela()

      escreval("****** LIBERSOFT ******")
      escreval("1 - Consulta Livros")
      escreval("2 - Renovação")
      escreval("3 - Alterar Senha")
      escreval("4 - Sair")
      leia(opcao)

      escolha opcao
      caso 1

         escreval()
         escreval("Seus livros emprestados são:")
         para x de 0 ate 2 faca
            escreval("- ", livro[x], " - 7 dias restantes")
         fimpara

         escreval()
         escreval("Aperte F9 para voltar a tela inicial")
         pausa()

      caso 2

         escreval()
         escreval("Digite o número do livro a ser renovado:")
         para x de 0 ate 2 faca
            escreval(x + 1, "- ", livro[x])
         fimpara

         escreval()
         leia(renovaLivro)

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

      outrocaso

      fimescolha

   ate opcao = 4
Fimalgoritmo
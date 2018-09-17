# BuscarCEP

Nome: Caioby Aleixo Ripoli Fiochi

Componente

Esse componente foi desenvolvido para ser inserido dentro de uma page layout de conta, na qual será possível pegar o id do registro para inserir no
 endereço da conta. 
Para isso foi usado no implements do CMP o force:hasRecordId, que por meio de um atributo recordId salva o id do registro que o componente está.
Foram criados dois botões, sendo que um deles faz a chamada da integração passando o cep que deseja retornar e caso o retorno seja positivo, será
 exibido na tela campos com os dados do endereço. Esses campos o usuário poderia alterar alguma informação, caso seja necessário. O outro botão é
 para salvar os dados retornado da integração no endereço da conta.

Classes

A integração foi desenvolvida para ter o retorno de JSON.
Foi criado o request enviando o cep que deseja cadastrar e o response foi desserializa e inserido em uma classe wrapper. C classe wrapper foi 
criado para otimizar o código, evitando a criação de vários atributos para cada variável (cep, bairro...) no componente.
Foram feitas todas as classes de teste, além da mock da integração que garante a cobertura de teste.


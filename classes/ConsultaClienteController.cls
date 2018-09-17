public class ConsultaClienteController {

  @AuraEnabled
  public static ConsultaClienteController.wrapperclass getBuscarCEP(string aCep)
  {
   //Chama integração
   String lRetorno = ConsultaCliente.getProtocolo(aCep);
   //Caso tenha ocorrido um erro na integração, retorna mesagem de erro para o usuario na tela
   if(lRetorno.contains('Ocorreu'))
   {
     ConsultaClienteController.wrapperclass lWrapper = new ConsultaClienteController.wrapperclass();
     lWrapper.mensagem = lRetorno;
       
     return lWrapper;
   }
   else 
   {
     system.debug('JSON >> ' +  lRetorno);
     //desserializa o json e inseri dentro de um classe wrapper
     ConsultaClienteController.wrapperclass theresult = analisaJson(lRetorno); 
     return theresult;
   }
  }
    
  public static ConsultaClienteController.wrapperclass analisaJson(String json) {
    return (ConsultaClienteController.wrapperclass) System.JSON.deserialize(json, ConsultaClienteController.wrapperclass.class);
  }
  //a classe wrapper foi criado para otimizar o código, evitando a criação de vários  atributos para cada variável  no componente
  public class wrapperclass{
    @AuraEnabled public String cep {get;set;}
    @AuraEnabled public String logradouro {get;set;}
    @AuraEnabled public String complemento {get;set;}
    @AuraEnabled public String bairro {get;set;}
    @AuraEnabled public String localidade {get;set;}
    @AuraEnabled public String uf {get;set;}
    @AuraEnabled public String unidade {get;set;}
    @AuraEnabled public String ibge {get;set;}
    @AuraEnabled public String gia {get;set;} 
    @AuraEnabled public String mensagem {get;set;} 
  }
  //pega o id da conta que o usuario deseja cadastrar o endereço e inseri os dados nos campos de endereço da conta  
  @AuraEnabled
  public static String getSalvarEndereco(String aRecord,String aCep,String aLogradouro,String aComplemento,
                                       String aBairro,String aLocalidade,String aUf )
  {
    list<Account> lLstConta = new list<Account>();
    for(Account lConta : [SELECT Id,BillingCity, BillingState, BillingStreet, BillingPostalCode FROM Account WHERE Id = : aRecord])
    {

      if(lConta.BillingPostalCode != null) continue;

      lConta.BillingCity = aLocalidade;
      lConta.BillingState = aUf;
      lConta.BillingStreet = aLogradouro + ' ' + aBairro  + ' ' + aComplemento;
      lConta.BillingPostalCode = aCep;
      lLstConta.add(lConta);
    }
 
    if(!lLstConta.isEmpty())
    {
        database.update(lLstConta);
        return 'Cadastro de endereço realizado com sucesso!';
    }
    else
    {
      return 'Essa conta já possui endereço cadastrado!';   
    }
    
  }

}
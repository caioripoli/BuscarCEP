public class ConsultaCliente {
    
  private static final Http http = new Http();    
  
  @AuraEnabled
  public static string getProtocolo(string aCep)
  {
    //Cria o request da integração
    HttpRequest request = new HttpRequest();
    String lEndpoint = 'https://viacep.com.br/ws/' + aCep + '/json/';
      
    request.setEndpoint(lEndpoint);
    request.setMethod('GET');
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setTimeout(120000);
    //tratamento do retorno (JSON) 
    HttpResponse response = new HttpResponse();
    response = http.send(request);
    System.debug('Status CODE: '+response.getStatusCode());
    if (response.getStatusCode() != 400) {
      system.debug('retorno >>' +  response.getBody());
      return response.getBody();
    }
    else
    {
      return 'Ocorreu um erro - ' + response.getStatusCode() + '\nFavor entrar em contato com o Administrador';  
    }
        
  }


}
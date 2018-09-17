@isTest
global class HttpResponseConsultaClienteTest implements HttpCalloutMock{
  //Mock para classe de teste da integração
  //simula o retorno da integração com sucesso
  global HTTPResponse respond(HTTPRequest req)
  {
    HttpResponse res = new HttpResponse();
    res.setHeader('Content-Type', 'application/json');
    res.setBody('{'+
                 '"cep": "01415-001",'+
                 '"logradouro": "Rua Bela Cintra",'+
                 '"complemento": "até 585 - lado ímpar",'+
                 '"bairro": "Consolação",'+
                 '"localidade": "São Paulo",'+
                 '"uf": "SP",'+
                 '"unidade": "",'+
                 '"ibge": "3550308",'+
                 '"gia": "1004"'+
                '}');
    res.setStatusCode(200);
    return res;
  }

}
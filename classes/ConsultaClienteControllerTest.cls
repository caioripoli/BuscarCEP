@isTest
public class ConsultaClienteControllerTest {
    
  @isTest public static void BuscarCepTest() {
    test.startTest();
      Test.setMock(HttpCalloutMock.class, new HttpResponseConsultaClienteTest());
       ConsultaClienteController.wrapperclass l = ConsultaClienteController.getBuscarCEP('05416000');
    test.stopTest();
  }
    
  @isTest public static void salvarEenderecoTest() {
   
    Account lConta = new Account();
    lConta.Name = 'Nova conta'; 
    database.insert(lConta);
      
    test.startTest();
      ConsultaClienteController.getSalvarEndereco(lConta.Id,'05416-000','Rua Fradique Coutinho',
                                              'até 636 - lado par','"Pinheiros"','São Paulo','SP');
    test.stopTest();
      
  }

}
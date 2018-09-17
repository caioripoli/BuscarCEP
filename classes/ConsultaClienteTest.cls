@isTest
public class ConsultaClienteTest {
    //metodo de teste para cobrir a classe de integração
    @isTest public static void test() {
      test.startTest();
        Test.setMock(HttpCalloutMock.class, new HttpResponseConsultaClienteTest());
        String lResponse = ConsultaCliente.getProtocolo('05416000');
        system.assert(lResponse != null);
      test.stopTest();
  }
}
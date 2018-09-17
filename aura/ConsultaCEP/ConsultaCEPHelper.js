({
	consultarCEP : function(component) {
      //pegar valor do campo cep (input)
      var cep = document.getElementById("inpCep").value;
      console.log('CEP >> ' + cep);
      //metodo que vai ser chamado no controller
      var action = component.get("c.getBuscarCEP");

      action.setParams({
        aCep : cep
      });

      action.setCallback(this, function(a) {
          
      var state = a.getState();
    
      if(state === "SUCCESS") {
        var result = a.getReturnValue();
        console.dir(result);
        if(result.mensagem == null)
        {
          component.set("v.Abrir",true);
          component.set("v.dadoEndereco", result);
        }
        else
        {
         alert(result.mensagem);
        }
            
     }
     else if(state === "ERROR" || state === "INCOMPLETE")
     {
       var errors = response.getError();
   
       if (errors[0] && errors[0].message) this.showToast(component, 'info', errors[0].message);
     }
   });
   $A.enqueueAction(action);
		
  },
  
  salvarEndereco: function(component)
  {
    var cep = document.getElementById("inpCepR").value;
    var logradouro = document.getElementById("inpLogradouro").value;
    var complemento = document.getElementById("inpComplemento").value;
    var bairro = document.getElementById("inpBairro").value;
    var localidade = document.getElementById("inpLocalidade").value;
    var uf = document.getElementById("inpUf").value;
    var lRecord = component.get("v.recordId");
      
    var action = component.get("c.getSalvarEndereco");
    
    action.setParams({
      aRecord : lRecord,
      aCep : cep,
      aLogradouro : logradouro,
      aComplemento : complemento,
      aBairro : bairro,
      aLocalidade : localidade,
      aUf : uf
    });
    
    action.setCallback(this, function(a) {
          
    var state = a.getState();
    
    if(state === "SUCCESS") {
      var result = a.getReturnValue();
      component.set("v.Abrir",false);
      alert(result);
      
            
    }
    else if(state === "ERROR" || state === "INCOMPLETE")
    {
      var errors = response.getError();
   
      if (errors[0] && errors[0].message) this.showToast(component, 'info', errors[0].message);
    }
   });
   $A.enqueueAction(action);
        
  }
})
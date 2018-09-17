({
	buscarCEP : function(component, event, helper) {
	  helper.consultarCEP(component);	
	},
    
    salvarDados : function(component, event, helper){
      helper.salvarEndereco(component);	    
    }
})
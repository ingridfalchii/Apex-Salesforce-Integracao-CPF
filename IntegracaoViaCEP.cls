public class IntegracaoViaCEP {
    
    //método invocável chamado com a API REST e usado para invocar um único método do Apex
    @InvocableMethod(label='Get CEP' description='Integrate with viaCEP')
    
    //metodo que consulta o cep
    public static void consultaCep(String[] objectIds) {
		if(!System.isFuture() && !System.isBatch() && !System.isScheduled()){
        	atualizaAccount(objectIds);
        }
    }
    
    //metodo usado quando você realiza chamada a serviços da Web externos 
    @future(callout=true)
    
    //metodo que atualiza a conta
    public static void atualizaAccount(String[] objectIds) {

        List<Account> accs = [SELECT ID, BillingPostalCode, BillingStreet, BillingState FROM Account WHERE id IN :objectIds];
        
        System.debug(accs);

        for(Account acc : accs) {       
            String cepbusca = acc.BillingPostalCode;

            System.debug('cepbusca: '+cepbusca);

            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://viacep.com.br/ws/'+cepbusca+'/json/');
            request.setMethod('GET');
            HttpResponse response = http.send(request);        
            // If the request is successful, parse the JSON response.

            try {

                if(response.getStatusCode() == 200) {

                   ViaCEPJson results = (ViaCEPJson) JSON.deserialize(response.getBody(), ViaCEPJson.class);
                   //Decimal n = (Decimal)JSON.deserialize('100.1', Decimal.class);
                    
                   acc.BillingPostalCode = results.cep;
                   acc.BillingStreet = results.logradouro;
                   acc.BillingState = results.uf;
                    
                   update acc;
                }
            } catch(exception e){
                System.debug('Erro: ' + e);
            }
        }

    }
}
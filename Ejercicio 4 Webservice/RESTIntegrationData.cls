/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
public class RESTIntegrationData {

    public class Body {
        public  String  opportunityName; 
        public  String  opportunityId;
        public  Date    closeDate;
        public  Decimal amount;
        public  String  accountName;        
    } 
    
    public class BodyResponse {
        public  String  statusCode;
        public  String  message; 
    }
    
    public class Request {
        public List<Body> body;
    }
    
    public class Response {
   		public BodyResponse bodyResponse;
    }
    
    public static void getAndMapData(List<Opportunity> listaOpp){
                
        List<Body> listaBody = new List<Body>();
        
        for(Opportunity opp: listaOpp) {
            
            Body request = new Body();
            request.opportunityName = opp.Name;
            request.opportunityId   = opp.Id;
            request.closeDate       = opp.closeDate;
            request.amount          = opp.amount;
            request.accountName     = opp.Account.Name;
            
			listaBody.add(request);
        }
        
        Integer respuesta;
        if(!Test.isRunningTest()){
        	respuesta = RESTIntegrationHelperData.getAndMapData(listaBody);
        }
        updateOpp(respuesta, listaOpp);
    }

    public static void updateOpp(Integer respuesta, List<Opportunity> listaOpp){
        if(respuesta == 201){
            for(Opportunity opp: listaOpp) {
                opp.StageName = 'Enviado';
            }
            try{
                update listaOpp;
            }catch(DMLException e){
                System.debug('FALLO::' + e.getMessage() +'Linea ::'+ e.getLineNumber() + ' Cause : '+e.getCause());
            }
        }else if(respuesta == 500){
            for(Opportunity opp: listaOpp) {
                opp.StageName = 'Reenviar';
            }
            try{
                update listaOpp; 
            }catch(DMLException e){
                System.debug('FALLO: ' + e.getMessage() +' Linea: '+ e.getLineNumber() + ' Cause: '+e.getCause());
            }
        }else{
            System.debug('No se ha podido terminar la operación');
        }
    }
}
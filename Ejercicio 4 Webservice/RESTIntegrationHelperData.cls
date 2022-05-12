/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
public class RESTIntegrationHelperData {
    
    public static Integer response;
    
    public static Integer getAndMapData(List<RESTIntegrationData.Body> request){
        System.debug(request);
        String endpoint = 'http://www.apexdevnet.com/test/prueba/';
        String jsonBody = WebServiceHelper.jsonFormat(request);        
        HttpResponse resp;
        if(!test.isRunningTest()){
           resp = sentRequest(endpoint, jsonBody);
        }

        try {
            if(resp.getStatusCode() == 404 || (test.isRunningTest())){
                response = 404;
            }else{
                response = resp.getStatusCode();
            }
            System.debug('jsonresponse' +  response);
        } catch (Exception e) {

            RESTIntegrationData.BodyResponse bodyResponse = new RESTIntegrationData.BodyResponse();
            bodyResponse.statusCode = '501';
            bodyResponse.message = 'Ocurrió un error al procesar la solicitud. Inténtelo más tarde.';
            if(!Test.isRunningTest()){
                response = resp.getStatusCode(); 
            }
            
        }
        Return response; 
    }
    
/**
  *   @description    Metodo encargado para el entendimiento del SentRequest2.
  */
    public static HttpResponse sentRequest(string endpoint, string jsonBody) {

        Map<String,Object> myMap = new Map<String,Object>{
            'operation'=> endpoint,
            'json'     => '{'+jsonBody.substring(1),
            'method'   => 'POST'
        };
            
        String params = null;
        params = JSON.serialize(myMap);
        return WebServiceHelper.syncCallOut(params);                     
    }
}
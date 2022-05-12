/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
public class WebServiceHelper {

    /** @description Metodo para hacer llamadas Sincronas.
     *  @param params : Mapa de valores donde cada par representa un parametro.
     *  @return         Retorna un mapa de objetos por si se tiene que retornar mas de una cosa.
     */
    public static HttpResponse syncCallOut(String serializedMap){
       Map<String,Object> params = (Map<String,Object>) JSON.deserializeUntyped(serializedMap);
       Return calloutTask(params);
    }
 
    private static HttpResponse calloutTask(Map<string, object> params){
        HttpRequest  req    = getRequest(params);
        HttpResponse resp   = null;
        try{
            Http http   = new Http();
            if(!Test.isRunningTest()){
                resp        = http.send(req);
            }
            
            If(Test.isRunningTest() ||(resp.getStatusCode() == 301 || resp.getStatusCode() == 302)){  
                req.setEndpoint(resp.getHeader('Location'));
 				resp = new Http().send(req);
            }
            return resp;
        }catch (System.CalloutException ex){
            System.debug('FALLO::' + ex.getMessage() +'Linea ::'+ ex.getLineNumber() + ' Cause : '+ex.getCause());
            return null; 
        }
    }  
    
    private static HttpRequest getRequest(Map<string, Object> params){

        string method    = (string)params.get('method'   );     System.debug('method: '     +method   );
        string jsonBody  = (string)params.get('json'     );     System.debug('jsonBody: '   +jsonBody );
        string endPoint  = (string)params.get('operation');     System.debug('endPoint: '   +endPoint );                

        HttpRequest  req    = new HttpRequest();

        req.setHeader('Content-Type', 'application/json');
        req.setMethod(method);
        req.setEndpoint(endPoint);
        req.setBody(jsonBody);

        return req;
    }

    public static String jsonFormat(Object detail)    {    
        return JSON.serialize(detail);     
    }  
}
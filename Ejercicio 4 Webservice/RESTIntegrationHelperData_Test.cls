/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
@isTest
public class RESTIntegrationHelperData_Test {
    
    @isTest static void init(){
        
        List<RESTIntegrationData.Body> ListaBody = new List<RESTIntegrationData.Body>();
        
        RESTIntegrationData.Body body = new RESTIntegrationData.Body();
        

        body.opportunityName = 'Express Logistics Standby Generator'; 
        body.opportunityId = '0068b00001JPa5BAAT';
        body.closeDate = date.today();
        body.amount = 220000.00;
        body.accountName = 'Express Logistics and Transport';  
        String jsonBody = JSON.serialize(body);
        ListaBody.add(body);  
        
        Test.startTest();
       
        RESTIntegrationHelperData.getAndMapData(ListaBody);
        RESTIntegrationHelperData.sentRequest('http://www.apexdevnet.com/test/prueba/', jsonBody);
        
        Test.stopTest();
    }

}
/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
@isTest
public class RESTIntegrationData_TEST {

    @isTest static void setup() {
        
       List<Opportunity> listaOpp = new List<Opportunity>();

       Opportunity opp = new Opportunity();
        for(integer i = 0;  i < 2 ; i++){
             opp = new Opportunity();
            
            opp.Amount = 22000;
            opp.CloseDate = date.today();
            opp.Name = 'XerticaTestWebService';
            opp.StageName = 'Close Won';
            
            listaOpp.add(opp);
        }
        
        insert listaOpp;

        Test.startTest();
        
        RESTIntegrationData.getAndMapData(listaOpp);
        RESTIntegrationData.updateOpp(201,listaOpp);
        RESTIntegrationData.updateOpp(500,listaOpp);
        RESTIntegrationData.updateOpp(404,listaOpp);
        
        Test.stopTest();
    }

}
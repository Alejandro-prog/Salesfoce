/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
public class RESTServiceOpportunity {

    public static List<Opportunity> listaOpp;
        
    public static void init(){
        listaOpp =  new  List<Opportunity>();
        listaOpp = [SELECT Id, closeDate, amount, Account.Name, Name, StageName FROM Opportunity WHERE StageName = 'Close Won'];
        RESTIntegrationData.getAndMapData(listaOpp);
        
    }
}
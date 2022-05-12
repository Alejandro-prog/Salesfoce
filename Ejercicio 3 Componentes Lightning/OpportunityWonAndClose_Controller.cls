/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
public class OpportunityWonAndClose_Controller {
    
   @AuraEnabled
   public static list<Opportunity> listValues(String idCuenta){
        return [SELECT Id, Name, Account.Name, Amount, CloseDate, StageName, Type FROM Opportunity WHERE (StageName = 'Closed Won' OR StageName = 'Closed Lost') AND CloseDate = THIS_MONTH AND AccountId =: IdCuenta];
    }
}
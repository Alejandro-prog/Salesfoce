/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
@isTest
public class TriggerCuenta_Test {

        @isTest static void setupData(){
            
        Account acc =  new Account();
        acc.Activa__c = 'SI';
        acc.AccountNumber = 'TEST01';
        acc.name = 'XerticaTest';
        insert acc;
        
        //Contact 1
        Contact cont1 = new Contact();
        cont1.Rol__c = 'Influyente';
        cont1.AccountId = acc.Id;
        cont1.LastName = 'XerticaTest';
        insert cont1;
		
        //Contact 2
        Contact cont2 = new Contact();
        cont2.Rol__c = 'Influyente';
        cont2.AccountId = acc.Id; 
        cont2.LastName = 'XerticaTest';
        insert cont2;
		
        //Oportunidad 1
        Opportunity opp1 = new Opportunity();
        opp1.StageName = 'Closed Lost';
        opp1.AccountId = acc.Id; 
        opp1.Name = 'Nombre 1';
        opp1.CloseDate = date.today();
        insert opp1;
        
        //Oportunidad 2
        Opportunity opp2 = new Opportunity();
        opp2.StageName = 'Prospecting';
        opp2.AccountId = acc.Id;
        opp2.Name = 'Nombre 2';
        opp2.CloseDate = date.today();
        insert opp2;
            
        Test.startTest();
            Account accUpdate = [SELECT Id FROM Account WHERE Id = :acc.id];
            accUpdate.Activa__c = 'NO';
            Database.SaveResult result = Database.update(accUpdate, false);
        Test.stopTest();

     }
}
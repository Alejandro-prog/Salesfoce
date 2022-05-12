/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
global with sharing class OpportunitiesWonAndClose {

    private ApexPages.StandardController controller;
    public static List<Opportunity> ListaOpp {get;set;}
    
    public static void main(){
        //AND CloseDate = THIS_MONTH
       ListaOpp = [SELECT Name, Account.Name, Amount, CloseDate, StageName, Type FROM Opportunity WHERE StageName = 'Closed Won' AND CloseDate = THIS_MONTH ];
    }

    public static PageReference exportData() {   
        PageReference pf = new PageReference('/apex/ExportDataExc');
        pf.getParameters().put('success','true');
        pf.setRedirect(true);
        return pf;
    }  
    
    public OpportunitiesWonAndClose(ApexPages.StandardController stdController){
        this.controller = controller;
        main();
    }
}
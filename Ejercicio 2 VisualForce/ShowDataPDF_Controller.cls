/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
global with sharing class ShowDataPDF_Controller {

    private ApexPages.StandardController controller;
	public static List<Opportunity> ListaOpp {get;set;}
    
    public static void renderAsPDF(){
        String Id = System.currentPageReference().getParameters().get('Id');
        ListaOpp = [SELECT Name, AccountId, Amount, CloseDate, StageName, Type FROM Opportunity WHERE Id = :id ];
    }
    
    public ShowDataPDF_Controller(ApexPages.StandardController stdController){
        this.controller = controller;
        renderAsPDF();
    }
}
/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   10/04/2022            *
 * Description: Test Xervica     *
 ********************************/
@isTest
public class OpportunitiesWonAndClose_Test {

    @isTest static void OpportunitiesWonAndCloseTest(){
        
        test.startTest();
        //LLama al controlador
        OpportunitiesWonAndClose controller = new OpportunitiesWonAndClose(null); 
        
        //LLama a los metodos de la clase
        OpportunitiesWonAndClose.main();
        OpportunitiesWonAndClose.exportData();
        
        test.stopTest();
    }
}
/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
@isTest
public class ShowDataPDF_Controller_Test {

    @isTest static void ShowDataPDFControllerTest(){
        
        test.startTest();
        
         //LLama al controlador
        ShowDataPDF_Controller controller = new ShowDataPDF_Controller(null); 
        
        //LLama a los metodos de la clase
        ShowDataPDF_Controller.renderAsPDF();
        
        test.stopTest();
    }
}
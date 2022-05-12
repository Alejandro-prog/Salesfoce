/********************************* 
 * Author: John Alejandro Bedoya *
 * Date:   04/2022               *
 * Description: Test Xervica     *
 ********************************/
@isTest
public class WebServiceHelper_Test {
    
    @isTest static void webServiceHelperTest(){

        test.startTest();
        Map<String,Object> myMap = new Map<String,Object>{
            'operation'=>'operation',
                'json'=> '{ "numeroCasoMarket": "10105","estado": "ESTA020",}',
                'caseId' =>'caseId',
                'mockup' =>'1',                
                'target'=>'targetMockup',
                'method'=>'POST'
                };
                    
        String params = JSON.serialize(myMap);
        String jsFort = webServiceHelper.jsonFormat(null);
        HttpResponse htres = webServiceHelper.syncCallOut(params);
        
        test.stopTest();
    }

}
/**
* @file {{ api_name }}.cls
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @subject Web Service Mock for class {{ class_prefix }}{{ base_name }}
* @description TODO
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    Arlanis/{{ creating_user }}           |    initial release                                |                   |
**/


@IsTest
global class {{ api_name }} implements WebServiceMock {
	
	
	global {{ api_name }}() {
		// empty constructor
	}
	
	
	global void doInvoke(Object stub, Object request, Map<String, Object> response, String endpoint, String soapAction, String requestName, String responseNS, String responseName, String responseType) {
		Object resElement = '';
		// TODO create fake SOAP response
		response.put('response_x', resElement);
	}
	
	
}

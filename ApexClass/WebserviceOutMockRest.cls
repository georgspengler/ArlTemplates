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
global class {{ api_name }} implements HttpCalloutMock {
	
	
	global {{ api_name }}() {
		// empty constructor
	}
	
	
	global HttpResponse respond(HttpRequest req) {
		HttpResponse res = new HttpResponse();
		// TODO create fake REST response
		return res;
	}
	
	
}

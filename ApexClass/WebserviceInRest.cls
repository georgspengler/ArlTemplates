/**
* @file {{ api_name }}.cls
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @test ArlTCl{{ base_name }}.cls
* @subject Custom class {{ api_name }}
* @description TODO
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    Arlanis/{{ creating_user }}           |    initial release                                |                   |
**/


@RestResource(urlMapping='/{{ base_name }}')
global class {{ api_name }} {
	
	
	global class InputWrapper {
		// TODO 
	}
	
	
	global class OutputWrapper { // implements ArlIfcOutputWrapper
		// TODO
	}
	
	
	@HttpDelete
	global static void doDelete() {
		RestRequest req = RestContext.request;
		RestResponse res = RestContext.response;
		// TODO
	}
	
	@HttpGet
	global static OutputWrapper doGet() {
		RestRequest req = RestContext.request;
		RestResponse res = RestContext.response;
		// TODO
		return null;
	}
	
	
	@HttpPatch
	global static OutputWrapper doPatch(InputWrapper input) {
		RestRequest req = RestContext.request;
		RestResponse res = RestContext.response;
		// TODO
		return null;
	}
	
	
	@HttpPost
	global static OutputWrapper doPost(InputWrapper input) {
		RestRequest req = RestContext.request;
		RestResponse res = RestContext.response;
		// TODO
		return null;
	}
	
	
	@HttpPut
	global static OutputWrapper doPut(InputWrapper input) {
		RestRequest req = RestContext.request;
		RestResponse res = RestContext.response;
		// TODO
		return null;
	}
	
	
}

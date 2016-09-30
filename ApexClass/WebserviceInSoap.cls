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


global class {{ api_name }} {
	
	
	global class InputWrapper {
		// TODO 
	}
	
	
	global class OutputWrapper { // implements ArlIfcOutputWrapper
		// TODO
	}
	
	
	webservice static OutputWrapper wsMethod(InputWrapper input) {
		// TODO
		return null;
	}
	
	
}

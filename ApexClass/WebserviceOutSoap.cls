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


public class {{ api_name }} {
	
	
	// ---------------------------------------------------------------------- //
	// I/O mapping classes                                                    //
	// ---------------------------------------------------------------------- //
	
	
	public class InputWrapper { // implements ArlIfcSoapInputWrapper
		// TODO 
	}
	
	
	public class OutputWrapper { // implements ArlIfcSoapOutputWrapper
		// TODO
	}
	
	
	// ---------------------------------------------------------------------- //
	// static accessor methods to call to invoke the web service              //
	// ---------------------------------------------------------------------- //
	
	
	@future(callout=true)
	public static void performCalloutAsync() {
		Object result = performCallout();
		// TODO take appropriate action for callout result
	}
	
	
	public static Object performCallout() {
		{{ api_name }} ws = new {{ api_name }}();
		OutputWrapper result = ws.performCalloutInternal(null);
		// TODO process result appropriately and return data
		return null;
	}
	
	
	// ---------------------------------------------------------------------- //
	// class implementation                                                   //
	// ---------------------------------------------------------------------- //
	
	
	private Object stub;
	
	
	public {{ api_name }}() {
		// TODO init stubs, set connection parameters
	}
	
	
	private OutputWrapper performCalloutInternal(InputWrapper input) {
		if (input == null) {
			return new OutputWrapper();
		}
		// TODO invoke stub method using parameters from input
		// TODO create output from web service response and return the value
		return null;
	}
	
	
}

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
	
	
	public class InputWrapper { // implements ArlIfcRestInputWrapper
		// TODO 
		public InputWrapper() {
			// TODO
		}
		public void fillHttpRequest(HttpRequest request) {
			// TODO
		}
	}
	
	
	public class OutputWrapper { // implements ArlIfcRestOutputWrapper
		public HttpResponse rawResponse {get; private set;}
		public Integer status {get; private set;}
		public Boolean isSuccess {get; private set;}
		// TODO
		public OutputWrapper(HttpResponse rawResponse) {
			this.rawResponse = rawResponse;
			if (rawResponse != null) {
				this.status = rawResponse.getStatusCode();
				this.isSuccess = (status >= 200 && status < 300);
			} else {
				this.status = 422; // Unprocessable Entity
				this.isSuccess = false;
			}
			if (this.isSuccess) {
				// TODO
			} else {
				// TODO
			}
		}
	}
	
	
	// ---------------------------------------------------------------------- //
	// static accessor methods to call to invoke the web service              //
	// ---------------------------------------------------------------------- //
	
	
	@future(callout=true)
	public static void performCalloutAsync() {
		Boolean success = performCallout();
		// TODO take appropriate action for callout result
	}
	
	
	public static Boolean performCallout() {
		{{ api_name }} ws = new {{ api_name }}();
		OutputWrapper result = ws.performCalloutInternal(null);
		return result.isSuccess;
	}
	
	
	// ---------------------------------------------------------------------- //
	// class implementation                                                   //
	// ---------------------------------------------------------------------- //
	
	
	private Http connection;
	private HttpRequest request;
	
	
	public {{ api_name }}() {
		this.connection = new Http();
		this.request = new HttpRequest();
		// TODO set request properties
	}
	
	
	private OutputWrapper performCalloutInternal(InputWrapper input) {
		if (input == null) {
			return new OutputWrapper(null);
		}
		input.fillHttpRequest(request);
		return new OutputWrapper(connection.send(request));
	}
	
	
}

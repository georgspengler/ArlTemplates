/**
* @file {{ api_name }}.cls
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @test ArlTCt{{ base_name }}.cls
* @subject Visualforce controller extension class {{ api_name }} for page ArlPag{{ base_name }}
* @description TODO
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    Arlanis/{{ creating_user }}           |    initial release                                |                   |
**/


public with sharing class {{ api_name }} {
	
	
	private ApexPages.StandardController controller;
	
	public ID recordId {get; private set;}
	public {{ object_name }} record {get; set;}
	
	
	public {{ api_name }}(ApexPages.StandardController controller) {
		this.controller = controller;
		this.recordId = controller.getId();
		this.record = [SELECT Id FROM {{ object_name }} WHERE Id = :this.recordId LIMIT 1];
	}
	
	
	// TODO implement methods
	
	
}

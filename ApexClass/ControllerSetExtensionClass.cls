/**
* @file {{ api_name }}.cls
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @test ArlTCt{{ base_name }}.cls
* @subject Visualforce set controller extension class {{ api_name }} for page ArlPag{{ base_name }}
* @description TODO
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    Arlanis/{{ creating_user }}           |    initial release                                |                   |
**/


public with sharing class {{ api_name }} {
	
	
	private ApexPages.StandardSetController controller;
	
	public ID refererRecordId {get; private set;}
	public List<{{ object_name }}> records {get; set;}
	
	
	public {{ api_name }}(ApexPages.StandardSetController controller) {
		this.controller = controller;
		this.refererRecordId = ApexPages.currentPage().getParameters().get('id');
		this.records = (List<{{ object_name }}>) controller.getRecords();
	}
	
	
	// TODO implement methods
	
	
}

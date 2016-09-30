/**
* @file {{ api_name }}.cls
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @test ArlTTr{{ base_name }}.cls
* @subject Trigger handler {{ api_name }} for trigger ArlTri{{ base_name }}
* @description TODO
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    Arlanis/{{ creating_user }}           |    initial release                                |                   |
**/


public without sharing class {{ api_name }} {
	
	
	/*
	 * CUSTOM HANDLER METHODS
	 */
	 
	
	// TODO implement methods
	
	
	/*
	 * METHODS IMPLEMENTING THE TRIGGER HANDLER INTERFACE
	 */
	
	public void handleBeforeInsert(List<{{ object_name }}> newList) {
		// empty
	}
	
	public void handleAfterInsert(List<{{ object_name }}> newList, Map<ID, {{ object_name }}> newMap) {
		// empty
	}
	
	public void handleBeforeUpdate(List<{{ object_name }}> newList, Map<ID, {{ object_name }}> newMap, List<{{ object_name }}> oldList, Map<ID, {{ object_name }}> oldMap) {
		// empty
	}
	
	public void handleAfterUpdate(List<{{ object_name }}> newList, Map<ID, {{ object_name }}> newMap, List<{{ object_name }}> oldList, Map<ID, {{ object_name }}> oldMap) {
		// empty
	}
	
	public void handleBeforeDelete(List<{{ object_name }}> oldList, Map<ID, {{ object_name }}> oldMap) {
		// empty
	}
	
	public void handleAfterDelete(List<{{ object_name }}> oldList, Map<ID, {{ object_name }}> oldMap) {
		// empty
	}
	
	public void handleAfterUndelete(List<{{ object_name }}> newList, Map<ID, {{ object_name }}> newMap) {
		// empty
	}
	
	
}

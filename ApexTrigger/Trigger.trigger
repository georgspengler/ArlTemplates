/**
* @file {{ api_name }}.trigger
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @handler ArlTrh{{ base_name }}.cls
* @test ArlTTr{{ base_name }}.cls
* @subject Trigger on SObject {{ object_name }}
* @description TODO
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    arlanis/{{ creating_user }}           |    initial release                                |                   |
**/

trigger {{ api_name }} on {{ object_name }} (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	
	// if the "ArlanisHelpers" package is installed in the current org, remove the comment from the following block of code
	/*
	// the following code block must not be disabled
	if (trigger.isAfter) {
		if (trigger.isInsert) {
			ArlanisReply.ObjectHistory.trackInsert(trigger.new);
		} else if (trigger.isUpdate) {
			ArlanisReply.ObjectHistory.trackUpdate(trigger.old, trigger.new);
		} else if (trigger.isDelete) {
			ArlanisReply.ObjectHistory.trackDelete(trigger.old);
		} else {
			ArlanisReply.ObjectHistory.trackUndelete(trigger.new);
		}
	}
	
	if (!Test.isRunningTest()) {
		if (ArlanisReply.TriggerSettingsEvaluator.isTriggerDisabled({{ object_name }}.sObjectType, (trigger.new != null ? trigger.new : trigger.old))) {
			return;
		}
	}
	*/
	
	// get handler instance
	ArlTrh{{ base_name }} handler = new ArlTrh{{ base_name }}();
	
	// call handler to execute trigger logic
	try {
		if (trigger.isBefore) {
			if (trigger.isInsert) {
				handler.handleBeforeInsert(trigger.new);
			} else if (trigger.isUpdate) {
				handler.handleBeforeUpdate(trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
			} else { // if (trigger.isDelete)
				handler.handleBeforeDelete(trigger.old, trigger.oldMap);
			}
		} else { // if (trigger.isAfter)
			if (trigger.isInsert) {
				handler.handleAfterInsert(trigger.new, trigger.newMap);
			} else if (trigger.isUpdate) {
				handler.handleAfterUpdate(trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
			} else if (trigger.isDelete) {
				handler.handleAfterDelete(trigger.old, trigger.oldMap);
			} else { // if (trigger.isUnDelete)
				handler.handleAfterUndelete(trigger.new, trigger.newMap);
			}
		}
	} catch (Exception ex) {
		// default uncaught exception handling
		for ({{ object_name }} sobj : (trigger.new != null ? trigger.new : trigger.old)) {
			sobj.addError(ex.getMessage());
		}
	}
	
}

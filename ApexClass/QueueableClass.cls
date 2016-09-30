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


global class {{ api_name }} implements Queueable, Database.AllowsCallouts {
	
	
	global class QueueableWorkItem {
		// TODO define data this Queueable class needs to run
	}
	
	
	global static void runNow(QueueableWorkItem theWorkItem) {
		ArlQue{{ base_name }} worker = new ArlQue{{ base_name }}{{baseName}}(theWorkItem);
		System.enqueueJob(worker);
	}
	
	
	private QueueableWorkItem theWorkItem;
	
	
	global ArlQue{{ base_name }}(QueueableWorkItem theWorkItem) {
		this.theWorkItem = theWorkItem;
		// TODO perform further initialization
	}
	
	
	global void execute(QueueableContext ctx) {
		// TODO implement logic for this job
	}
	
	
}

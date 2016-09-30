/**
* @file {{ api_name }}.cls
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @test ArlTBa{{ base_name }}.cls
* @subject Batch class {{ api_name }}
* @description TODO
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    Arlanis/{{ creating_user }}           |    initial release                                |                   |
**/


global class {{ api_name }} implements Database.Batchable<Sobject>, Database.Stateful, Schedulable, Database.AllowsCallouts {
	
	
	global static final Integer BATCH_SIZE = 200;
	
	
	global static List<String> schedule() {
		List<String> results = new List<String>();
		List<String> crons = new List<String>();
		// syntax:'ss mm hh DoM MM DoW YYYY';  /* rule description */
		crons.add(' 0  0  *   *  *   ?    *'); /* example: hourly */
		for (String cron : crons) {
			String schedId = System.schedule('{{ api_name }}: ' + cron + ' @ ' + Datetime.now().formatGmt('yyyyMMdd\'T\'HHmmss\'Z\''), cron, new {{ api_name }}(null));
			System.debug('***** {{ api_name }} scheduled with ID "' + schedId + '".');
			results.add(schedId);
		}
		return results;
	}
	
	
	global static void unschedule(List<String> schedIds) {
		for (String schedId : schedIds) {
			System.abortJob(schedId);
			System.debug('***** {{ api_name }} job with ID "' + schedId + '" aborted.');
		}
	}
	
	
	global static void unschedule() {
		List<CronTrigger> jobs = [SELECT Id FROM CronTrigger WHERE CronJobDetail.Name LIKE '{{ api_name }}:%'];
		List<String> jobIds = new List<String>();
		for (CronTrigger job : jobs) {
			jobIds.add(job.Id);
		}
		if (! Test.isRunningTest()) {
			unschedule(jobIds);
		}
	}
	
	
	global static void runNow() {
		{{ api_name }} worker = new {{ api_name }}(null);
		worker.execute(null);
	}
	
	
	global static void runNowForIds(Set<ID> presetObjectIds) {
		{{ api_name }} worker = new {{ api_name }}(presetObjectIds);
		worker.execute(null);
	}
	
	
	private Set<ID> presetObjectIds;
	
	
	global {{ api_name }}(Set<ID> presetObjectIds) {
		this.presetObjectIds = presetObjectIds;
	}
	
	
	global void execute(SchedulableContext sc) {
		Database.executeBatch(this, BATCH_SIZE);
	}
	
	
	global Database.QueryLocator start(Database.BatchableContext ctx) {
		String query = 'SELECT Id FROM {{ object_name }} WHERE Id != NULL';
		if (presetObjectIds != null) {
			query = query + ' AND Id IN :presetObjectIds';
		}
		if (Test.isRunningTest()) {
			query = query + ' LIMIT ' + BATCH_SIZE;
		}
		return Database.getQueryLocator(query);
	}
	
	
	global void execute(Database.BatchableContext ctx, List<Sobject> scope) {
		List<{{ object_name }}> sobjs = (List<{{ object_name }}>) scope;
		// TODO implement logic for each batch
	}
	
	
	global void finish(Database.BatchableContext ctx) {
		// empty finalization
	}
	
	
}

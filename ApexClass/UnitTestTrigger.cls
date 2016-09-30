/**
* @file {{ api_name }}.cls
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @subject Unit test for class {{ class_prefix }}{{ base_name }}
* @description TODO
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    Arlanis/{{ creating_user }}           |    initial release                                |                   |
**/


@IsTest
private class {{ api_name }} {
	
	
	@TestSetup 
	static void initTestData() {
		// TODO initialize test data used by all test methods within this test class
	}
	
	
	// unit test for {{ class_prefix }}{{ base_name }}
	@IsTest(SeeAllData=false)
	static void test_{{ class_prefix }}{{ base_name }}() {
		{{ base_name }}Wrapper testWrapper = null; // <ChildType>{{ base_name }}Wrapper.get<ChildType>{{ base_name }}Wrapper(true, 0);
		// TODO initialize test data only used by this test method
		{{ object_name }} testObj = testWrapper.getSObject();
		Test.startTest();
		insert testObj;
		update testObj;
		delete testObj;
		undelete testObj;
		Test.stopTest();
		// TODO perform assertions
	}
	
	
}

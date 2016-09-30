/**
* @file {{ api_name }}.cls
* @author Arlanis / {{ creating_user }}
* @reviewedby Arlanis / ??? / ????-??-??
* @copyright Arlanis
* @date {{ release_date }}
* @subject Unit test setting factory class {{ api_name }} for {{ object_name }}
* 
* Change History:
* |  Date        | Company / Person           |  Description/Reason                                      |  Requirement  |
* |--------------|----------------------------|----------------------------------------------------------|---------------|
* |  {{ release_date }}  |   Arlanis / {{ creating_user }}   |  initial version                                         |               |
**/


@IsTest
public class {{ api_name }} {
	
	
	// {{ object_name }} : {{ base_name }}Wrapper : BEGIN
	
	public virtual class {{ base_name }}Wrapper extends ArlanisReply.SObjectWrapper {
		public override Schema.SObjectType getDefaultSObjectType() {
			return {{ object_name }}.SObjectType;
		}
		public override System.Type getDefaultWrapperType() {
			return {{ base_name }}Wrapper.class;
		}
		public override RecordType getDefaultRecordType() {
			return null; // use default record type
		}
		public override Object[] getDefaultInitializerData() {
			return null; // use no additional initializer data
		}
		public override virtual void initialize() {
			super.initialize();
			{{ object_name }} theObj = ({{ object_name }}) getSObject();
			// TODO initialize SObject properties valid for this base class and all its subclasses
		}
	}
	
	private static {{ base_name }}Wrapper get{{ base_name }}Wrapper(Boolean forceNew, Integer cascadeNewLevel) {
		return ({{ base_name }}Wrapper) ArlanisReply.SObjectWrapper.getWrapper({{ base_name }}Wrapper.class, forceNew, cascadeNewLevel, true);
	}
	
	// {{ object_name }} : {{ base_name }}Wrapper : END
	
	
	private static final List<{{ base_name }}Wrapper> OBJS = new List<{{ base_name }}Wrapper>();
	
	private static void init{{ base_name }}() {
		if (OBJS.size() == 0) {
			// TODO initialize all the settings needed to run your tests
			ArlanisReply.SObjectWrapper.persistList(OBJS);
		}
	}
	
	public static List<{{ base_name }}Wrapper> get{{ base_name }}s() {
		init{{ base_name }}();
		return OBJS;
	}
	
	@IsTest(SeeAllData = false)
	static void test_{{ api_name }}() {
		Test.startTest();
		get{{ base_name }}s();
		Test.stopTest();
	}
	
	
}

/**
* @file {{ api_name }}.cls
* @author Arlanis / {{ creating_user }}
* @reviewedby Arlanis / ??? / ????-??-??
* @copyright Arlanis
* @date {{ release_date }}
* {{metadataDependencies}}
* @subject Unit test data factory class {{ api_name }} for {{ object_name }}
* 
* Change History:
* |  Date        | Company / Person           |  Description/Reason                                      |  Requirement  |
* |--------------|----------------------------|----------------------------------------------------------|---------------|
* |  {{ release_date }}  |   Arlanis / {{ creating_user }}   |  initial version                                         |               |
**/


@IsTest
public class {{ api_name }} {
	
	
	// {{ object_name }} : {{ base_name }}Wrapper : BEGIN
	
	public abstract class {{ base_name }}Wrapper extends SObjectWrapper {
		// public ArlUtdParentObject_c.ParentObject_cWrapper par_objW {get; private set;}
		public override Schema.SObjectType getDefaultSObjectType() {
			return {{ object_name }}.SObjectType;
		}
		public override virtual void initialize() {
			super.initialize();
			//par_objW = (ArlUtdParentObject_c.ParentObject_cWrapper) getParentInstance(ArlUtdParentObject_c.ParentObject_cWrapper.class, false, true, true);
			{{ object_name }} theObj = ({{ object_name }}) getSObject();
			// TODO initialize SObject properties valid for this base class and all its subclasses
		}
	}
	
	// TODO implement virtual or abstract subclasses of {{ base_name }}Wrapper (see templates below)
	
	// {{ object_name }} : {{ base_name }}Wrapper : END
	
	
}


/* 
 * TEMPLATES TO SET UP TEST DATA
 *   Usage instructions:
 *     - choose the abstract subclass template, if you want to build an intermediate class which will never be 
 *       instantiated
 *     - choose the virtual template, if you want to build a test data class to instantiate along with accessor 
 *       methods and a unit test
 *     - copy the template you have chosen into the class' code
 *     - replace "ChildType" by an appropriate text clearly identifying the type of test data the class should 
 *       provide
 *     - replace "ParentType" by the correct text to match the parent class' name
 *     - if you do not have required lookup dependencies to a parent object, remove the commented sections referring 
 *       to a ParentObject_cWrapper
 *     - if you need lookup dependencies to parent object(s), use the commented sections referring to a 
 *       ParentObject_cWrapper as a template and define as many dependencies as you need:
 *       - name the property "par_objW" to clearly identify the lookup dependency
 *       - replace "ArlUtdParentObject_c" with the type of the corresponding Unit Test Data Provider class
 *       - replace "ParentObject_cWrapper" with the type of the corresponding wrapper class
 */


// TEMPLATE FOR AN ABSTRACT SUBCLASS
	
	/*
	// {{ object_name }} : ChildType{{ base_name }}Wrapper : BEGIN
	
	public abstract class ChildType{{ base_name }}Wrapper extends ParentType{{ base_name }}Wrapper {
		public override virtual void initialize() {
			super.initialize();
			{{ object_name }} theObj = ({{ object_name }}) getSObject();
			// TODO initialize SObject properties valid for this child type and all its subclasses
		}
	}
	
	// TODO implement virtual or abstract subclasses of ChildType{{ base_name }}Wrapper (see templates below)
	
	// {{ object_name }} : ChildType{{ base_name }}Wrapper : END
	*/


// TEMPLATE FOR A VIRTUAL SUBCLASS
	
	/*
	// {{ object_name }} : ChildType{{ base_name }}Wrapper : BEGIN
	
	public virtual class ChildType{{ base_name }}Wrapper extends ParentType{{ base_name }}Wrapper {
		public override System.Type getDefaultWrapperType() {
			return ChildType{{ base_name }}Wrapper.class;
		}
		public override RecordType getDefaultRecordType() {
			return null; // use default record type
		}
		public override Object[] getDefaultInitializerData() {
			return null; // use no additional initializer data
		}
		public override void initialize() {
			super.initialize();
			{{ object_name }} theObj = ({{ object_name }}) getSObject();
			// TODO initialize SObject properties valid for this child type and all its subclasses
		}
	}
	
	public static ChildType{{ base_name }}Wrapper getChildType{{ base_name }}Wrapper(Boolean forceNew, Integer cascadeNewLevel) {
		return (ChildType{{ base_name }}Wrapper) SObjectWrapper.getWrapper(ChildType{{ base_name }}Wrapper.class, forceNew, cascadeNewLevel, true);
	}
	public static ChildType{{ base_name }}Wrapper createChildType{{ base_name }}Wrapper(Boolean forceNew, Integer cascadeNewLevel) {
		return (ChildType{{ base_name }}Wrapper) getChildType{{ base_name }}Wrapper(forceNew, cascadeNewLevel).persist();
	}
	public static List<ChildType{{ base_name }}Wrapper> getNewChildType{{ base_name }}Wrappers(Integer amount, Integer cascadeNewLevel) {
		return (List<ChildType{{ base_name }}Wrapper>) SObjectWrapper.getNewWrappers(ChildType{{ base_name }}Wrapper.class, amount, cascadeNewLevel, true, new List<ChildType{{ base_name }}Wrapper>());
	}
	public static List<ChildType{{ base_name }}Wrapper> createNewChildType{{ base_name }}Wrappers(Integer amount, Integer cascadeNewLevel) {
		return (List<ChildType{{ base_name }}Wrapper>) SObjectWrapper.persistList(getNewChildType{{ base_name }}Wrappers(amount, cascadeNewLevel));
	}
	
	@IsTest(SeeAllData = false)
	static void test_ChildType{{ base_name }}Wrapper() {
		Test.startTest();
		createChildType{{ base_name }}Wrapper(false, 0);
		createNewChildType{{ base_name }}Wrappers(1, 0);
		Test.stopTest();
	}
	
	// TODO (optional) implement virtual subclasses of ChildType{{ base_name }}Wrapper
	
	// {{ object_name }} : ChildType{{ base_name }}Wrapper : END
	*/

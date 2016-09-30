/**
* @file {{ api_name }}.cls
* @author Arlanis/{{ creating_user }}
* @reviewedby Arlanis/xxx/yyyy-mm-dd
* @copyright Arlanis Reply AG
* @date {{ release_date }}
* @subject Unit Test Data Factory class {{ api_name }}
* @description provides reliable test data for other unit tests
* 
* Change History:
* |    Date          |    Company/Person        |    Description/Reason                             |    Requirement    |
* |------------------|--------------------------|---------------------------------------------------|-------------------|
* |    {{ release_date }}    |    Arlanis/{{ creating_user }}           |    initial release                                |                   |
**/


@IsTest
public class {{ api_name }} {
	
	
	/*
	 * GLOBAL DATA REPOSITORY : BEGIN
	 * --- DO NOT CHANGE ---
	 */
	
	
	private static final {{ api_name }} FACTORY = new {{ api_name }}();
	private static final Map<Schema.SObjectType, List<SObjectWrapper>> DATA_REPO = new Map<Schema.SObjectType, List<SObjectWrapper>>();
	private static final Map<System.Type, List<SObjectWrapper>> DATA_REPO_BY_WRAPPER = new Map<System.Type, List<SObjectWrapper>>();
	
	private static System.LoggingLevel TRACE_LEVEL = System.LoggingLevel.DEBUG;
	
	
	public static {{ api_name }} instance() {
		return FACTORY;
	}
	
	
	public static SObjectWrapper getRecent(Schema.SObjectType objType) {
		SObjectWrapper result = null;
		if (DATA_REPO.containsKey(objType)) {
			List<SObjectWrapper> objs = DATA_REPO.get(objType);
			result = objs.get(objs.size() - 1);
		}
		return result;
	}
	
	
	public static SObjectWrapper getRecent(System.Type wrapperType) {
		SObjectWrapper result = null;
		if (DATA_REPO_BY_WRAPPER.containsKey(wrapperType)) {
			List<SObjectWrapper> objs = DATA_REPO_BY_WRAPPER.get(wrapperType);
			result = objs.get(objs.size() - 1);
		}
		return result;
	}
	
	
	private static SObjectWrapper addObjectToRepo(SObjectWrapper obj) {
		if (obj != null) {
			Schema.SObjectType sType = obj.getSObjectType();
			if (! DATA_REPO.containsKey(sType)) {
				DATA_REPO.put(sType, new List<SObjectWrapper>());
			}
			DATA_REPO.get(sType).add(obj);
			System.type wType = obj.getWrapperType();
			if (! DATA_REPO_BY_WRAPPER.containsKey(wType)) {
				DATA_REPO_BY_WRAPPER.put(wType, new List<SObjectWrapper>());
			}
			DATA_REPO_BY_WRAPPER.get(wType).add(obj);
		}
		return obj;
	}
	
	
	public static void setTraceLevel(System.LoggingLevel newLevel) {
		TRACE_LEVEL = newLevel;
	}
	
	
	/*
	 * --- DO NOT CHANGE ---
	 * GLOBAL DATA REPOSITORY : END
	 */
	
	
	/*
	 * SOBJECT WRAPPER BASE CLASS : BEGIN
	 * --- DO NOT CHANGE ---
	 */
	
	
	public abstract class SObjectWrapper {
		private System.Type wrapperType;
		private Schema.SObjectType sObjType;
		private RecordType recType;
		private Object[] initializerData;
		private Integer cascadeNewLevel;
		private SObject sObj;
		protected SObjectWrapper() {
			this.wrapperType = getDefaultWrapperType();
			this.sObjType = getDefaultSObjectType();
			this.recType = getDefaultRecordType();
			this.initializerData = getDefaultInitializerData();
			this.sObj = sObjType.newSObject(recType != null ? recType.Id : null, true);
		}
		private SObjectWrapper baseClassInitialize(Integer cascadeNewLevel, Boolean doTrack) {
			this.cascadeNewLevel = (cascadeNewLevel != null ? cascadeNewLevel : 0);
			this.initialize();
			if (doTrack) {
				addObjectToRepo(this);
			}
			return this;
		}
		protected abstract System.Type getDefaultWrapperType();
		protected abstract Schema.SObjectType getDefaultSObjectType();
		protected abstract RecordType getDefaultRecordType();
		protected abstract Object[] getDefaultInitializerData();
		protected virtual void initialize() {
			// empty
		}
		public System.Type getWrapperType() {
			return wrapperType;
		}
		public Schema.SObjectType getSObjectType() {
			return sObjType;
		}
		public RecordType getRecordType() {
			return recType;
		}
		public Object[] getInitializerData() {
			return initializerData;
		}
		public Integer getCascadeNewLevel() {
			return cascadeNewLevel;
		}
		public SObject getSObject() {
			return sObj;
		}
		public ID getSObjectId() {
			return sObj.Id;
		}
		public SObjectWrapper getParentInstance(System.Type parentType, Boolean forceNew, Boolean doPersist, Boolean doTrack) {
			System.debug(TRACE_LEVEL, '+#+#+# ^^ BEGIN: ' + this.getWrapperType() + '.getParentInstance(parentType: ' + parentType + ', forceNew: ' + forceNew + ', doPersist: ' + doPersist + ', doTrack: ' + doTrack + ')');
			SObjectWrapper result = getWrapper(parentType, (forceNew || cascadeNewLevel > 0 || cascadeNewLevel < 0), (cascadeNewLevel > 0 ? cascadeNewLevel - 1 : cascadeNewLevel), doTrack);
			if (doPersist) {
				result.persist();
			}
			System.debug(TRACE_LEVEL, '+#+#+# ^^ END  : ' + this.getWrapperType() + '.getParentInstance(parentType: ' + parentType + ', forceNew: ' + forceNew + ', doPersist: ' + doPersist + ', doTrack: ' + doTrack + ')');
			return result;
		}
		public SObjectWrapper persist() {
			if (sObj.Id == null) {
				System.debug(TRACE_LEVEL, '+#+#+# ii BEGIN: ' + this.getWrapperType() + '.persist() : ' + this.toString());
				insert sObj;
				System.debug(TRACE_LEVEL, '+#+#+# ii END  : ' + this.getWrapperType() + '.persist() : ' + this.toString());
			}
			return this;
		}
		public override virtual String toString() {
			String rt = (getRecordType() != null ? ('{' + getRecordType() + '}') : 'NULL');
			String id = (getInitializerData() != null ? ('[' + getInitializerData() + ']') : 'NULL');
			String res = '\n';
			res = res + '{\n';
			res = res + '    wrapperType: ' + getWrapperType() + ',\n';
			res = res + '    sObjType: ' + getSObjectType() + ',\n';
			res = res + '    recType: ' + rt + ',\n';
			res = res + '    initializerData: ' + id + ',\n';
			res = res + '    cascadeNewLevel: ' + getCascadeNewLevel() + ',\n';
			res = res + ('    sObj: {' + getSObject() + '}\n').replaceAll('[A-Za-z0-9_]+=null(, )?', '').replace(', }', '}');
			res = res + '}\n';
			return res;
		}
	}
	
	private static void getNewWrappers(System.Type wrapperType, Integer amount, Integer cascadeNewLevel, Boolean doTrack, List<SObjectWrapper> result) {
		if (result == null || amount <= 0) {
			return;
		}
		for (Integer num = 0; num < amount; num++) {
			result.add(ArlClsUnitTestDataFactory.getWrapper(wrapperType, true, cascadeNewLevel, doTrack));
		}
	}
	
	private static SObjectWrapper getWrapper(System.Type wrapperType, Boolean forceNew, Integer cascadeNewLevel, Boolean doTrack) {
		System.debug(TRACE_LEVEL, '+#+#+# ++ BEGIN: getWrapper(wrapperType: ' + wrapperType + ', forceNew: ' + forceNew + ', cascadeNewLevel: ' + cascadeNewLevel + ', doTrack: ' + doTrack + ')');
		SObjectWrapper wrap = null;
		if (forceNew) {
			wrap = ((SObjectWrapper) wrapperType.newInstance()).baseClassInitialize(cascadeNewLevel, doTrack);
			System.debug(TRACE_LEVEL, '+#+#+# ++++ force-created new SObjectWrapper of type "' + wrapperType + '": ' + wrap.toString());
		} else {
			wrap = ArlClsUnitTestDataFactory.getRecent(wrapperType);
			if (wrap == null) {
				wrap = ((SObjectWrapper) wrapperType.newInstance()).baseClassInitialize(cascadeNewLevel, doTrack);
				System.debug(TRACE_LEVEL, '+#+#+# ++++ created new SObjectWrapper of type "' + wrapperType + '": ' + wrap.toString());
			} else {
				System.debug(TRACE_LEVEL, '+#+#+# ++++ use existing SObjectWrapper of type "' + wrapperType + '": ' + wrap.toString());
			}
		}
		System.debug(TRACE_LEVEL, '+#+#+# ++ END  : getWrapper(wrapperType: ' + wrapperType + ', forceNew: ' + forceNew + ', cascadeNewLevel: ' + cascadeNewLevel + ', doTrack: ' + doTrack + ')');
		return wrap;
	}
	
	public static List<SObjectWrapper> persist(List<SObjectWrapper> objWrappers) {
		System.debug(TRACE_LEVEL, '+#+#+# ii BEGIN: presist(List<SObjectWrapper>[' + objWrappers.size() + '])');
		List<SObject> sObjs = new List<SObject>();
		Integer idx = -1;
		for (SObjectWrapper objWrapper : objWrappers) {
			idx++;
			if (objWrapper.getSObjectId() == null) {
				System.debug(TRACE_LEVEL, '+#+#+# iiii STAT : presist(@' + idx + ') --> ' + objWrapper.toString());
				sObjs.add(objWrapper.getSObject());
			}
		}
		insert sObjs;
		System.debug(TRACE_LEVEL, '+#+#+# ii END  : presist(List<SObjectWrapper>[' + objWrappers.size() + '])');
		return objWrappers;
	}
	
	
	/*
	 * --- DO NOT CHANGE ---
	 * SOBJECT WRAPPER BASE CLASS : END
	 */
	
	
	/*
	 * DISTINCT VALUE PROVIDERS, CONFIGURATION DATA, STATIC INITIALIZERS : BEGIN
	 * --- ADD MORE IF NEEDED ---
	 */
	
	
	// Prividers for distinct texts and numbers : BEGIN
	
	public virtual class DistinctValueProvider {
		public List<String> buildingBlocks {get; private set;}
		public Integer numBlocks {get; private set;}
		public Integer resultLength {get; private set;}
		public List<Integer> blockCounters {get; private set;}
		public DistinctValueProvider(List<String> buildingBlocks, Integer resultLength) {
			this.buildingBlocks = buildingBlocks;
			this.numBlocks = this.buildingBlocks.size() / 3;
			this.resultLength = resultLength;
			this.blockCounters = new List<Integer>();
			for (Integer i = 0; i < this.numBlocks; i++) {
				blockCounters.add(i);
			}
		}
		private void incrementBlockCounters() {
			for (Integer i = 0; i < this.numBlocks; i++) {
				blockCounters.set(i, Math.mod(blockCounters.get(i) + 3, this.buildingBlocks.size()));
			}
		}
		public String getNext() {
			String result = '';
			while (result.length() < resultLength) {
				for (Integer idx : blockCounters) {
					result = result + buildingBlocks.get(idx);
					if (result.length() >= resultLength) {
						break;
					}
				}
				incrementBlockCounters();
			}
			return result;
		}
	}
	
	public class NameDistinctValueProvider extends DistinctValueProvider {
		public NameDistinctValueProvider() {
			super(new List<String> {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}, 5);
		}
	}
	
	public class NumberDistinctValueProvider extends DistinctValueProvider {
		public NumberDistinctValueProvider() {
			super(new List<String> {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}, 2);
		}
	}
	
	private static final NameDistinctValueProvider NAMES = new NameDistinctValueProvider();
	
	private static final NumberDistinctValueProvider NUMBERS = new NumberDistinctValueProvider();
	
	// Prividers for distinct texts and numbers : END
	
	
	// Providers for consecutive numbering : BEGIN
	
	private static Long EXTERNAL_ID = 1000000000L;
	public static String getNextExternalId() {
		return String.valueOf(EXTERNAL_ID++);
	}
	
	// Providers for consecutive numbering : END
	
	
	// Org defaults : BEGIN
	
	private static final Organization ORG_INFO = [SELECT Id, InstanceName FROM Organization LIMIT 1];
	
	private static final User THIS_USER = new User(Id = UserInfo.getUserId()); // needed to perform setup operations using System.runAs(THIS_USER) { ... }
	
	// Org defaults : END
	
	
	// Custom configuration object '' : BEGIN
	
	// Custom configuration object '' : END
	
	
	// Custom setting '' : BEGIN
	
	// Custom setting '' : END
	
	
	// Setup object '' : BEGIN
	
	// Setup object '' : END
	
	
	// Convenience access to Product2, Pricebook2, and PricebookEntry : END
	
	private static Pricebook2 standardPricebook = null;
	private static Pricebook2 customPricebook = null;
	private static Product2 dummyProduct = null;
	private static PricebookEntry dummyPricebookEntry = null;
	
	public static ID getStandardPricebookId() {
		if (standardPricebook == null) {
			try {
				standardPricebook = [SELECT Id, Name, IsActive FROM Pricebook2 WHERE IsStandard = TRUE LIMIT 1];
			} catch (Exception ex) {
				standardPricebook = new Pricebook2(Id = Test.getStandardPricebookId(), Name = 'Standard Pricebook', IsActive = true);
				if (standardPricebook.Id == null) {
					insert standardPricebook;
				}
			}
		}
		return standardPricebook.Id;
	}
	
	public static ID getCustomPricebookId() {
		if (customPricebook == null) {
			try {
				customPricebook = [SELECT Id, Name, IsActive FROM Pricebook2 WHERE Name = 'CustomPricebook' LIMIT 1];
			} catch (Exception ex) {
				customPricebook = new Pricebook2(Name = 'CustomPricebook', IsActive = true);
				if (customPricebook.Id == null) {
					insert customPricebook;
				}
			}
		}
		return customPricebook.Id;
	}
	
	public static ID getDummyProductId() {
		if (dummyProduct == null) {
			try{
				dummyProduct = [SELECT Id, Name FROM Product2 WHERE Name='DUMMY PRODUCT' LIMIT 1];
			}catch (Exception ex){
				dummyProduct = new Product2(Name = 'DUMMY PRODUCT');
				insert dummyProduct;
			}
		}
		return dummyProduct.Id;
	}
	
	public static ID getDummyPricebookEntryId() {
		if (dummyPricebookEntry == null) {
			try{
				dummyPricebookEntry = [SELECT Id, Product2Id, Pricebook2Id, UnitPrice, UseStandardPrice FROM PricebookEntry WHERE Product2Id = :getDummyProductId() AND Pricebook2Id = :getCustomPricebookId() LIMIT 1];
			}catch (Exception ex){
				PricebookEntry stdPricebookEntry = new PricebookEntry(Product2Id = getDummyProductId(), Pricebook2Id = getStandardPricebookId(), UnitPrice = 1.0);
				dummyPricebookEntry = new PricebookEntry(Product2Id = getDummyProductId(), Pricebook2Id = getCustomPricebookId(), UnitPrice = 1.0);
				insert new List<PricebookEntry> {stdPricebookEntry, dummyPricebookEntry};
			}
		}
		return dummyPricebookEntry.Id;
	}
	
	public static void initPriceBooks() {
		getStandardPricebookId();
		getCustomPricebookId();
		getDummyProductId();
		getDummyPricebookEntryId();
	}
	
	@IsTest(SeeAllData=false)
	static void test_PriceBooks() {
		Test.startTest();
		initPriceBooks();
		Test.stopTest();
	}
	
	// Convenience access to Product2, Pricebook2, and PricebookEntry : END
	
	
	/*
	 * --- ADD MORE IF NEEDED ---
	 * DISTINCT VALUE PROVIDERS, CONFIGURATION DATA, STATIC INITIALIZERS : END
	 */
	
	
	/*
	 * OBJECT FACTORY IMPLEMENTATION : BEGIN
	 * --- IMPLEMENT SOBJECT WRAPPER CLASSES AND THEIR ACCESSOR METHODS ---
	 */
	
	
	public {{ api_name }}() {
		// empty constructor
	}
	
	
	/*
	 * --- IMPLEMENT SOBJECT WRAPPER CLASSES AND THEIR ACCESSOR METHODS ---
	 * OBJECT FACTORY IMPLEMENTATION : END
	 */
	
	
	// TODO add further implementation here (use templates from below)
	
	
	// -------------------------------------------------------------------------------------------------------------- //
	
	
	/* ------------------------------------------------------------------------------------------------------------------------------------------- *
	 * Template for custom objects:                                                                                                                *
	 *  - Copy the template text below into your unit test data factory implementation.                                                            *
	 *  - Replace "CustomObject__c" with the appropriate object's API name.                                                                        *
	 *  - Replace "CustomObject_c" with wrapper class' identifyer.                                                                                 *
	 *  - If there is a parent wrapper you need, build it using the code commented out and replace "ParentObject_c"/"ParentObject__c" accordingly. *
	 *  - Verify that the implementations of getDefaultRecordType() and getDefaultInitializerData() return the correct data.                       *
	 *  - Complete the implementation of the initialize() method.                                                                                  *
	 * ------------------------------------------------------------------------------------------------------------------------------------------- */
	
	/*
	// CustomObject__c : CustomObject_cWrapper : BEGIN
	
	public virtual class CustomObject_cWrapper extends SObjectWrapper {
		// public ParentObject_cWrapper par_objW {get; private set;}
		public CustomObject_cWrapper() {
			super();
		}
		protected override System.Type getDefaultWrapperType() {
			return CustomObject_cWrapper.class;
		}
		protected override Schema.SObjectType getDefaultSObjectType() {
			return CustomObject__c.SObjectType;
		}
		protected override RecordType getDefaultRecordType() {
			return null; // use either no RecordType or Org default
		}
		protected override Object[] getDefaultInitializerData() {
			return null; // use no additional data to initialize wrapper
		}
		protected override void initialize() {
			super.initialize();
			// par_objW = (ParentObject_cWrapper) getParentInstance(ParentObject_cWrapper.class, false, true, true);
			// ParentObject__c par_obj = (ParentObject__c) par_objW.getSObject();
			CustomObject__c theObj = (CustomObject__c) getSObject();
			theObj.Name = NAMES.getNext();
		}
	}
	
	public List<CustomObject_cWrapper> getNewCustomObject_cWrappers(Integer amount, Integer cascadeNewLevel) {
		List<CustomObject_cWrapper> result = new List<CustomObject_cWrapper>();
		getNewWrappers(CustomObject_cWrapper.class, amount, cascadeNewLevel, true, result);
		return result;
	}
	public CustomObject_cWrapper getCustomObject_cWrapper(Boolean forceNew, Integer cascadeNewLevel) {
		return (CustomObject_cWrapper) getWrapper(CustomObject_cWrapper.class, forceNew, cascadeNewLevel, true);
	}
	public CustomObject__c getCustomObject_c(Boolean forceNew, Integer cascadeNewLevel) {
		return (CustomObject__c) getCustomObject_cWrapper(forceNew, cascadeNewLevel).getSObject();
	}
	public CustomObject__c getCustomObject_c() {
		return getCustomObject_c(false, 0);
	}
	public List<CustomObject_cWrapper> createNewCustomObject_cWrappers(Integer amount, Integer cascadeNewLevel) {
		return (List<CustomObject_cWrapper>) persist(getNewCustomObject_cWrappers(amount, cascadeNewLevel));
	}
	public CustomObject_cWrapper createCustomObject_cWrapper(Boolean forceNew, Integer cascadeNewLevel) {
		return (CustomObject_cWrapper) getCustomObject_cWrapper(forceNew, cascadeNewLevel).persist();
	}
	public CustomObject__c createCustomObject_c(Boolean forceNew, Integer cascadeNewLevel) {
		return (CustomObject__c) createCustomObject_cWrapper(forceNew, cascadeNewLevel).getSObject();
	}
	public CustomObject__c createCustomObject_c() {
		return createCustomObject_c(false, 0);
	}
	
	@IsTest(seeAllData=false)
	static void test_CustomObject_c() {
		{{ api_name }} data = {{ api_name }}.instance();
		Test.startTest();
		data.getCustomObject_c();
		data.createCustomObject_c();
		data.createNewCustomObject_cWrappers(1, 0);
		Test.stopTest();
	}
	
	// CustomObject__c : CustomObject_cWrapper : END
	*/
	
	
	// -------------------------------------------------------------------------------------------------------------- //
	
	
	/* ------------------------------------------------------------------------------------------------------------------------------------------- *
	 * Template for subclassing:                                                                                                                   *
	 *  - Copy the template text below into your unit test data factory implementation.                                                            *
	 *  - Replace "CustomObject__c" with the appropriate object's API name.                                                                        *
	 *  - Replace "CustomObject_cSuper" with wrapper class' identifyer.                                                                            *
	 *  - If there is a parent wrapper you need, build it using the code commented out and replace "ParentObject_c"/"ParentObject__c" accordingly. *
	 *  - Complete the implementation of the initialize() method.                                                                                  *
	 * ------------------------------------------------------------------------------------------------------------------------------------------- */
	
	/*
	// CustomObject__c : CustomObject_cSuperWrapper : BEGIN
	
	public abstract class CustomObject_cSuperWrapper extends SObjectWrapper {
		// public ParentObject_cWrapper par_objW {get; private set;}
		public CustomObject_cSuperWrapper() {
			super();
		}
		protected override Schema.SObjectType getDefaultSObjectType() {
			return CustomObject__c.SObjectType;
		}
		protected override virtual void initialize() {
			super.initialize();
			// par_objW = (ParentObject_cWrapper) getParentInstance(ParentObject_cWrapper.class, false, true, true);
			// ParentObject__c par_obj = (ParentObject__c) par_objW.getSObject();
			CustomObject__c theObj = (CustomObject__c) getSObject();
		}
	}
	
	// TODO implement subclasses extending SuperObject_cWrapper here using the other template from above, e.g.
	// public virtual class CustomObject_cWrapper extends CustomObject_cSuperWrapper { ... }
	
	// CustomObject__c : CustomObject_cSuperWrapper : END
	*/
	
	
}

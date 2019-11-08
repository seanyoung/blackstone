pragma solidity ^0.5;

import "commons-base/BaseErrors.sol";
import "commons-base/SystemOwned.sol";
import "commons-utils/DataTypes.sol";
import "commons-utils/TypeUtilsLib.sol";
import "commons-auth/Organization.sol";
import "commons-auth/UserAccount.sol";
import "commons-auth/DefaultUserAccount.sol";
import "commons-auth/DefaultOrganization.sol";
import "commons-management/AbstractDbUpgradeable.sol";
import "commons-management/ArtifactsFinderEnabled.sol";
import "commons-management/ArtifactsRegistry.sol";
import "commons-management/DefaultArtifactsRegistry.sol";
import "bpm-model/BpmModel.sol";
import "bpm-model/ProcessModelRepository.sol";
import "bpm-model/ProcessModelRepositoryDb.sol";
import "bpm-model/DefaultProcessModelRepository.sol";
import "bpm-model/ProcessModel.sol";
import "bpm-model/ProcessDefinition.sol";
import "bpm-model/ProcessDefinition.sol";
import "bpm-model/DefaultProcessDefinition.sol";
import "bpm-runtime/BpmRuntime.sol";
import "bpm-runtime/BpmService.sol";
import "bpm-runtime/BpmServiceDb.sol";
import "bpm-runtime/DefaultBpmService.sol";
import "bpm-runtime/ProcessInstance.sol"; 
import "bpm-runtime/DefaultProcessInstance.sol"; 
import "bpm-runtime/ApplicationRegistry.sol";
// import "bpm-runtime/ApplicationRegistryDb.sol";
// import "bpm-runtime/DefaultApplicationRegistry.sol";

import "agreements/ActiveAgreementRegistry.sol";
import "agreements/DefaultActiveAgreementRegistry.sol";
import "agreements/ArchetypeRegistry.sol";
// import "agreements/ArchetypeRegistryDb.sol";
// import "agreements/DefaultArchetypeRegistry.sol";
import "agreements/DefaultArchetype.sol";
import "agreements/AgreementSignatureCheck.sol";

contract ActiveAgreementWorkflowTest {

	using TypeUtilsLib for bytes32;
	using TypeUtilsLib for bytes;

	string constant EMPTY_STRING = "";

	// test data
	bytes32 activityId1 = "activity1";
	bytes32 activityId2 = "activity2";
	bytes32 activityId3 = "activity3";

	bytes32 user1Id = "iamuser1";
	bytes32 user2Id = "iamuser2";
	bytes32 user3Id = "iamuser3";

	bytes32 appIdSignatureCheck = "AgreementSignatureCheck";

	bytes32 participantId1 = "Participant1";
	bytes32 participantId2 = "Participant2";

	bytes32 departmentId1 = "Dep1";

	address[] parties;
    address[] approvers;

	// tests should overwrite the users and orgs as needed
	Organization org1;
	Organization org2;
	UserAccount userAccount1;
	UserAccount userAccount2;
	UserAccount userAccount3;
	UserAccount nonPartyAccount;

	string constant SUCCESS = "success";
	string constant dummyModelFileReference = "{json grant}";
	bytes32 EMPTY = "";
	bytes32 DATA_FIELD_AGREEMENT_PARTIES = "AGREEMENT_PARTIES";

	address[] governingArchetypes;
	address[] governingAgreements;

	BpmService bpmService;
	ArchetypeRegistry archetypeRegistry;
	ProcessModelRepository processModelRepository;
	ApplicationRegistry applicationRegistry;

	DefaultActiveAgreement defaultAgreementImpl = new DefaultActiveAgreement();
	DefaultArchetype defaultArchetypeImpl = new DefaultArchetype();
	ProcessModel defaultProcessModelImpl = new DefaultProcessModel();
	ProcessDefinition defaultProcessDefinitionImpl = new DefaultProcessDefinition();
	ProcessInstance defaultProcessInstanceImpl = new DefaultProcessInstance();
	ArtifactsRegistry artifactsRegistry;
	string constant serviceIdBpmService = "agreements-network/services/BpmService";
	string constant serviceIdArchetypeRegistry = "agreements-network/services/ArchetypeRegistry";
	string constant serviceIdModelRepository = "agreements-network/services/ProcessModelRepository";
	string constant serviceIdApplicationRegistry = "agreements-network/services/ApplicationRegistry";

	// re-usable entities as storage variables to avoid "stack too deep" problems in tests
	TestRegistry agreementRegistry;

	/**
	 * @dev Constructor for the test creates the dependencies that the ActiveAgreementRegistry needs
	 */
	constructor (ArchetypeRegistry _archetypeRegistry, ApplicationRegistry _applicationRegistry) public {
		// BpmService
		BpmServiceDb bpmServiceDb = new BpmServiceDb();
		bpmService = new DefaultBpmService(serviceIdModelRepository, serviceIdApplicationRegistry);
		bpmServiceDb.transferSystemOwnership(address(bpmService));
		require(AbstractDbUpgradeable(address(bpmService)).acceptDatabase(address(bpmServiceDb)), "BpmServiceDb not set");

		// ArchetypeRegistry
		// ArchetypeRegistryDb archRegistryDb = new ArchetypeRegistryDb();
		// archetypeRegistry = new DefaultArchetypeRegistry();
		// archRegistryDb.transferSystemOwnership(archetypeRegistry);
		// require(AbstractDbUpgradeable(archetypeRegistry).acceptDatabase(archRegistryDb), "ArchetypeRegistryDb not set");
		archetypeRegistry = _archetypeRegistry;

		// ProcessModelRegistry
		ProcessModelRepositoryDb modelDb = new ProcessModelRepositoryDb();
		processModelRepository = new DefaultProcessModelRepository();
		modelDb.transferSystemOwnership(address(processModelRepository));
		require(AbstractDbUpgradeable(address(processModelRepository)).acceptDatabase(address(modelDb)), "ProcessModelRepositoryDb not set");

		// ApplicatonRegistry
		// ApplicationRegistryDb appDb = new ApplicationRegistryDb();
		// applicationRegistry = new DefaultApplicationRegistry();
		// appDb.transferSystemOwnership(applicationRegistry);
		// require(AbstractDbUpgradeable(applicationRegistry).acceptDatabase(appDb), "ApplicationRegistryDb not set");
		applicationRegistry = _applicationRegistry;

		// ArtifactsRegistry
		artifactsRegistry = new DefaultArtifactsRegistry();
        DefaultArtifactsRegistry(address(artifactsRegistry)).initialize();
		artifactsRegistry.registerArtifact(serviceIdBpmService, address(bpmService), bpmService.getArtifactVersion(), true);
		artifactsRegistry.registerArtifact(serviceIdArchetypeRegistry, address(archetypeRegistry), archetypeRegistry.getArtifactVersion(), true);
		artifactsRegistry.registerArtifact(serviceIdModelRepository, address(processModelRepository), processModelRepository.getArtifactVersion(), true);
		artifactsRegistry.registerArtifact(serviceIdApplicationRegistry, address(applicationRegistry), applicationRegistry.getArtifactVersion(), true);
        artifactsRegistry.registerArtifact(archetypeRegistry.OBJECT_CLASS_ARCHETYPE(), address(defaultArchetypeImpl), defaultArchetypeImpl.getArtifactVersion(), true);
        artifactsRegistry.registerArtifact(processModelRepository.OBJECT_CLASS_PROCESS_MODEL(), address(defaultProcessModelImpl), defaultProcessModelImpl.getArtifactVersion(), true);
        artifactsRegistry.registerArtifact(processModelRepository.OBJECT_CLASS_PROCESS_DEFINITION(), address(defaultProcessDefinitionImpl), defaultProcessDefinitionImpl.getArtifactVersion(), true);
        artifactsRegistry.registerArtifact(bpmService.OBJECT_CLASS_PROCESS_INSTANCE(), address(defaultProcessInstanceImpl), defaultProcessInstanceImpl.getArtifactVersion(), true);
		ArtifactsFinderEnabled(address(processModelRepository)).setArtifactsFinder(address(artifactsRegistry));
		ArtifactsFinderEnabled(address(archetypeRegistry)).setArtifactsFinder(address(artifactsRegistry));
		ArtifactsFinderEnabled(address(bpmService)).setArtifactsFinder(address(artifactsRegistry));
	}

	/**
	 * @dev Creates and returns a new ActiveAgreementRegistry using an existing ArchetypeRegistry and BpmService.
	 * This function can be used in the beginning of a test to have a fresh BpmService instance.
	 */
	function createNewAgreementRegistry() internal returns (TestRegistry) {
		TestRegistry newRegistry = new TestRegistry(serviceIdArchetypeRegistry, serviceIdBpmService);
		ActiveAgreementRegistryDb agreementRegistryDb = new ActiveAgreementRegistryDb();
		SystemOwned(agreementRegistryDb).transferSystemOwnership(address(newRegistry));
		AbstractDbUpgradeable(newRegistry).acceptDatabase(address(agreementRegistryDb));
		ArtifactsFinderEnabled(newRegistry).setArtifactsFinder(address(artifactsRegistry));
        artifactsRegistry.registerArtifact(newRegistry.OBJECT_CLASS_AGREEMENT(), address(defaultAgreementImpl), defaultAgreementImpl.getArtifactVersion(), true);
		// check that dependencies are wired correctly
		require (address(newRegistry.getArchetypeRegistry()) != address(0), "ArchetypeRegistry in new ActiveAgreementRegistry not found");
		require (address(newRegistry.getArchetypeRegistry()) == address(archetypeRegistry), "ArchetypeRegistry in ActiveAgreementRegistry address mismatch");
		require (address(newRegistry.getBpmService()) != address(0), "ProcessModelRepository in new BpmService not found");
		require (address(newRegistry.getBpmService()) == address(bpmService), "ProcessModelRepository in BpmService address mismatch");
		return newRegistry;
	}

	/**
	 * @dev Tests the DefaultActiveAgreementRegistry.transferAddressScopes function
	 */
	function testAddressScopeTransfer() external returns (string memory) {

		// re-usable variables for return values
		uint error;
		address addr;

		agreementRegistry = createNewAgreementRegistry();

		// make an agreement with fields of type address and add role qualifiers.
		addr = archetypeRegistry.createArchetype(10, false, true, address(this), address(this), address(0), address(0), EMPTY, governingArchetypes);
		ActiveAgreement agreement = new DefaultActiveAgreement();
		agreement.initialize(addr, address(this), address(this), "", false, parties, governingAgreements);
		agreement.setDataValueAsBytes32("AgreementRoleField43", "SellerRole");
		// Adding two scopes to the agreement:
		// 1. Buyer context: a fixed scope for the msg.sender
		// 2. Seller context: a conditional scope for this test address
		agreement.setAddressScope(msg.sender, "Buyer", "BuyerRole", EMPTY, EMPTY, address(0));
		agreement.setAddressScope(address(this), "Seller", EMPTY, "AgreementRoleField43", EMPTY, address(0));

		// make a model with participants that point to fields on the agreement
		ProcessModel pm;
		(error, addr) = processModelRepository.createProcessModel("RoleQualifiers", [1,0,0], address(this), false, dummyModelFileReference);
		if (addr == address(0)) return "Unable to create a ProcessModel";
		pm = ProcessModel(addr);
		pm.addParticipant(participantId1, address(0), "Buyer", agreementRegistry.DATA_ID_AGREEMENT(), address(0));
		pm.addParticipant(participantId2, address(0), "Seller", agreementRegistry.DATA_ID_AGREEMENT(), address(0));
		// make a ProcessDefinition with activities that use the participants
		addr = pm.createProcessDefinition("RoleQualifierProcess", address(artifactsRegistry));
		ProcessDefinition pd = ProcessDefinition(addr);
		error = pd.createActivityDefinition(activityId1, BpmModel.ActivityType.TASK, BpmModel.TaskType.USER, BpmModel.TaskBehavior.SENDRECEIVE, participantId1, false, EMPTY, EMPTY, EMPTY);
		error = pd.createActivityDefinition(activityId2, BpmModel.ActivityType.TASK, BpmModel.TaskType.NONE, BpmModel.TaskBehavior.SEND, EMPTY, false, EMPTY, EMPTY, EMPTY);
		error = pd.createActivityDefinition(activityId3, BpmModel.ActivityType.TASK, BpmModel.TaskType.USER, BpmModel.TaskBehavior.SENDRECEIVE, participantId2, false, EMPTY, EMPTY, EMPTY);
		pd.createTransition(activityId1, activityId2);
		pd.createTransition(activityId2, activityId3);
		(bool valid, bytes32 errorMsg) = pd.validate();
		if (!valid) return errorMsg.toString();

		// create a PI with agreement
		ProcessInstance pi = new DefaultProcessInstance();
		pi.initialize(address(pd), address(this), EMPTY);
		pi.setDataValueAsAddress(agreementRegistry.DATA_ID_AGREEMENT(), address(agreement));

		// function under test
		agreementRegistry.transferAddressScopes(pi);

		bytes32[] memory newKeys = pi.getAddressScopeKeys();
		if (newKeys.length != 2) return "There should be 2 address scopes on the PI after transfer";
		// test if activity IDs were tagged correctly with address scopes. Activity1 is the Buyer, Activity2 the Seller
		if (pi.resolveAddressScope(msg.sender, activityId1, pi) != "BuyerRole") return "Scope for msg.sender on activity1 not correct after transfer to PI";
		( , , , addr) = pi.getAddressScopeDetails(address(this), activityId3);
		if (addr != address(agreement)) return "The ConditionalData of the address scope for activity3 should've been transformed to use the address of the agreement";
		if (pi.resolveAddressScope(address(this), activityId3, pi) != "SellerRole") return "Scope for address(this) on activity3 not correct after transfer to PI";

		return SUCCESS;
	}

	/**
	 * @dev Tests the handling of combinations of formation and execution processes, i.e. the lack of processes, in the ActiveAgreementRegistry.startProcessLifecycle function
	 */
	function testAgreementProcessLifecycle() external returns (string memory) {

		uint error;
		address addr;
		bool success;
		bytes32 errorMsg;

		agreementRegistry = createNewAgreementRegistry();

		ProcessModel pm;
		ProcessDefinition formationPD;
		ProcessDefinition executionPD;
		delete parties;
		// the parties to the agreement are: one user, one org, and one org with department scope
		parties.push(address(this));

		(error, addr) = processModelRepository.createProcessModel("FormationExecution", [1,0,0], address(userAccount1), false, dummyModelFileReference);
		if (addr == address(0)) return "Unable to create a ProcessModel";
		pm = ProcessModel(addr);
		// Formation Process
		addr = pm.createProcessDefinition("FormationProcess", address(artifactsRegistry));
		formationPD = ProcessDefinition(addr);
		error = formationPD.createActivityDefinition(activityId1, BpmModel.ActivityType.TASK, BpmModel.TaskType.NONE, BpmModel.TaskBehavior.SEND, EMPTY, false, EMPTY, EMPTY, EMPTY);
		if (error != BaseErrors.NO_ERROR()) return "Error creating NONE task for formation process definition";
		(success, errorMsg) = formationPD.validate();
		if (!success) return errorMsg.toString();
		// Execution Process
		addr = pm.createProcessDefinition("ExecutionProcess", address(artifactsRegistry));
		executionPD = ProcessDefinition(addr);
		error = executionPD.createActivityDefinition(activityId1, BpmModel.ActivityType.TASK, BpmModel.TaskType.NONE, BpmModel.TaskBehavior.SEND, EMPTY, false, EMPTY, EMPTY, EMPTY);
		if (error != BaseErrors.NO_ERROR()) return "Error creating NONE task for execution process definition";
		(success, errorMsg) = executionPD.validate();
		if (!success) return errorMsg.toString();

		ActiveAgreement agreement;

		//
		// COMBO 1: Formation, but no execution
		//
		addr = archetypeRegistry.createArchetype(10, false, true, address(this), address(this), address(formationPD), address(0), EMPTY, governingArchetypes);
		if (addr == address(0)) return "Error creating Combo1Archetype, address is empty";
		agreement = ActiveAgreement(agreementRegistry.createAgreement(addr, address(this), address(this), "", false, parties, EMPTY, governingAgreements));
		(error, addr) = agreementRegistry.startProcessLifecycle(ActiveAgreement(agreement));
		if (error != BaseErrors.NO_ERROR()) return "Error starting formation / no execution combo";
		if (addr == address(0)) return "Starting formation / no execution combo should return a PI address for formation";
		if (ProcessInstance(addr).getProcessDefinition() != address(formationPD)) return "Starting formation / no execution combo should return an instance of formationPD";

		//
		// COMBO 2: Execution, but no formation
		//
		addr = archetypeRegistry.createArchetype(10, false, true, address(this), address(this), address(0), address(executionPD), EMPTY, governingArchetypes);
		if (addr == address(0)) return "Error creating Combo2Archetype, address is empty";
		agreement = ActiveAgreement(agreementRegistry.createAgreement(addr, address(this), address(this), "", false, parties, EMPTY, governingAgreements));
		// First try fail, because agreement is not executed
		(success, ) = address(agreementRegistry).call(abi.encodeWithSignature("startProcessLifecycle(address)", address(agreement)));
		if (success)
			return "Starting no formation / execution combo with a non-executed agreement should fail ";
		agreement.sign();
		(error, addr) = agreementRegistry.startProcessLifecycle(ActiveAgreement(agreement));
		if (error != BaseErrors.NO_ERROR()) return "Error starting no formation / execution combo";
		if (addr == address(0)) return "Starting no formation / execution combo should return a PI address for execution";
		if (ProcessInstance(addr).getProcessDefinition() != address(executionPD)) return "Starting no formation / execution combo should return an instance of executionPD";

		//
		// COMBO 1: No formation, no execution
		//
		addr = archetypeRegistry.createArchetype(10, false, true, address(this), address(this), address(0), address(0), EMPTY, governingArchetypes);
		if (addr == address(0)) return "Error creating Combo3Archetype, address is empty";
		agreement = ActiveAgreement(agreementRegistry.createAgreement(addr, address(this), address(this), "", false, parties, EMPTY, governingAgreements));
		(error, addr) = agreementRegistry.startProcessLifecycle(ActiveAgreement(agreement));
		if (error != 0) return "Expected empty error code starting no formation / no execution combo";
		if (addr != address(0)) return "Expected no address starting no formation / no execution combo";

		return SUCCESS;
	}

	/**
	 * Tests a typical AN workflow with a multi-instance signing activity that produces an executed agreement
	 */
	function testExecutedAgreementWorkflow() external returns (string memory) {

		// re-usable variables for return values
		uint error;
		address addr;
		bool success;
		bytes memory returnData;
		bytes32 errorMsg;
		uint8 state;
		uint piCounter;
		uint aiCounter;
		ProcessDefinition formationPD;
		ProcessDefinition executionPD;
	
		agreementRegistry = createNewAgreementRegistry();

		TestSignatureCheck signatureCheckApp = new TestSignatureCheck();
		applicationRegistry.addApplication("AgreementSignatureCheck", BpmModel.ApplicationType.WEB, address(signatureCheckApp), bytes4(EMPTY), EMPTY);

		//
		// ORGS/USERS
		//
		// create additional users via constructor
		userAccount1 = new DefaultUserAccount();
		userAccount1.initialize(address(this), address(0));
		userAccount2 = new DefaultUserAccount();
		userAccount2.initialize(address(this), address(0));
		userAccount3 = new DefaultUserAccount();
		userAccount3.initialize(address(this), address(0));
		nonPartyAccount = new DefaultUserAccount();
		nonPartyAccount.initialize(address(this), address(0));

		org1 = new DefaultOrganization();
		org1.initialize(approvers, EMPTY);
		org2 = new DefaultOrganization();
		org2.initialize(approvers, EMPTY);
		org1.addUserToDepartment(address(userAccount2), EMPTY);
		org2.addDepartment(departmentId1);
		if (!org2.addUserToDepartment(address(userAccount3), departmentId1)) return "Failed to add user3 to department1";

		delete parties;
		// the parties to the agreement are: one user, one org, and one org with department scope
		parties.push(address(userAccount1));
		parties.push(address(org1));
		parties.push(address(org2));

		//
		// BPM
		//
		ProcessModel pm;
		(error, addr) = processModelRepository.createProcessModel("AN-Model", [1,0,0], address(userAccount1), false, dummyModelFileReference);
		if (addr == address(0)) return "Unable to create a ProcessModel";
		pm = ProcessModel(addr);
		pm.addParticipant(participantId1, address(0), DATA_FIELD_AGREEMENT_PARTIES, agreementRegistry.DATA_ID_AGREEMENT(), address(0));
		// Formation Process
		addr = pm.createProcessDefinition("FormationProcess", address(artifactsRegistry));
		formationPD = ProcessDefinition(addr);
		error = formationPD.createActivityDefinition(activityId1, BpmModel.ActivityType.TASK, BpmModel.TaskType.USER, BpmModel.TaskBehavior.SENDRECEIVE, participantId1, true, appIdSignatureCheck, EMPTY, EMPTY);
		if (error != BaseErrors.NO_ERROR()) return "Error creating USER task for formation process definition";
		formationPD.createDataMapping(activityId1, BpmModel.Direction.IN, "agreement", "agreement", EMPTY, address(0));
		(success, errorMsg) = formationPD.validate();
		if (!success) return errorMsg.toString();
		// Execution Process
		addr = pm.createProcessDefinition("ExecutionProcess", address(artifactsRegistry));
		executionPD = ProcessDefinition(addr);
		error = executionPD.createActivityDefinition(activityId1, BpmModel.ActivityType.TASK, BpmModel.TaskType.NONE, BpmModel.TaskBehavior.SEND, EMPTY, false, EMPTY, EMPTY, EMPTY);
		if (error != BaseErrors.NO_ERROR()) return "Error creating NONE task for execution process definition";
		(success, errorMsg) = executionPD.validate();
		if (!success) return errorMsg.toString();

		//
		// ARCHETYPE
		//
		addr = archetypeRegistry.createArchetype(10, false, true, address(this), address(this), address(formationPD), address(executionPD), EMPTY, governingArchetypes);
		if (addr == address(0)) return "Error creating TestArchetype, address is empty";

		//
		// AGREEMENT
		//
		address agreement = agreementRegistry.createAgreement(addr, address(this), address(this), "", false, parties, EMPTY, governingAgreements);
		// Org2 has a department, so we're setting the additional context on the agreement
		ActiveAgreement(agreement).setAddressScope(address(org2), DATA_FIELD_AGREEMENT_PARTIES, departmentId1, EMPTY, EMPTY, address(0));
		//TODO we currently don't support a negotiation phase in the AN, so the agreement's prose contract is already formulated when the agreement is created.
		if (ActiveAgreement(agreement).getLegalState() != uint8(Agreements.LegalState.FORMULATED)) return "The agreement should be in FORMULATED state";

		//
		// FORMATION / EXECUTION
		//
		piCounter = bpmService.getNumberOfProcessInstances();
		aiCounter = bpmService.getBpmServiceDb().getNumberOfActivityInstances();
		(error, addr) = agreementRegistry.startProcessLifecycle(ActiveAgreement(agreement));
		if (error != BaseErrors.NO_ERROR()) return "Error starting the formation on agreement";
		if (ActiveAgreement(agreement).getLegalState() != uint8(Agreements.LegalState.FORMULATED)) return "The agreement should be in FORMULATED state";

		ProcessInstance pi;
		if (bpmService.getNumberOfProcessInstances() != piCounter+1) return "There should be +1 PI in the system after agreement formation start";
		if (bpmService.getBpmServiceDb().getNumberOfActivityInstances() != aiCounter+3) return "There should be +3 AIs total";
		pi = ProcessInstance(bpmService.getProcessInstanceAtIndex(piCounter));
		if (pi.getState() != uint8(BpmRuntime.ProcessInstanceState.ACTIVE)) return "The Formation PI should be active";
		( , , , addr, , state) = pi.getActivityInstanceData(pi.getActivityInstanceAtIndex(0));
		if (state != uint8(BpmRuntime.ActivityInstanceState.SUSPENDED)) return "Activity1 in Formation Process should be suspended";
		if (addr != address(userAccount1)) return "userAccount1 should be the performer of activity1";

		// the agreement should NOT be available as IN data via the application at this point since the user is still the performer!
		(success, ) = address(signatureCheckApp).call(abi.encodeWithSignature("getInDataAgreement(bytes32)", pi.getActivityInstanceAtIndex(0)));
		if (success)
			return "Retrieving IN data via the application should REVERT while the user is still the performer";

		// test fail on invalid user
		returnData = nonPartyAccount.forwardCall(address(pi), abi.encodeWithSignature("completeActivity(bytes32,address)", pi.getActivityInstanceAtIndex(0), bpmService));
		// TODO use solidity 0.5 decode
		if (returnData.toUint() != BaseErrors.INVALID_ACTOR()) return "Attempting to complete the Sign activity with an unassigned user should fail.";
		( , , , , , state) = pi.getActivityInstanceData(pi.getActivityInstanceAtIndex(0));
		if (state != uint8(BpmRuntime.ActivityInstanceState.SUSPENDED)) return "Activity1 in Formation Process should still be suspended after wrong user attempt";
		// test fail on unsigned agreement
		returnData = userAccount1.forwardCall(address(pi), abi.encodeWithSignature("completeActivity(bytes32,address)", pi.getActivityInstanceAtIndex(0), bpmService));
		// TODO use solidity 0.5 decode
		if (returnData.toUint() != BaseErrors.RUNTIME_ERROR()) return "Attempting to complete the Sign activity without signing the agreement should fail";
		( , , , addr, , state) = pi.getActivityInstanceData(pi.getActivityInstanceAtIndex(0));
		if (state != uint8(BpmRuntime.ActivityInstanceState.SUSPENDED)) return "Activity1 in Formation Process should still be suspended after completion attempt without signing";
		if (addr != address(userAccount1)) return "userAccount1 should still be the performer of activity1 even after completion failed";

		// test successful completion
		userAccount1.forwardCall(address(agreement), abi.encodeWithSignature("sign()"));
		userAccount1.forwardCall(address(pi), abi.encodeWithSignature("completeActivity(bytes32,address)", pi.getActivityInstanceAtIndex(0), bpmService));
		( , , , , , state) = pi.getActivityInstanceData(pi.getActivityInstanceAtIndex(0));
		if (state != uint8(BpmRuntime.ActivityInstanceState.COMPLETED)) return "ActivityInstance 1 in Formation Process should be completed";

		// verify that the signature app had access to the agreement data mapping
		if (signatureCheckApp.lastAgreement() != address(agreement)) return "The agreement should've been processed by the TestSignatureCheck app.";

		// complete the missing signatures and tasks
		userAccount2.forwardCall(address(agreement), abi.encodeWithSignature("sign()"));
		userAccount2.forwardCall(address(pi), abi.encodeWithSignature("completeActivity(bytes32,address)", pi.getActivityInstanceAtIndex(1), bpmService));
		( , , , , , state) = pi.getActivityInstanceData(pi.getActivityInstanceAtIndex(1));
		if (state != uint8(BpmRuntime.ActivityInstanceState.COMPLETED)) return "ActivityInstance 2 in Formation Process should be completed";

		userAccount3.forwardCall(address(agreement), abi.encodeWithSignature("sign()"));

		( , , ,addr , , ) = pi.getActivityInstanceData(pi.getActivityInstanceAtIndex(2));
		if (addr != address(org2)) return "ActivityInstance3 should have org2 as performer";
		if (pi.resolveAddressScope(address(org2), activityId1, pi) != departmentId1) return "Org2 in context of activity1 should show the additional department scope";
		// check upfront if the user/org/department context is authorized which is used in the following activity completion
		if (!org2.authorizeUser(address(userAccount3), departmentId1)) return "User3 should be authorized for dep1 in org2";
		userAccount3.forwardCall(address(pi), abi.encodeWithSignature("completeActivity(bytes32,address)", pi.getActivityInstanceAtIndex(2), bpmService));
		( , , , , , state) = pi.getActivityInstanceData(pi.getActivityInstanceAtIndex(2));
		if (state != uint8(BpmRuntime.ActivityInstanceState.COMPLETED)) return "ActivityInstance 3 in Formation Process should be completed";

		// AIs 1-3 should all be completed now and the process has moved into execution
		if (bpmService.getNumberOfProcessInstances() != piCounter+2) return "There should be +2 PIs in the system after agreement formation is completed";
		if (bpmService.getBpmServiceDb().getNumberOfActivityInstances() != aiCounter+4) return "There should be +4 AIs total";
		pi = ProcessInstance(bpmService.getProcessInstanceAtIndex(piCounter+1));
		if (pi.getState() != uint8(BpmRuntime.ProcessInstanceState.COMPLETED)) return "The Execution PI should be completed";
		if (ActiveAgreement(agreement).getLegalState() != uint8(Agreements.LegalState.FULFILLED)) return "The agreement should be in FULFILLED state";

		return SUCCESS;
	}

	/**
	 * Tests workflow handling where the agreement gets cancelled during formation as well as execution.
	 */
	function testCanceledAgreementWorkflow() external returns (string memory) {

		// re-usable variables for return values
		uint error;
		address addr;
		bool valid;
		bytes32 errorMsg;
		ProcessDefinition formationPD;
		ProcessDefinition executionPD;
		uint numberOfPIs;
	
		agreementRegistry = createNewAgreementRegistry();

		userAccount1 = new DefaultUserAccount();
		userAccount1.initialize(address(this), address(0));
		userAccount2 = new DefaultUserAccount();
		userAccount2.initialize(address(this), address(0));
		delete parties;
		parties.push(address(userAccount1));
		parties.push(address(userAccount2));

		//
		// BPM
		//
		ProcessModel pm;
		(error, addr) = processModelRepository.createProcessModel("Cancellation-Model", [1,0,0], address(userAccount1), false, dummyModelFileReference);
		if (addr == address(0)) return "Unable to create a ProcessModel";
		pm = ProcessModel(addr);
		// Formation Process
		addr = pm.createProcessDefinition("FormationProcess", address(artifactsRegistry));
		formationPD = ProcessDefinition(addr);
		error = formationPD.createActivityDefinition(activityId1, BpmModel.ActivityType.TASK, BpmModel.TaskType.NONE, BpmModel.TaskBehavior.RECEIVE, EMPTY, false, EMPTY, EMPTY, EMPTY);
		if (error != BaseErrors.NO_ERROR()) return "Error creating NONE task for formation process definition";
		(valid, errorMsg) = formationPD.validate();
		if (!valid) return errorMsg.toString();
		// Execution Process
		addr = pm.createProcessDefinition("ExecutionProcess", address(artifactsRegistry));
		executionPD = ProcessDefinition(addr);
		error = executionPD.createActivityDefinition(activityId1, BpmModel.ActivityType.TASK, BpmModel.TaskType.NONE, BpmModel.TaskBehavior.RECEIVE, EMPTY, false, EMPTY, EMPTY, EMPTY);
		if (error != BaseErrors.NO_ERROR()) return "Error creating SERVICE task for execution process definition";
		(valid, errorMsg) = executionPD.validate();
		if (!valid) return errorMsg.toString();

		//
		// ARCHETYPE
		//
		addr = archetypeRegistry.createArchetype(10, false, true, address(this), address(this), address(formationPD), address(executionPD), EMPTY, governingArchetypes);
		if (addr == address(0)) return "Error creating TestArchetype, address is empty";

		//
		// AGREEMENT
		//
		address agreement1;
		address agreement2;
		agreement1 = agreementRegistry.createAgreement(addr, address(this), address(this), "", false, parties, EMPTY, governingAgreements);
		if (agreement1 == address(0)) return "Unexpected error creating agreement1";
		agreement2 = agreementRegistry.createAgreement(addr, address(this), address(this), "", false, parties, EMPTY, governingAgreements);
		if (agreement2 == address(0)) return "Unexpected error creating agreement2";

		//
		// FORMATION / EXECUTION
		//
		numberOfPIs = bpmService.getNumberOfProcessInstances();
		ProcessInstance[3] memory pis; // to collect the created PIs
		(error, addr) = agreementRegistry.startProcessLifecycle(ActiveAgreement(agreement1));
		if (error != BaseErrors.NO_ERROR()) return "Error starting the formation process 1 on agreement1";
		pis[0] = ProcessInstance(addr);
		if (agreementRegistry.getTrackedFormationProcess(agreement1) == address(0)) return "There should be a tracked formation process for agreement1";
		if (agreementRegistry.getTrackedExecutionProcess(agreement1) != address(0)) return "There should be NO tracked execution process for agreement1";
		if (agreementRegistry.getTrackedFormationProcess(agreement1) != address(pis[0])) return "The tracked formation process should match the started formation PI for agreement1";
		(error, addr) = agreementRegistry.startProcessLifecycle(ActiveAgreement(agreement2));
		if (error != BaseErrors.NO_ERROR()) return "Error starting the formation process 2 on agreement2";
		pis[1] = ProcessInstance(addr);
		if (agreementRegistry.getTrackedFormationProcess(agreement2) == address(0)) return "There should be a tracked formation process for agreement2";
		if (agreementRegistry.getTrackedExecutionProcess(agreement2) != address(0)) return "There should be NO tracked execution process for agreement2";
		if (agreementRegistry.getTrackedFormationProcess(agreement2) != address(pis[1])) return "The tracked formation process should match the started formation PI for agreement2";

		// sign agreement2 and move PI2 into execution phase
		userAccount1.forwardCall(address(agreement2), abi.encodeWithSignature("sign()"));
		userAccount2.forwardCall(address(agreement2), abi.encodeWithSignature("sign()"));
		if (ActiveAgreement(agreement2).getLegalState() != uint8(Agreements.LegalState.EXECUTED)) return "The agreement2 should be in EXECUTED after signing";
		error = pis[1].completeActivity(pis[1].getActivityInstanceAtIndex(0), bpmService);
		if (error != BaseErrors.NO_ERROR()) return "Error completing wait activity in formation process 2";
	
		if (bpmService.getNumberOfProcessInstances() != numberOfPIs+3) return "There should be 3 additional PIs in the system";
		numberOfPIs = bpmService.getNumberOfProcessInstances();
		// the last added PI should be the execution process of agreement2
		pis[2] = ProcessInstance(bpmService.getProcessInstanceAtIndex(numberOfPIs-1));
		if (agreementRegistry.getTrackedExecutionProcess(agreement2) == address(0)) return "There should now be a tracked execution process for agreement2 after signing";
		if (agreementRegistry.getTrackedExecutionProcess(agreement2) != address(pis[2])) return "The tracked execution process for agreement2 should match the last PI";
		if (pis[0].getState() != uint8(BpmRuntime.ProcessInstanceState.ACTIVE)) return "The Formation PI for agreement1 should be active";
		if (pis[1].getState() != uint8(BpmRuntime.ProcessInstanceState.COMPLETED)) return "The Formation PI for agreement2 should be completed";
		if (pis[2].getState() != uint8(BpmRuntime.ProcessInstanceState.ACTIVE)) return "The Execution PI for agreement2 should be active";

		// cancel the first agreement BEFORE its execution phase (uni-lateral cancellation)
		userAccount2.forwardCall(address(agreement1), abi.encodeWithSignature("cancel()"));
		if (ActiveAgreement(agreement1).getLegalState() != uint8(Agreements.LegalState.CANCELED)) return "agreement1 should be CANCELED";
		if (pis[0].getState() != uint8(BpmRuntime.ProcessInstanceState.ABORTED)) return "The Formation PI for agreement1 should be aborted after canceling";
		
		// cancel the second agreement AFTER it reaches execution phase (multi-lateral cancellation required)
		userAccount2.forwardCall(address(agreement2), abi.encodeWithSignature("cancel()"));
		if (pis[1].getState() != uint8(BpmRuntime.ProcessInstanceState.COMPLETED)) return "The Formation PI for agreement2 should still be completed after 1st cancellation";
		if (pis[2].getState() != uint8(BpmRuntime.ProcessInstanceState.ACTIVE)) return "The Formation PI for agreement2 should still be active after 1st cancellation";
		userAccount1.forwardCall(address(agreement2), abi.encodeWithSignature("cancel()"));
		if (pis[1].getState() != uint8(BpmRuntime.ProcessInstanceState.COMPLETED)) return "The Formation PI for agreement2 should still be completed after 2nd cancellation";
		if (pis[2].getState() != uint8(BpmRuntime.ProcessInstanceState.ABORTED)) return "The Formation PI for agreement2 should be aborted after 2nd cancellation";

		return SUCCESS;
	}

}

/**
 * @dev ActiveAgreementRegistry that exposes internal structures and functions for testing
 */
contract TestRegistry is DefaultActiveAgreementRegistry {

	constructor (string memory _serviceIdArchetypeRegistry, string memory _serviceIdBpmService) public
		DefaultActiveAgreementRegistry(_serviceIdArchetypeRegistry, _serviceIdBpmService) {
	}

	function getTrackedFormationProcess(address _agreement) public view returns (address) {
		return ActiveAgreementRegistryDb(database).getAgreementFormationProcess(_agreement);
	}

	function getTrackedExecutionProcess(address _agreement) public view returns (address) {
		return ActiveAgreementRegistryDb(database).getAgreementExecutionProcess(_agreement);
	}

}

contract TestSignatureCheck is AgreementSignatureCheck {

	address public lastAgreement;

	function complete(address _pi, bytes32 _aiId, bytes32 _aId, address _txPerformer) public {
		lastAgreement = ProcessInstance(_pi).getActivityInDataAsAddress(_aiId, "agreement");
		super.complete(_pi, _aiId, _aId, _txPerformer);
	}

}

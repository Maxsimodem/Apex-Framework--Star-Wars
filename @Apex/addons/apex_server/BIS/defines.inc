#define ID						0	// _id			| ""
#define PARENT						1       // _parent		| ""
#define CHILDREN					2       // _children		| []
#define OWNERS						3       // _owners		| []
#define DESTINATION					4       // _destination		| [objNull,false]
#define PRIORITY					5       // _priority		| -1
#define DESCRIPTION					6       // _description		| ""
#define TITLE						7       // _title		| ""
#define MARKER						8       // _marker		| ""
#define STATE						9       // _state		| "CREATED"
#define TYPE						10      // _type		| "Default"
#define CORE						11      // _core		| false

#define VAR_TEMPLATE					"%1.%2"
#define GET_VAR(TASKVAR,INDEX)				format[VAR_TEMPLATE,TASKVAR,INDEX]
#define GET_DEFAULT_DATA(INDEX)				["","",[],[],[objNull,false],-1,"","","","CREATED","Default",false] select INDEX

#define GET_DATA_NIL(TASKVAR,INDEX)			(missionNamespace getVariable (GET_VAR(TASKVAR,INDEX)))

//this is internal, only for use in GET_DATA macro, don't use outside as it is not safe :)
#define GET_DATA_UNSAFE(TASKVAR,INDEX)			(missionNamespace getVariable [GET_VAR(TASKVAR,INDEX),GET_DEFAULT_DATA(INDEX)])

#define GET_DATA(TASKVAR,INDEX)				(if (GET_DATA_UNSAFE(TASKVAR,INDEX) isEqualType []) then {+GET_DATA_UNSAFE(TASKVAR,INDEX)} else {GET_DATA_UNSAFE(TASKVAR,INDEX)})
#define SET_DATA(TASKVAR,INDEX,VALUE)			(missionNamespace setVariable [GET_VAR(TASKVAR,INDEX),VALUE])
#define SET_DATA_BROADCAST(TASKVAR,INDEX,VALUE)		(missionNamespace setVariable [GET_VAR(TASKVAR,INDEX),VALUE,true])
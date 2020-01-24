/// RECORDMAP: Generated from RecordMap 'Demo.ComplexMap.StudentWCD'
/// on 2018-04-26 at 09:37:01.045 [2018-04-26 14:37:01.045 UTC]
/// by user _SYSTEM
Class Demo.ComplexMap.StudentWCD.Record Extends (EnsLib.RecordMap.ComplexChild, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property ClassID As %String [ Required ];

Property StudentID As %Integer [ Required ];

Property Grade As %Decimal;

Property LastName As %String [ Required ];

Property FirstName As %String [ Required ];

Property MiddleName As %String;

Property Email As %String;

Property Phone As %String;

Property Phone1 As %String;

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ##class(Demo.ComplexMap.StudentWCD.Record).%OnDelete($$$oidForm({ID})) If $$$ISERR(%ok) Quit
}

Index StudentIDIdx On StudentID;

Parameter RECORDMAPGENERATED = 1;

}

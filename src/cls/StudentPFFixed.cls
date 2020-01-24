/// RECORDMAP: Modified during compilation of RecordMap 'Demo.ComplexMap.StudentPFFixed'
/// on 2018-05-04 at 13:19:17.882 [2018-05-04 18:19:17.882 UTC]
/// by user UnknownUser
Class Demo.ComplexMap.StudentPFFixed Extends EnsLib.RecordMap.RecordMap
{

/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	try {
		set tStatus = $$$OK
		set pObject = $$$NULLOREF
		if '$IsObject(pStream) {
			set tFilename = pStream
			set pStream = ##class(%IO.FileStream).%New()
			do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			if $$$ISERR(tStatus) quit
		}
		set tObjectName = $parameter($this,"OBJECTNAME")
		set tObject = $classmethod(tObjectName,"%New")
		if '$IsObject(tObject) {
			set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			quit
		}
		set tObject.%Source = pStream.Name
		set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		if pStream.AtEnd && (""=pLookAhead) {
			set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			quit
		}
		set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		if $$$ISERR(tStatus) quit
	}
	catch ex {
		set tStatus = ex.AsStatus()
	}
	if $$$ISERR(tStatus) { set pObject = $$$NULLOREF }
	else { set pObject = tObject }
	quit tStatus
}

/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	try {
		set tStatus = $$$OK
		if '$IsObject(pStream) {
			set tFilename = pStream
			set pStream = ##class(%IO.FileStream).%New()
			do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			if $$$ISERR(tStatus) quit
		}
		set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		set pStream.CharEncoding = "UTF-8"

		set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		if $$$ISERR(tStatus) quit
		if pFlush do pStream.Flush(.tStatus)
		if $$$ISERR(tStatus) quit
	}
	catch ex {
		set tStatus = ex.AsStatus()
	}
	quit tStatus
}

Parameter OBJECTNAME = "Demo.ComplexMap.StudentPFFixed.Record";

/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	set tStatus = $$$OK
	if pLabelFound { set tRecLabel = "" } 
	else { set tRecLabel = "" } 
	set tMaxLen = 92 + $length(tRecLabel)
	set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, tMaxLen, pTimeout, $char(13,10), tRecLabel, .pLookAhead)
	if $$$ISERR(tStatus) quit tStatus
	set tIgnoreEarlyTerminator = 0
	if $$$ISERR(tStatus) quit tStatus
	set tMaxLocal = $$$MaxLocalLength
	set tRecordData("charcount") = +$get(tCharCount)
	set tCurrChunk = 1
	set tCurrPos = 1
	set tNewChunk = 1
	set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,10,"","","StudentID",tIgnoreEarlyTerminator)
	if $$$ISERR(tStatus) quit tStatus
	if pGetTopFields set pObject.StudentID = pObject.StudentIDDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,10,"","","ClassID",tIgnoreEarlyTerminator)
	if $$$ISERR(tStatus) quit tStatus
	if pGetTopFields set pObject.ClassID = pObject.ClassIDDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,8,"","","Grade",tIgnoreEarlyTerminator)
	if $$$ISERR(tStatus) quit tStatus
	if pGetTopFields set pObject.Grade = pObject.GradeDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,4,"","","Pass",tIgnoreEarlyTerminator)
	if $$$ISERR(tStatus) quit tStatus
	if pGetTopFields set pObject.Pass = pObject.PassDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,20,"","","FirstName",tIgnoreEarlyTerminator)
	if $$$ISERR(tStatus) quit tStatus
	if pGetTopFields set pObject.FirstName = pObject.FirstNameDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,20,"","","MiddleName",tIgnoreEarlyTerminator)
	if $$$ISERR(tStatus) quit tStatus
	if pGetTopFields set pObject.MiddleName = pObject.MiddleNameDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,20,"","","LastName",tIgnoreEarlyTerminator)
	if $$$ISERR(tStatus) quit tStatus
	if pGetTopFields set pObject.LastName = pObject.LastNameDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	set tStatus = $$$OK
	if pHasTopFields { set tValue = ##class(Demo.ComplexMap.StudentPFFixed.Record).StudentIDLogicalToDisplay(pObject.StudentID), tLen = $length(tValue) }
	else { set tValue = "", tLen = 0}
	if 10 > tLen {
		set tPadding = $get(pPadArray(10 - tLen))
		if tPadding = "" {
			set $piece(tPadding, $char(32), (10 - tLen + 1)) = ""
			set pPadArray(10-tLen) = tPadding
		}
		set tValue = tValue_tPadding
	}
	do pStream.Write(tValue, 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	if pHasTopFields { set tValue = ##class(Demo.ComplexMap.StudentPFFixed.Record).ClassIDLogicalToDisplay(pObject.ClassID), tLen = $length(tValue) }
	else { set tValue = "", tLen = 0}
	if 10 > tLen {
		set tPadding = $get(pPadArray(10 - tLen))
		if tPadding = "" {
			set $piece(tPadding, $char(32), (10 - tLen + 1)) = ""
			set pPadArray(10-tLen) = tPadding
		}
		set tValue = tValue_tPadding
	}
	do pStream.Write(tValue, 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	if pHasTopFields { set tValue = ##class(Demo.ComplexMap.StudentPFFixed.Record).GradeLogicalToDisplay(pObject.Grade), tLen = $length(tValue) }
	else { set tValue = "", tLen = 0}
	if 8 > tLen {
		set tPadding = $get(pPadArray(8 - tLen))
		if tPadding = "" {
			set $piece(tPadding, $char(32), (8 - tLen + 1)) = ""
			set pPadArray(8-tLen) = tPadding
		}
		set tValue = tValue_tPadding
	}
	do pStream.Write(tValue, 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	if pHasTopFields { set tValue = ##class(Demo.ComplexMap.StudentPFFixed.Record).PassLogicalToDisplay(pObject.Pass), tLen = $length(tValue) }
	else { set tValue = "", tLen = 0}
	if 4 > tLen {
		set tPadding = $get(pPadArray(4 - tLen))
		if tPadding = "" {
			set $piece(tPadding, $char(32), (4 - tLen + 1)) = ""
			set pPadArray(4-tLen) = tPadding
		}
		set tValue = tValue_tPadding
	}
	do pStream.Write(tValue, 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	if pHasTopFields { set tValue = ##class(Demo.ComplexMap.StudentPFFixed.Record).FirstNameLogicalToDisplay(pObject.FirstName), tLen = $length(tValue) }
	else { set tValue = "", tLen = 0}
	if 20 > tLen {
		set tPadding = $get(pPadArray(20 - tLen))
		if tPadding = "" {
			set $piece(tPadding, $char(32), (20 - tLen + 1)) = ""
			set pPadArray(20-tLen) = tPadding
		}
		set tValue = tValue_tPadding
	}
	do pStream.Write(tValue, 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	if pHasTopFields { set tValue = ##class(Demo.ComplexMap.StudentPFFixed.Record).MiddleNameLogicalToDisplay(pObject.MiddleName), tLen = $length(tValue) }
	else { set tValue = "", tLen = 0}
	if 20 > tLen {
		set tPadding = $get(pPadArray(20 - tLen))
		if tPadding = "" {
			set $piece(tPadding, $char(32), (20 - tLen + 1)) = ""
			set pPadArray(20-tLen) = tPadding
		}
		set tValue = tValue_tPadding
	}
	do pStream.Write(tValue, 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	if pHasTopFields { set tValue = ##class(Demo.ComplexMap.StudentPFFixed.Record).LastNameLogicalToDisplay(pObject.LastName), tLen = $length(tValue) }
	else { set tValue = "", tLen = 0}
	if 20 > tLen {
		set tPadding = $get(pPadArray(20 - tLen))
		if tPadding = "" {
			set $piece(tPadding, $char(32), (20 - tLen + 1)) = ""
			set pPadArray(20-tLen) = tPadding
		}
		set tValue = tValue_tPadding
	}
	do pStream.Write(tValue, 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	do pStream.Write($char(13,10), 0, .tStatus)
	if $$$ISERR(tStatus) quit tStatus
	quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	kill pClasses
	set pClasses("Demo.ComplexMap.StudentPFFixed.Record")=""
	set pClasses($classname())=""
	quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
""
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"fixedwidth"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="Demo.ComplexMap.StudentPFFixed" type="fixedwidth" char_encoding="UTF-8" targetClassname="Demo.ComplexMap.StudentPFFixed.Record" complexBatchManaged="1" paddingChars="\x20" padFromLeft="0" recordTerminator="\x0d\x0a" allowEarlyTerminator="0">
  <Field name="StudentID" required="1" ignored="0" datatype="%Integer" width="10" index="1" repeating="0">
  </Field>
  <Field name="ClassID" required="1" ignored="0" datatype="%String" width="10" repeating="0">
  </Field>
  <Field name="Grade" required="1" ignored="0" datatype="%Integer" width="8" repeating="0">
  </Field>
  <Field name="Pass" required="0" ignored="0" datatype="%Boolean" width="4" repeating="0">
  </Field>
  <Field name="FirstName" required="1" ignored="0" datatype="%String" width="20" repeating="0">
  </Field>
  <Field name="MiddleName" required="0" ignored="0" datatype="%String" width="20" repeating="0">
  </Field>
  <Field name="LastName" required="1" ignored="0" datatype="%String" width="20" repeating="0">
  </Field>
</Record>
}

}

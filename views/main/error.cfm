<cfdump var="#request.exception#">

<cfif structKeyExists(request, "failedCfcName")>
  <cfdump var="#request.failedCfcName#">
</cfif>

<cfif structKeyExists(request, "failedMethod")>
  <cfdump var="#request.failedMethod#">
</cfif>
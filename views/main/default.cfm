<cfset local.data = rc.data>
<cfset local.statuses = rc.statuses>
<!--- <cfdump var="#local.data#">
<cfabort> --->
<cfoutput>

  <!--- errors --->
  <!---  #local.data.getStatus().getStatusName()# --->

  <!--- errors --->
  #local.data.getName()#

  <!--- works --->
  <!--- #local.data.getStatusID()# --->


  <cfloop array="#local.statuses#" index="local.status">
    <cfif local.status.getStatusID() EQ local.data.getStatusID()>
      #local.status.getStatusID()#
    <cfelse>
      #local.status.getStatusID()#
    </cfif>
  </cfloop>
</cfoutput>
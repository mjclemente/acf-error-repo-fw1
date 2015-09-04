component accessors=true {

  property name="statusService";
  property name="id" default="0";
  property name="name" default="";
  property name="statusID" default="";
  property name="status" default="";

  function init() {
    return this;
  }

  function setStatusID(statusID = "") {
    variables.statusID = statusID;
    variables.status = variables.statusService.get( statusID );
  }
}

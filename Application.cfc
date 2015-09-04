component extends="framework.one" {

	this.name = 'fw1-acf-repo';
	//this.applicationtimeout = createTimeSpan(0,0,0,0);
  this.sessionmanagement = true;
	this.sessiontimeout = createTimeSpan(0,2,0,0);

	// FW/1 - configuration:
	variables.framework = {
    trace = true,
    reloadApplicationOnEveryRequest = true
	};

  // function onPopulateError(cfc, property, rc) {
  //   writedump(rc);
  //   abort;
  // }

}

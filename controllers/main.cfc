component accessors=true {

  property dataService;
  property statusService;

  function init( fw ) {
      variables.fw = fw;
  }

  function default( rc ) {
    rc.data = variables.dataService.getTopOne();
    rc.statuses = variables.statusService.list();
  }

}

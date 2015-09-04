component {

  function init( any statusService, any beanFactory, any fw ) {

      variables.statusService = statusService;
      variables.beanFactory = beanFactory;
      variables.fw = fw;

      variables.datas = queryNew("id,name,statusid","Integer,Varchar,Integer",
        [
                {id=1,name="Admin",statusid=1},
                {id=2,name="Larry",statusid=2},
                {id=3,name="Turtle",statusid=2}
      ]);

      return this;
  }

  function getTopOne( ) {
    var result = variables.beanFactory.getBean( "dataBean" );
    var qry_getDataByID = new Query(dbtype="query");
    qry_getDataByID.setAttributes(sourceQuery=variables.datas);
    var sql = "SELECT id, name, statusid
    FROM sourceQuery
    WHERE id = 1";

    qry_getDataByID = qry_getDataByID.execute(sql=sql).getResult();

    if (qry_getDataByID.recordcount) {
      for(var data in qry_getDataByID) {
        variables.fw.populate(cfc = result, properties = data);
      }

    }

    return result;
  }

}

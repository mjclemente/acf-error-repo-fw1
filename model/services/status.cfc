component {

    function init( beanFactory, fw ) {
      variables.beanFactory = beanFactory;
      variables.fw = fw;

      variables.statuses = queryNew("statusid,statusname,otherattribute","Integer,Varchar,Varchar",
        [
          {statusId=1,statusname="Good",otherAttribute="Yellow"},
          {statusId=2,statusname="Bad",otherAttribute="Green"},
          {statusId=3,statusname="Gross",otherAttribute="Goat"}
      ]);

      return this;
    }

    function get( statusId ) {
      var result = variables.beanFactory.getBean( "statusBean" );
      var qry_getStatusByID = new Query(dbtype="query");
      qry_getStatusByID.setAttributes(sourceQuery=variables.statuses);
      qry_getStatusByID.addParam(name="id", value=statusId, cfsqltype="CF_SQL_INTEGER");
      var sql = "SELECT statusid, statusname, otherattribute
      FROM sourceQuery
      WHERE statusid = :id";

      qry_getStatusByID = qry_getStatusByID.execute(sql=sql).getResult();

      if (qry_getStatusByID.recordcount) {
        variables.fw.populate(cfc = result, properties = qry_getStatusByID);
      }

      return result;
    }

    function list() {

      var statuses = [];
      var status = '';
      var qry_getStatuses = new Query(dbtype="query");
      qry_getStatuses.setAttributes(sourceQuery=variables.statuses);
      var sql = "SELECT statusid, statusname, otherattribute
      FROM sourceQuery";

      qry_getStatuses = qry_getStatuses.execute(sql=sql).getResult();

      for (var qStatus in qry_getStatuses){
        status = variables.beanFactory.getBean( "statusBean" );
        variables.fw.populate( cfc = status, properties=qStatus);
        arrayAppend(statuses, status);
      }

      return statuses;
    }
}

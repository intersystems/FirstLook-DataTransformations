Class Demo.ComplexMap.SemesterProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.ComplexMap.SemesterProduction" LogGeneralTraceEvents="false">
  <Description>Sample Production to illustrate the use of Complex Maps. NOTE: The source file, ComplexMap_Semester_Data.txt, as well as sample output files, should be located in [install_dir]/dev/ComplexMap/.</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="StudentGradeService" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">Demo.ComplexMap.StudentWCD</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\practice\in\</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
    <Setting Target="Host" Name="TargetConfigNames">DTLDemoRouter</Setting>
  </Item>
  <Item Name="StudentFinalGradeOperation" Category="" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">Demo.ComplexMap.StudentPFFixed</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\practice\out\</Setting>
  </Item>
  <Item Name="DTLDemoRouter" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">Demo.ComplexMap.DTLDemoBusinessRule</Setting>
  </Item>
</Production>
}

}

/// 
Class Demo.ComplexMap.DTLDemoBusinessRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<send transform="" target="StudentFinalGradeOperation"></send>
</ruleSet>
</ruleDefinition>
}

}

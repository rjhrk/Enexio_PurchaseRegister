@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'WBS Element'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_WBS
  as select from Z_I_Purchase_Req as Req
  association [1..1] to I_EntProjWrkBrkdwnStrucElmntVH as WBS on WBS.WBSElementInternalID = Req.WBS
{
  key Req.PO           as PO,
  key Req.POItem       as POItem,
      Req.PR           as PR,
      Req.CreationDate as CreationDate,
      Req.ReleaseDate  as ReleaseDate,
      Req.MAterial     as Material,
      WBS.ProjectElement,
      WBS.ProjectElementUUID,
      WBS.ProjectElementDescription,
      WBS.Project,
      WBS.ProjectDescription,
      WBS.ProcessingStatus,
      WBS.ProcessingStatusText,
      WBS.WBSElementInternalID,
      WBS.ResponsibleCostCenter,
      WBS.ProfitCenter,
      WBS.CompanyCode,
      WBS.ControllingArea,
      WBS.ProjectUUID,
      WBS.FunctionalArea,
      WBS.Plant,
      WBS.ParentObjectUUID,
      WBS.IsProjectMilestone,
      WBS._EnterpriseProject,
      WBS._EnterpriseProjectForUser,
      WBS._ProcessingStatusText
}

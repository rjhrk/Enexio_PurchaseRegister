@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Requis'
@Metadata.ignorePropagatedAnnotations: true

define view entity Z_I_Purchase_Req
  as select from Z_I_POHead as PO
  association [1..1] to I_PurchaseRequisitionItemAPI01 as PRItem on  PRItem.PurchaseRequisition     = PO.PurchaseRequisition
                                                                 and PRItem.PurchaseRequisitionItem = PO.PRItem
                                                                 and PRItem.Material                = PO.Product
  association [1..1] to I_PurchaseRequisitionAPI01     as PR     on  PR.PurchaseRequisition = PO.PurchaseRequisition
  association [1..1] to I_PurOrdAccountAssignmentAPI01 as POAss  on  POAss.PurchaseOrder     = PO.PO
                                                                 and POAss.PurchaseOrderItem = PO.Item                                                             

{
  key PO.PO                                                 as PO,
  key PO.Item                                               as POItem,
      PO.PurchaseRequisition                                as PR,
      PRItem.CreationDate                                   as CreationDate,
      PRItem.PurchaseRequisitionReleaseDate                 as ReleaseDate,
      PRItem.Material                                       as MAterial,
      cast( POAss.WBSElementInternalID_2 as abap.char(24) ) as WBS,
      cast(
      cast( POAss.WBSElementInternalID_2 as abap.numc(8) )
      as abap.char(8)
      )                                                     as WBS1

}

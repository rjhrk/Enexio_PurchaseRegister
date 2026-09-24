@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Maximum Po Revison Date'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_PO_RevDate as select from I_PurchaseOrderChangeDocument 
{
     key PurchaseOrder,
     max(CreationDate) as MaxPORevisionDate
}
group by PurchaseOrder

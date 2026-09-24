@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchse Register PO'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_POHead as select from I_PurchaseOrderAPI01 as POH
association [1..*] to I_PurchaseOrderItemAPI01 as PItem on PItem.PurchaseOrder = POH.PurchaseOrder

//association [1..*] to I_PurchaseOrderHistoryAPI01 as PHistory on PHistory.PurchaseOrder = POH.PurchaseOrder 
{
    key POH.PurchaseOrder as PO,
    key PItem.PurchaseOrderItem as Item,
        POH.CreationDate as PODate,
        POH.PurchasingOrganization as PurchaseOrg,
        POH.IncotermsClassification as IncoTerm,
        POH.PurchaseOrderType as OrderType,
        PItem.Material as Product,
        @Semantics.quantity.unitOfMeasure: 'UOM'
        PItem.OrderQuantity as OrderQTY,
        PItem.BaseUnit as UOM,
        PItem.MaterialGroup as MGroup,
        PItem.ManualDeliveryAddressID as MAddID,
        PItem.PurchaseRequisition as PurchaseRequisition,
        PItem.PurchaseRequisitionItem as PRItem,
        POH.YY1_RFQ_NO_PDH as RFQ
//        PHistory.DeliveryQuantityUnit as DeliveryQty
}

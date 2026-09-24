@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO History CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPO_History as select from Z_I_POHead as PO
association [1..1] to I_PurchaseOrderHistoryAPI01 as PHis on PHis.PurchaseOrder = PO.PO
                                                  and PHis.PurchaseOrderItem = PO.Item
{
    key PHis.PurchaseOrder as PO,
    key PHis.PurchaseOrderItem as PItem,
    PHis.DeliveryQuantityUnit as DelUnit,
    PHis._PurchaseOrderItem,
    PHis.GoodsMovementType,
    PHis.PurchasingHistoryDocumentItem,
    PHis.PurchasingHistoryCategory
}
where PHis.PurchasingHistoryCategory = 'E'

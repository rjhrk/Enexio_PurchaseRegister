@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Document CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_MzterialDoc as select from I_MaterialDocumentItem_2 as MatDoc
association [1..1] to I_MaterialDocumentHeader_2 as MatHead on MatHead.MaterialDocumentYear = MatDoc.MaterialDocumentYear
                                               and MatHead.MaterialDocument = MatDoc.MaterialDocument
                                                                 
 
{
    key MaterialDocumentYear as MatYear,
    key MaterialDocument as MatDoc,
    key MaterialDocumentItem as MatItem,
        MatHead.PostingDate as MigoDate,
        MatDoc.DocumentDate as DocDate,
        @Semantics.quantity.unitOfMeasure: 'Unit'
        MatDoc.QuantityInBaseUnit as GRNQty,
        MatDoc.MaterialBaseUnit as Unit,
        MatDoc.PurchaseOrder as PO,
        MatDoc.PurchaseOrderItem as POItem,     
        MatDoc.Batch as Batch,
        MatDoc.Material as Material,
        MatDoc.GoodsMovementType as GoodsMType 
}


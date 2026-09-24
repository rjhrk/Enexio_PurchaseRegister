@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom screens data'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_PO_CUSTOM_DATA as
 select from I_PurchaseOrderAPI01  as a
 left outer join I_PurchaseOrderItemMonitor as b on b.PurchaseOrder = a.PurchaseOrder
 left outer join Z_PO_RevDate as aa on aa.PurchaseOrder = a.PurchaseOrder
 left outer join zman_master as c on c.man = a.YY1_man_PDH

left outer join zpratable as d on d.ponumber = a.PurchaseOrder
left outer join I_Requestforquotation_Api01 as e on e.RequestForQuotation = c.banfn
left outer join I_PurchaseOrderItemAPI01 as f on f.PurchaseOrder = a.PurchaseOrder
left outer join I_PaymentTermsText as pay on pay.PaymentTerms = a.PaymentTerms  and pay.Language = 'E'

{

key a.PurchaseOrder,
key f.PurchaseOrderItem,
    
    aa.MaxPORevisionDate as PORevisionDate,
    cast( b.StillToBeDeliveredQuantity as abap.dec( 15, 2 )) as StillToBeDeliveredQuantity,
    
    c.man,
    c.prop_date as ManDate,
    e.CreationDate as RFQDate,
    
    d.pra_ref_no,
    d.creationdate as PRACreationDate,
    
    cast( f.DownPaymentAmount as abap.dec( 15, 2 )) as DownPaymentAmount,
    a.PaymentTerms,
    pay.PaymentTermsName
     
}


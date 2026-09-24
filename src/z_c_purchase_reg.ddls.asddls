@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_C_Purchase_Reg
  as select from Z_I_AcctItem as PReg
  association [1..1] to Z_I_PR_Supplier  as PrH     on  PrH.CompanyCode = PReg.CompanyCode
                                                    and PrH.AccDoc      = PReg.AccDoc
                                                    and PrH.Fiscalyear  = PReg.Fiscalyear
  association [1..1] to Z_I_POHead       as PO      on  PO.PO      = PReg.PO
                                                    and PO.Item    = PReg.POItem
                                                    and PO.Product = PReg.Material
  association [1..1] to Z_I_Product      as Product on  Product.Product = PReg.Material
  association [1..1] to Z_I_Freight      as Freight on  Freight.AccDoc      = PReg.AccDoc
                                                    and Freight.CompanyCode = PReg.CompanyCode
                                                    and Freight.Fiscalyear  = PReg.Fiscalyear
                                                    and Freight.AccItem     = PReg.AccItem
  association [1..1] to Z_I_CGST         as CGST    on  CGST.CCode   = PReg.CompanyCode
                                                    and CGST.AcDoc   = PReg.AccDoc
                                                    and CGST.FYear   = PReg.Fiscalyear
                                                    and CGST.TaxItem = PReg.TaxItem
  association [1..1] to Z_I_SGST         as SGST    on  SGST.CCode   = PReg.CompanyCode
                                                    and SGST.AcDoc   = PReg.AccDoc
                                                    and SGST.FYear   = PReg.Fiscalyear
                                                    and SGST.TaxItem = PReg.TaxItem
  association [1..1] to Z_I_IGST         as IGST    on  IGST.CCode   = PReg.CompanyCode
                                                    and IGST.AcDoc   = PReg.AccDoc
                                                    and IGST.FYear   = PReg.Fiscalyear
                                                    and IGST.TaxItem = PReg.TaxItem
  association [1..1] to Z_I_TDS          as TDS     on  TDS.CompanyCode = PReg.CompanyCode
                                                    and TDS.AccDoc      = PReg.AccDoc
                                                    and TDS.Fiscalyear  = PReg.Fiscalyear
  //and TDS.AccItem     = PReg.AccItem
  association [1..1] to Z_I_Purchase_Req as PR      on  PR.PO     = PReg.PO
                                                    and PR.POItem = PReg.POItem
  //and PR.MAterial = PReg.Material
  association [1..1] to Z_I_WBS          as WBS     on  WBS.PO     = PReg.PO
                                                    and WBS.POItem = PReg.POItem
  //and WBS.Material = PReg.Material
  association [1..1] to Z_I_MzterialDoc  as Mat     on  Mat.PO       = PReg.PO
                                                    and Mat.POItem   = PReg.POItem
                                                    and Mat.Material = PReg.Material
  association [1..1] to Z_I_DRefID       as DRef    on  DRef.CCOde = PReg.CompanyCode
                                                    and DRef.Adoct = PReg.AccDoc
                                                    and DRef.FYear = PReg.Fiscalyear
  association [1..1] to Z_I_Sup_REg      as SRegion on  SRegion.CCode = PReg.CompanyCode
                                                    and SRegion.AcDoc = PReg.AccDoc
                                                    and SRegion.Fyear = PReg.Fiscalyear
 // Added on 10.09.2026 by GK                                                   
                                                    
association [1..1] to Z_PO_CUSTOM_DATA as ZCD on ZCD.PurchaseOrder = PReg.PO and ZCD.PurchaseOrderItem = PReg. POItem

{
  key PReg.CompanyCode,
  key PReg.AccDoc,
  key PReg.Fiscalyear,
  key PReg.AccItem,
      PReg.Plant,
      left(PReg.Miro,10)                                              as MIRO,
      PReg.DocumentDate,
      PReg.PostingDate,
      PrH.PaymentTerms,
      PO.PODate,
      PrH.DocType,
      PrH.BusinessPlace,
      Product.ProductType,
      Product.ProductGroup,
      Product.PGroupText,
      PReg.PO,
      PO.OrderType,
      @Semantics.quantity.unitOfMeasure: 'UOM'
      PO.OrderQTY,
      PO.UOM,
      PO.Item,
      PO.MGroup,
      PO.PurchaseOrg,
      PO.IncoTerm,
      PO.MAddID,
      PO.RFQ,
      PR.PR,
      PR.CreationDate,
      PR.ReleaseDate,
      PR.WBS,
      WBS.ProjectElement,
      PR.POItem,
      Mat.MatDoc,
      Mat.Batch,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      Mat.GRNQty,
      Mat.MigoDate,
      Mat.Unit,
      Mat.GoodsMType,
      DRef.RefID,
      PReg.HSN,
      PReg.Material,
      Product.PDescription,
      @Semantics.quantity.unitOfMeasure: 'UOM1'
      PReg.Quantity,
      PReg.UOM                                                        as UOM1,
      PrH.Supplier,
      PrH.GSTIN,
      PrH.SName,
      PrH.Assignment,
      SRegion.RegionName,
      PReg.Currency,
      PReg.GLAccount,
      PReg.GLText,
      PReg.TaxCode,
      @Semantics.amount.currencyCode: 'Currency'
      abs(PReg.GSTTaxableAmount)                                      as GSTTaxableAmount,
      @Semantics.amount.currencyCode: 'Cur'
      Freight.TaxAmt,
      Freight.Cur,
      @Semantics.amount.currencyCode: 'Cur1'
      abs(CGST.TCur)                                                  as CGST,

      CGST.Currency                                                   as Cur1,
      SGST.Currency                                                   as Cur2,
      @Semantics.amount.currencyCode: 'Cur2'
      abs(CGST.TCur)                                                  as SGST,
      case
      when CGST.TCur <> 0
      then cast(
        round(
          ( cast( CGST.TCur as abap.dec(15,6) )
          / cast( PReg.GSTTaxableAmount as abap.dec(15,6) ) ) * 100,
          1
        )
      as abap.dec(5,1) )
      else cast( 0 as abap.dec(5,1) )
      end                                                             as CGST_Percentage,

      case
      when SGST.TCur <> 0
      then cast(
        round(
          ( cast( SGST.TCur as abap.dec(15,6) )
          / cast( PReg.GSTTaxableAmount as abap.dec(15,6) ) ) * 100,
          1
        )
      as abap.dec(5,1) )
      else cast( 0 as abap.dec(5,1) )
      end                                                             as SGST_Percentage,

      IGST.Currency                                                   as Cur3,
      @Semantics.amount.currencyCode: 'Cur3'
      abs(CGST.TCur)                                                  as IGST,

      case
      when IGST.TCur <> 0
      then cast(
      round(
      ( cast( IGST.TCur as abap.dec(15,6) )
      / cast( PReg.GSTTaxableAmount as abap.dec(15,6) ) ) * 100,
      1
      )
      as abap.dec(5,1) )
      else cast( 0 as abap.dec(5,1) )
      end                                                             as IGST_Percentage,

      TDS.CUR                                                         as Cur4,
      @Semantics.amount.currencyCode: 'Cur4'
      TDS.TDS,
      abs( coalesce( cast( PReg.GSTTaxableAmount as abap.dec(15,2) ), 0 ) +
      coalesce( cast( IGST.TCur              as abap.dec(15,2) ), 0 ) +
      coalesce( cast( CGST.TCur              as abap.dec(15,2) ), 0 ) +
      coalesce( cast( SGST.TCur              as abap.dec(15,2) ), 0 ) +
      coalesce( cast( Freight.TaxAmt         as abap.dec(15,2) ), 0 ) +
      coalesce( cast( TDS.TDS                as abap.dec(15,2) ), 0 ) ) as Invoice_Amt
      
      // added on 10.09.2026 by GK
      ,
      ZCD.PORevisionDate,
      ZCD.StillToBeDeliveredQuantity as POPendignQty,
      ZCD.RFQDate,
      ZCD.pra_ref_no,
      ZCD.PRACreationDate,
      ZCD.man as ManNo,
      ZCD.ManDate,
      ZCD.DownPaymentAmount,
      ZCD.PaymentTerms as ZPO_PaymentTerms,
      ZCD.PaymentTermsName


}

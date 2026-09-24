@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register With UI'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_C_Purchase_Reg_UI
  as select distinct from Z_C_Purchase_Reg
{
      @UI: { lineItem: [ { position: 1 } ], identification: [ { position: 1 } ] }
      @EndUserText.label: 'Company Code'
      @UI.selectionField: [{ position: 1 }]
      @Consumption.valueHelpDefinition: [{entity: {element: 'CompanyCode' , name: 'ZCCode_F4_Help' }}]
  key CompanyCode,
  
      @UI: { lineItem: [ { position: 2 } ], identification: [ { position: 2 } ] }
  key AccDoc,

      @UI: { lineItem: [ { position: 3 } ], identification: [ { position: 3 } ] }
      @EndUserText.label: 'Fisical Year'
  key Fiscalyear,

      @UI: { lineItem: [ { position: 4 } ], identification: [ { position: 4 } ] }
  key AccItem,

      @UI: { lineItem: [ { position: 5 } ], identification: [ { position: 5 } ] }
      Plant,

      @UI: { lineItem: [ { position: 6 } ], identification: [ { position: 6 } ] }
      MIRO,

      @UI: { lineItem: [ { position: 7 } ], identification: [ { position: 7 } ] }
      DocumentDate,

      @UI: { lineItem: [ { position: 8 } ], identification: [ { position: 8 } ] }
      PostingDate,

      @UI: { lineItem: [ { position: 9 } ], identification: [ { position: 9 } ] }
      PaymentTerms,

      @UI: { lineItem: [ { position: 10 } ], identification: [ { position: 10 } ] }
      PODate,

      @UI: { lineItem: [ { position: 11 } ], identification: [ { position: 11 } ] }
      DocType,

      @UI: { lineItem: [ { position: 12 } ], identification: [ { position: 12 } ] }
      BusinessPlace,

      @UI: { lineItem: [ { position: 13 } ], identification: [ { position: 13 } ] }
      ProductType,

      @UI: { lineItem: [ { position: 14 } ], identification: [ { position: 14 } ] }
      ProductGroup,

      @UI: { lineItem: [ { position: 15 } ], identification: [ { position: 15 } ] }
      PGroupText,

      @UI: { lineItem: [ { position: 16 } ], identification: [ { position: 16 } ] }
      PO,

      @UI: { lineItem: [ { position: 17 } ], identification: [ { position: 17 } ] }
      OrderType,
      @Semantics.quantity.unitOfMeasure: 'UOM'
      @UI: { lineItem: [ { position: 18 } ], identification: [ { position: 18 } ] }
      OrderQTY,

      @UI: { lineItem: [ { position: 19 } ], identification: [ { position: 19 } ] }
      UOM,

      @UI: { lineItem: [ { position: 20 } ], identification: [ { position: 20 } ] }
      Item,

      @UI: { lineItem: [ { position: 21 } ], identification: [ { position: 21 } ] }
      MGroup,

      @UI: { lineItem: [ { position: 22 } ], identification: [ { position: 22 } ] }
      PurchaseOrg,

      @UI: { lineItem: [ { position: 23 } ], identification: [ { position: 23 } ] }
      IncoTerm,

      @UI: { lineItem: [ { position: 24 } ], identification: [ { position: 24 } ] }
      MAddID,

      @UI: { lineItem: [ { position: 25 } ], identification: [ { position: 25 } ] }
      HSN,

      @UI: { lineItem: [ { position: 26 } ], identification: [ { position: 26 } ] }
      Material,

      @UI: { lineItem: [ { position: 27 } ], identification: [ { position: 27 } ] }
      PDescription,
      @Semantics.quantity.unitOfMeasure: 'UOM1'
      @UI: { lineItem: [ { position: 28 } ], identification: [ { position: 28 } ] }
      Quantity,

      @UI: { lineItem: [ { position: 29 } ], identification: [ { position: 29 } ] }
      UOM1,

      @UI: { lineItem: [ { position: 30 } ], identification: [ { position: 30 } ] }
      Supplier,

      @UI: { lineItem: [ { position: 31 } ], identification: [ { position: 31 } ] }
      GSTIN,

      @UI: { lineItem: [ { position: 32 } ], identification: [ { position: 32 } ] }
      SName,

      @UI: { lineItem: [ { position: 33 } ], identification: [ { position: 33 } ] }
      Assignment,

      @UI: { lineItem: [ { position: 34 } ], identification: [ { position: 34 } ] }
      Currency,

      @UI: { lineItem: [ { position: 35 } ], identification: [ { position: 35 } ] }
      GLAccount,

      @UI: { lineItem: [ { position: 36 } ], identification: [ { position: 36 } ] }
      TaxCode,
      @Semantics.amount.currencyCode: 'Currency'
      @UI: { lineItem: [ { position: 37 } ], identification: [ { position: 37 } ] }
      GSTTaxableAmount,
      @Semantics.amount.currencyCode: 'Cur'
      @UI: { lineItem: [ { position: 38 } ], identification: [ { position: 38 } ] }
      TaxAmt,

      @UI: { lineItem: [ { position: 39 } ], identification: [ { position: 39 } ] }
      Cur,
      @Semantics.amount.currencyCode: 'Cur1'
      @UI: { lineItem: [ { position: 40 } ], identification: [ { position: 40 } ] }
      CGST,

      @UI: { lineItem: [ { position: 41 } ], identification: [ { position: 41 } ] }
      Cur1,

      @UI: { lineItem: [ { position: 42 } ], identification: [ { position: 42 } ] }
      Cur2,
      @Semantics.amount.currencyCode: 'Cur2'
      @UI: { lineItem: [ { position: 43 } ], identification: [ { position: 43 } ] }
      SGST,

      @UI: { lineItem: [ { position: 44 } ], identification: [ { position: 44 } ] }
      CGST_Percentage,

      @UI: { lineItem: [ { position: 45 } ], identification: [ { position: 45 } ] }
      SGST_Percentage,

      @UI: { lineItem: [ { position: 46 } ], identification: [ { position: 46 } ] }
      Cur3,
      @Semantics.amount.currencyCode: 'Cur3'
      @UI: { lineItem: [ { position: 47 } ], identification: [ { position: 47 } ] }
      IGST,

      @UI: { lineItem: [ { position: 48 } ], identification: [ { position: 48 } ] }
      IGST_Percentage,

      @UI: { lineItem: [ { position: 49 } ], identification: [ { position: 49 } ] }
      Cur4,
      @Semantics.amount.currencyCode: 'Cur4'
      @UI: { lineItem: [ { position: 50 } ], identification: [ { position: 50 } ] }
      TDS,

      @UI: { lineItem: [ { position: 51 } ], identification: [ { position: 51 } ] }
      Invoice_Amt,
      
      @UI: { lineItem: [ { position: 52 } ], identification: [ { position: 52 } ] }
      MatDoc,
      @UI: { lineItem: [ { position: 53 } ], identification: [ { position: 53 } ] }
      MigoDate,
      @UI: { lineItem: [ { position: 54 } ], identification: [ { position: 54 } ] }
      Batch,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      @UI: { lineItem: [ { position: 55 } ], identification: [ { position: 55 } ] }
      GRNQty,
      @UI: { lineItem: [ { position: 56 } ], identification: [ { position: 56 } ] }
      Unit,
      @UI: { lineItem: [ { position: 57 } ], identification: [ { position: 57 } ] }
      PR,
      @UI: { lineItem: [ { position: 58 } ], identification: [ { position: 58 } ] }
      CreationDate,
      @UI: { lineItem: [ { position: 59 } ], identification: [ { position: 59 } ] }
      ReleaseDate,
      @UI: { lineItem: [ { position: 60 } ], identification: [ { position: 60 } ] }
      WBS,
      @UI: { lineItem: [ { position: 61 } ], identification: [ { position: 61 } ] }
      ProjectElement,
      @UI: { lineItem: [ { position: 62 } ], identification: [ { position: 62 } ] }
      POItem,
      @UI: { lineItem: [ { position: 63 } ], identification: [ { position: 63 } ] }
      GoodsMType,
      @UI: { lineItem: [ { position: 64 } ], identification: [ { position: 64 } ] }
      RefID,
      @UI: { lineItem: [ { position: 65 } ], identification: [ { position: 65 } ] }
      RegionName,
      @UI: { lineItem: [ { position: 66 } ], identification: [ { position: 66 } ] }
      GLText,
      @UI: { lineItem: [ { position: 67 } ], identification: [ { position: 67 } ] }
      RFQ,
      
     // added on 10.09.2026 by GK
      @UI: { lineItem: [ { position: 67 } ], identification: [ { position: 67 } ] }
      PORevisionDate,
      
      @UI: { lineItem: [ { position: 68 } ], identification: [ { position: 68 } ] }
      POPendignQty,
      
      @UI: { lineItem: [ { position: 69 } ], identification: [ { position: 69 } ] }
      RFQDate,
      
      @UI: { lineItem: [ { position: 70 } ], identification: [ { position: 70 } ] }
      pra_ref_no,
      
      @UI: { lineItem: [ { position: 71 } ], identification: [ { position: 71 } ] }
      PRACreationDate,
      
      @UI: { lineItem: [ { position: 72 } ], identification: [ { position: 72 } ] }
      ManNo,
      
//      @UI: { lineItem: [ { position: 73 } ], identification: [ { position: 73 } ] }
//      cast( ManDate as abap.dats ) as Mdate,
      
      @UI: { lineItem: [ { position: 74 } ], identification: [ { position: 73 } ] }
      DownPaymentAmount,
      
      @UI: { lineItem: [ { position: 75 } ], identification: [ { position: 74 } ] }
      PaymentTerms as ZPO_PaymentTerms,
      
      @UI: { lineItem: [ { position: 76 } ], identification: [ { position: 75 } ] }
      PaymentTermsName
}

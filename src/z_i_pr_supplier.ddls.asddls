@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register Supplier Data'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_PR_Supplier
  as select from I_OperationalAcctgDocItem as AItemK
  association [1..1] to I_Supplier as Sup on Sup.Supplier = AItemK.Supplier
  
 // association [1..1] to I_AccountingDocumentJournal as ADoc on ADoc.CompanyCode = AItemK.CompanyCode
 //                                     and ADoc.AccountingDocument = AItemK.AccountingDocument
 //                                     and ADoc.FiscalYear = AItemK.FiscalYear
{
  key AItemK.CompanyCode            as CompanyCode,
  key AItemK.AccountingDocument     as AccDoc,
  key AItemK.FiscalYear             as Fiscalyear,
  key AItemK.AccountingDocumentItem as Item,
      AItemK.PaymentTerms           as PaymentTerms,
      AItemK.AccountingDocumentType as DocType,
      AItemK.BusinessPlace          as BusinessPlace,
      AItemK.Supplier               as Supplier,
      AItemK.AssignmentReference    as Assignment,
      Sup.TaxNumber3                as GSTIN,
      Sup.SupplierName              as SName,
      Sup.Country                   as SCountry,
      Sup.Region                    as SRegion,
      Sup.SupplierLanguage          as SLang
   //   ADoc( P_Language:'E' ).DocumentReferenceID as DocRefID
}
where
  AItemK.FinancialAccountType = 'K'

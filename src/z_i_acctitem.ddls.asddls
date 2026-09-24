@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting Doc Item View'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_AcctItem as select from I_OperationalAcctgDocItem as AccItem
association [1..1] to I_GLAccountText as GLText on GLText.GLAccount = AccItem.GLAccount and
                                                   GLText.Language = 'E'
{
    key AccItem.CompanyCode as CompanyCode,
    key AccItem.AccountingDocument as AccDoc,
    key AccItem.FiscalYear as Fiscalyear,
    key AccItem.AccountingDocumentItem as AccItem,
        AccItem.Plant as Plant,
        AccItem.OriginalReferenceDocument as Miro,
        AccItem.DocumentDate as DocumentDate,
        AccItem.PostingDate as PostingDate,
        AccItem.PurchasingDocument as PO,
        AccItem.PurchasingDocumentItem as POItem,
        AccItem.IN_HSNOrSACCode as HSN,
        AccItem.Product as Material,
        @Semantics.quantity.unitOfMeasure: 'UOM'
        AccItem.Quantity as Quantity,
        AccItem.BaseUnit as UOM,
        AccItem.TransactionCurrency as Currency,
        AccItem.GLAccount as GLAccount,
        GLText.GLAccountLongName as GLText,
        AccItem.TaxCode as TaxCode,
        @Semantics.amount.currencyCode: 'Currency'
        AccItem.AmountInTransactionCurrency as GSTTaxableAmount,
        AccItem.TaxItemAcctgDocItemRef as TaxItem,
        AccItem.TransactionTypeDetermination as TDet
}
where AccItem.FinancialAccountType <> 'K' and
      ( AccItem.AccountingDocumentType = 'RE' or AccItem.AccountingDocumentType = 'KR' or 
        AccItem.AccountingDocumentType = 'KG' or AccItem.AccountingDocumentType = 'RK' ) and  
      AccItem.AccountingDocumentItemType <> 'T' and
      AccItem.TransactionTypeDetermination <> 'WIT' and
      AccItem.TransactionTypeDetermination <> 'FR1'  

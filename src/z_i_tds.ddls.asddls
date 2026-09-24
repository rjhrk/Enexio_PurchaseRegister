@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TDS Value Purchase Register'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_TDS as select from I_OperationalAcctgDocItem as TDS
{
key TDS.CompanyCode as CompanyCode,
    key TDS.AccountingDocument as AccDoc,
    key TDS.FiscalYear as Fiscalyear,
    key TDS.AccountingDocumentItem as AccItem,
    TDS.TransactionTypeDetermination as TType,
    @Semantics.amount.currencyCode: 'CUR'
    TDS.AmountInTransactionCurrency as TDS,
    TDS.TransactionCurrency as CUR ,
    TDS.TaxItemAcctgDocItemRef as TaxItem
}
where TDS.TransactionTypeDetermination = 'WIT'


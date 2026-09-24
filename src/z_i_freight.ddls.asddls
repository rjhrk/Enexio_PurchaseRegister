@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase register Freight'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_Freight as select from I_OperationalAcctgDocItem as Freight
{
    key Freight.CompanyCode as CompanyCode,
    key Freight.AccountingDocument as AccDoc,
    key Freight.FiscalYear as Fiscalyear,
    key Freight.AccountingDocumentItem as AccItem,
    @Semantics.amount.currencyCode: 'Cur'
    Freight.AmountInTransactionCurrency as TaxAmt,
    Freight.TransactionCurrency as Cur
}
 where Freight.TransactionTypeDetermination = 'FR1'

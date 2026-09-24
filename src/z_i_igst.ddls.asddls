@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SGST for Purchase Register'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_IGST as select from Z_I_AcctItem as ITax1 
association [1..1] to I_OperationalAcctgDocItem as ITax on ITax.CompanyCode = ITax1.CompanyCode
                                                   and ITax.AccountingDocument = ITax1.AccDoc
                                                   and ITax.FiscalYear = ITax1.Fiscalyear
                                                   and ITax.TaxItemAcctgDocItemRef = ITax1.TaxItem 
                   
{
    key ITax1.CompanyCode as CCode,
    key ITax1.AccDoc as AcDoc,
    key ITax1.Fiscalyear as FYear,
    key ITax1.AccItem as TItem,
    ITax1.TaxCode as TaxCode,
    ITax.TaxItemAcctgDocItemRef as TaxItem,
//    STax1.AccountingDocumentItemType as ADocType
    ITax.TransactionCurrency as Currency ,
    @Semantics.amount.currencyCode: 'Currency'
    ITax.AmountInTransactionCurrency as TCur
}
 where ITax.TransactionTypeDetermination = 'JII' 

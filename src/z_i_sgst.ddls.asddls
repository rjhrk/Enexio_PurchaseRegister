@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SGST for Purchase Register'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_SGST as select from Z_I_AcctItem as STax1 
association [1..1] to I_OperationalAcctgDocItem as STax on STax.CompanyCode = STax1.CompanyCode
                                                   and STax.AccountingDocument = STax1.AccDoc
                                                   and STax.FiscalYear = STax1.Fiscalyear
                                                   and STax.TaxItemAcctgDocItemRef = STax1.TaxItem 
                   
{
    key STax1.CompanyCode as CCode,
    key STax1.AccDoc as AcDoc,
    key STax1.Fiscalyear as FYear,
    key STax1.AccItem as TItem,
    STax1.TaxCode as TaxCode,
    STax.TaxItemAcctgDocItemRef as TaxItem,
//    STax1.AccountingDocumentItemType as ADocType
    STax.TransactionCurrency as Currency ,
    @Semantics.amount.currencyCode: 'Currency'
    STax.AmountInTransactionCurrency as TCur
}
 where STax.TransactionTypeDetermination = 'JIS' 


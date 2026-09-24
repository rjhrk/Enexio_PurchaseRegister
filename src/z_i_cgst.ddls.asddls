@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SGST for Purchase Register'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_CGST as select from Z_I_AcctItem as CTax1 
association [1..1] to I_OperationalAcctgDocItem as CTax on CTax.CompanyCode = CTax1.CompanyCode
                                                   and CTax.AccountingDocument = CTax1.AccDoc
                                                   and CTax.FiscalYear = CTax1.Fiscalyear
                                                   and CTax.TaxItemAcctgDocItemRef = CTax1.TaxItem 
                   
{
    key CTax1.CompanyCode as CCode,
    key CTax1.AccDoc as AcDoc,
    key CTax1.Fiscalyear as FYear,
    key CTax1.AccItem as TItem,
    CTax1.TaxCode as TaxCode,
    CTax.TaxItemAcctgDocItemRef as TaxItem,
//    STax1.AccountingDocumentItemType as ADocType
    CTax.TransactionCurrency as Currency ,
    @Semantics.amount.currencyCode: 'Currency'
    CTax.AmountInTransactionCurrency as TCur
}
 where CTax.TransactionTypeDetermination = 'JIC' 

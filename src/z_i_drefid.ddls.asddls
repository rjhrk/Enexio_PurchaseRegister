@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register Document Reference ID'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_DRefID as select from I_JournalEntry as JE
{
    key JE.CompanyCode as CCOde,
    key JE.AccountingDocument as Adoct,
    key JE.FiscalYear as FYear,
        JE.DocumentReferenceID as RefID    
}

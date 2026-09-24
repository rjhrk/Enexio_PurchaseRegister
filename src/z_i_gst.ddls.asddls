@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Combine Tax for Purchase Register'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_GST as select from Z_I_AcctItem as jh
association [1..1] to Z_I_CGST as a 
            on a.CCode = jh.CompanyCode and
             jh.AccDoc = a.AcDoc and
             jh.Fiscalyear = a.FYear and 
             jh.TaxCode = a.TaxCode
association [1..1] to Z_I_SGST as b
              on jh.CompanyCode = b.CCode and
             jh.AccDoc = b.AcDoc and
             jh.Fiscalyear = b.FYear and
             jh.TaxCode = b.TaxCode
association [1..1] to Z_I_IGST as c
              on jh.CompanyCode = c.CCode and
             jh.AccDoc = c.AcDoc and
             jh.Fiscalyear = c.FYear and
             jh.TaxCode = c.TaxCode            
{
    key a.CCode,
    key a.AcDoc,
    key a.FYear,
        @Semantics.amount.currencyCode: 'Currency'
        a.TCur as CGST,
        a.Currency,
        @Semantics.amount.currencyCode: 'Currency'
        b.TCur as SGST,
        @Semantics.amount.currencyCode: 'Currency'
        c.TCur as IGST
}

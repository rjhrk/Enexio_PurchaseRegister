@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier with Region'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_Sup_REg as select distinct from Z_I_PR_Supplier as Sup 
association [1..1] to Z_I_SRegion as Region on Region.Country = Sup.SCountry
                                            and Region.Lang = 'E'
                                            and Region.Region = Sup.SRegion
{
    key Sup.CompanyCode as CCode,
    key Sup.AccDoc as AcDoc,
    key Sup.Fiscalyear as Fyear, 
        Sup.Supplier,
        Region.RegionName
}
group by Sup.CompanyCode,
         Sup.AccDoc,
         Sup.Fiscalyear,   
         Sup.Supplier,
         Region.RegionName

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier Region Name'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_SRegion as select distinct from I_RegionText as RegionText      
{
    key RegionText.Country as Country,
    key RegionText.Region as Region,
        RegionText.Language as Lang,
        RegionText.RegionName as RegionName
}

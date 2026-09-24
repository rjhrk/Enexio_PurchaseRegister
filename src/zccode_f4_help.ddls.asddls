@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
//@AbapCatalog.compiler.compareFilter: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.supportedCapabilities: [#CDS_MODELING_ASSOCIATION_TARGET, #CDS_MODELING_DATA_SOURCE, #SQL_DATA_SOURCE, #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY]
@EndUserText.label: 'Company Code F4 Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCCode_F4_Help as select from I_CompanyCode as Companycode
{
    key Companycode.CompanyCode as CompanyCode,
        Companycode.CompanyCodeName as CompanyName
        
}
group by Companycode.CompanyCode,
         Companycode.CompanyCodeName

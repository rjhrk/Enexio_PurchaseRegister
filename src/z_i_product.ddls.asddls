@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Details'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_Product as select from I_Product as Product 
association [1..1] to  I_ProductGroupText_2
 as PText on PText.ProductGroup = Product.ProductGroup and PText.Language = 'E'
 association [1..1] to I_ProductDescription as PDes on PDes.Product = Product.Product
                                        and PDes.Language = 'E'
{
    key Product.Product as Product,
        Product.ProductType as ProductType,
        Product.ProductGroup as ProductGroup,
        PDes.ProductDescription as PDescription,
        PText.ProductGroupText as PGroupText,
        PText.Language      
}

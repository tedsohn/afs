@EndUserText.label: 'ZC_MRC'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define root view entity ZC_MRC 
  provider contract transactional_query
  as projection on ZI_MRC
{
    key MrcUuid,
    
    Code,
    Description,
    LongDescription,
    
    MultipleIterations,
    FffRelated,
    ModeCode,
    IsTemporary,
    CreatedBy,
    CreatedAt,
    LastChangedAt,
    LastChangedBy,
    LocalLastChanged,
    
    /* Associations */
    _build: redirected to composition child ZC_BUILD

}

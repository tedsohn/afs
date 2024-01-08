
@EndUserText.label: 'ZC_BUILD'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_BUILD as projection on ZI_BUILD
{
    key MrcBuildUuid,
    LineItem,
    
    Code,
    Description,
    LongDescription,
    
    MrcUuid,
    ReplyTableUuid,
    Replytable,
    IsTemporary,
    CreatedBy,
    CreatedAt,
    LastChangedAt,
    LastChangedBy,
    LocalLastChanged,
    
    /* Associations */
    _mrc   : redirected to parent ZC_MRC,
    _reply : redirected to composition child ZC_REPLY

}

@EndUserText.label: 'ZC_REPLYCODE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_REPLYCODE as projection on ZI_REPLYCODE
{
    key ReplyCodeUuid,
    ReplyTableUuid,
    
    Code,
    Description,
    LongDescription,
    
    IsTemporary,
    CreatedBy,
    CreatedAt,
    LastChangedAt,
    LastChangedBy,
    LocalLastChanged,
    
    MRCUUID,
    MRCBuildUuid, 
    /* Associations */
    _mrc : redirected to ZC_MRC, 
    _build : redirected to ZC_BUILD, 
    _reply: redirected to parent ZC_REPLY 
}

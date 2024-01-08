@EndUserText.label: 'ZC_REPLY'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_REPLY as projection on ZI_REPLY
{
    key ReplytableUuid,
    MRCBuildUuid,
    Replytable,
    Replycodesize,
    Isac,
    
    Code,
    Description,
    LongDescription,    
    
    Istemporary,
    CreatedBy,
    CreatedAt,
    LastChangedAt,
    LastChangedBy,
    LocalLastChanged,
    MRCUUID,
    /* Associations */
    _mrc : redirected to ZC_MRC ,   
    _build : redirected to parent ZC_BUILD, 
    _replycode : redirected to composition child ZC_REPLYCODE
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_REPLYCODE'
define view entity ZI_REPLYCODE as select from zreplycode
  association to parent ZI_REPLY as _reply on $projection.ReplyTableUuid = _reply.ReplytableUuid
  
  association to ZI_MRC as _mrc on _mrc.MrcUuid = $projection.MRCUUID        
  association to ZI_BUILD as _build on _build.MrcBuildUuid = $projection.MRCBuildUuid  
    
{
    key zreplycode.reply_code_uuid as ReplyCodeUuid,
    zreplycode.reply_table_uuid as ReplyTableUuid,
    
    zreplycode.code                as Code, 
    zreplycode.description         as Description, 
    zreplycode.long_description    as LongDescription,
    
    zreplycode.is_temporary as IsTemporary,
    zreplycode.created_by as CreatedBy,
    zreplycode.created_at as CreatedAt,
    zreplycode.last_changed_at as LastChangedAt,
    zreplycode.last_changed_by as LastChangedBy,
    zreplycode.local_last_changed as LocalLastChanged,    
    _reply.MRCUUID as MRCUUID, 
    _reply.MRCBuildUuid as MRCBuildUuid, 
    
        'XS'                        as SpecSize, 
        '3D  '                      as Dimension,  
        $projection.SpecSize        as SizeDisplay, 
        $projection.Dimension       as DimensionDisplay,
    //association
    _mrc,  
    _build,    
    _reply 
}

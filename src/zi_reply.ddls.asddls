@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_REPLY'
define view entity ZI_REPLY
  as select from zreplytable
  composition [0..*] of ZI_REPLYCODE    as _replycode
  association to parent ZI_BUILD as _build on $projection.MRCBuildUuid = _build.MrcBuildUuid

  association to ZI_MRC as _mrc on _mrc.MrcUuid = $projection.MRCUUID   //_build.mrc.MrcUuid
    
{
  key zreplytable.replytable_uuid    as ReplytableUuid,
      zreplytable.build_uuid         as MRCBuildUuid,
      zreplytable.replytable         as Replytable,
      zreplytable.replycodesize      as Replycodesize,
      zreplytable.isac               as Isac,
      
    zreplytable.code                as Code,
    zreplytable.description         as Description,
    zreplytable.long_description    as LongDescription,
      
      zreplytable.istemporary        as Istemporary,
      zreplytable.created_by         as CreatedBy,
      zreplytable.created_at         as CreatedAt,
      zreplytable.last_changed_at    as LastChangedAt,
      zreplytable.last_changed_by    as LastChangedBy,
      zreplytable.local_last_changed as LocalLastChanged,
      _build.MrcUuid                  as MRCUUID,
      
        '       '                  as  SpecSize, 
        '       '                  as Dimension,
        $projection.SpecSize        as SizeDisplay, 
        $projection.Dimension       as DimensionDisplay,
        
    //association
      _mrc,  
      _build,    
      _replycode // Make association public
}

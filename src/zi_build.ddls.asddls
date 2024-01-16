@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_BUILD'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BUILD
  as select from zmrcbuild
  composition [0..*] of ZI_REPLY as _reply
  association to parent ZI_MRC as _mrc on $projection.MrcUuid = _mrc.MrcUuid
{
  key zmrcbuild.mrc_build_uuid     as MrcBuildUuid,
  
    zmrcbuild.code                as Code,
    zmrcbuild.description         as Description,
    zmrcbuild.long_description    as LongDescription,
  
      zmrcbuild.line_item          as LineItem,
      zmrcbuild.mrc_uuid           as MrcUuid,
      zmrcbuild.reply_table_uuid   as ReplyTableUuid,
      zmrcbuild.replytable         as Replytable,
      zmrcbuild.is_temporary       as IsTemporary,
      zmrcbuild.created_by         as CreatedBy,
      zmrcbuild.created_at         as CreatedAt,
      zmrcbuild.last_changed_at    as LastChangedAt,
      zmrcbuild.last_changed_by    as LastChangedBy,
      zmrcbuild.local_last_changed as LocalLastChanged,
      
        '    '                  as  SpecSize, 
        '    '                  as Dimension,
        $projection.SpecSize        as SizeDisplay, 
        $projection.Dimension       as DimensionDisplay, 
    
        
      _mrc, 
      _reply // Make association public
}

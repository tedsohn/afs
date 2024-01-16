@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MRC'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_MRC
  as select from zmrc
  composition [0..*] of ZI_BUILD as _build
{
  key zmrc.mrc_uuid            as MrcUuid,
  
      zmrc.code                as Code,
      zmrc.description         as Description,
      zmrc.long_description    as LongDescription,
      
      zmrc.multiple_iterations as MultipleIterations,
      zmrc.fff_related         as FffRelated,
      zmrc.mode_code           as ModeCode,
      zmrc.is_temporary        as IsTemporary,
      zmrc.created_by          as CreatedBy,
      zmrc.created_at          as CreatedAt,
      zmrc.last_changed_at     as LastChangedAt,
      zmrc.last_changed_by     as LastChangedBy,
      zmrc.local_last_changed  as LocalLastChanged,

        '       '                  as SpecSize, 
        '       '                  as Dimension,  
        $projection.SpecSize        as SizeDisplay, 
        $projection.Dimension       as DimensionDisplay,
        
        
    
      _build // Make association public
}

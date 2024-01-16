@AbapCatalog.sqlViewName: 'ZINODES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flat Nodes'
define view ZI_NODES 
as select from ZI_MRC  
{
    key '1'             as NodeLevel,
    key MrcUuid         as NodeKey,
    Code                as NodeCode,
    Description         as NodeDescription,
    MrcUuid             as NodeParentKey,
    SpecSize            as NodeSize, 
    Dimension           as NodeDimension,
    DimensionDisplay    as NodeDimensionDisplay,
    SizeDisplay         as NodeSizeDisplay 

}    
union select from ZI_BUILD
{       
    key '2'             as NodeLevel,
    key MrcBuildUuid    as NodeKey,
        Code                as NodeCode,
    Description         as NodeDescription,
    MrcUuid             as NodeParentKey, 
    SpecSize            as NodeSize, 
    Dimension           as NodeDimension,
    DimensionDisplay    as NodeDimensionDisplay,
    SizeDisplay         as NodeSizeDisplay 
 
}
union select from ZI_REPLY
{   
    key '3'             as NodeLevel,
    key ReplytableUuid  as NodeKey,
        Code                as NodeCode,
    Description         as NodeDescription,
    MRCBuildUuid        as NodeParentKey,
    SpecSize            as NodeSize, 
    Dimension           as NodeDimension,
    DimensionDisplay    as NodeDimensionDisplay,
    SizeDisplay         as NodeSizeDisplay 

}
union select from ZI_REPLYCODE
{       
    key '4'             as NodeLevel,
    key ReplyCodeUuid   as NodeKey,
        Code                as NodeCode,
    Description         as NodeDescription,
    ReplyTableUuid      as NodeParentKey,
        SpecSize            as NodeSize, 
    Dimension           as NodeDimension,
    DimensionDisplay    as NodeDimensionDisplay,
    SizeDisplay         as NodeSizeDisplay 
 
}

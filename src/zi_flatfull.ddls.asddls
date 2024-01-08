@AbapCatalog.sqlViewName: 'ZIFLATFULL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flat Nodes'
define view ZI_FLATFULL as select from ZI_MRC
  association [1] to ZI_BUILD as _build on $projection.MRCUUID = _build.MrcUuid
  association [1] to ZI_REPLY as _reply on $projection.BuildUUID = _reply.MRCBuildUuid  
  association [1] to ZI_REPLYCODE as _replyCode on $projection.ReplyTableUUID = _replyCode.ReplyCodeUuid
{
    key MrcUuid as MRCUUID,
    Code as MRCCode,
    Description as MRCDescription,
    
    _build.MrcBuildUuid as BuildUUID, 
    _build.Code as BuildCode,
    _build.Description as BuildDescription, 
    
    _build._reply.ReplytableUuid as ReplyTableUUID,
    _build._reply.Code as ReplyTableCode, 
    _build._reply.Description as ReplyTableDescription, 
    
    _build._reply._replycode.ReplyCodeUuid as ReplyCodeUUID, 
    _build._reply._replycode.Code as ReplyCode,
    _build._reply._replycode.Description as ReplyCodeDescription,

    /* Associations */
    _build, 
    _reply,
    _replyCode
}

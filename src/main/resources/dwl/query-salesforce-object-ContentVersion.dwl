%dw 2.0
output text/plain
---
"SELECT Id, ContentDocumentId, IsLatest, ContentUrl, VersionNumber, Title, Description, 
ReasonForChange, PathOnClient, RatingCount, IsDeleted, ContentModifiedDate, ContentModifiedById, 
PositiveRatingCount, NegativeRatingCount, FeaturedContentBoost, FeaturedContentDate, CurrencyIsoCode,
 OwnerId, CreatedById, CreatedDate, LastModifiedById, LastModifiedDate, SystemModstamp, TagCsv,
 FileType, PublishStatus, VersionData, ContentSize, FileExtension, FirstPublishLocationId, Origin, 
NetworkId, ContentLocation, ExternalDocumentInfo1, ExternalDocumentInfo2, ExternalDataSourceId, 
Checksum, IsMajorVersion, Field_Image_URL__c, dfsle__GeneratedFileFormat__c, dfsle__GeneratedFileName__c,
 dfsle__GeneratedFileSuffix__c, dfsle__Rule__c 
FROM ContentVersion WHERE IsLatest = true and ContentDocumentId = '" ++ (vars.currentProject.sfDocumentId default "") ++ "'" 
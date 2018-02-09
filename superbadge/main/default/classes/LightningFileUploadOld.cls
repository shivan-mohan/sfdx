public class LightningFileUploadOld {
    @AuraEnabled
    public static String uploadFile(Id parentId, String fileName, String base64Data, String contentType) {
        
        Attachment a = new Attachment();
        a.parentId = parentId;

        a.Body = EncodingUtil.base64Decode(base64Data);
        a.Name = fileName;
        a.ContentType = contentType;
        
        try {
            insert a;
        }
        catch(Exception e) {
            return e.getMessage();
        }
        
        return String.valueOf(a.Id);
    }
}
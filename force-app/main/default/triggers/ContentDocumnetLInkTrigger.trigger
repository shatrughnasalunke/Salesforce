trigger ContentDocumnetLInkTrigger on ContentDocumentLink (After insert) {
    ContentDocumnetLInkTriggerHelper.sendMultipleFile(Trigger.newMap, Trigger.oldMap);
}
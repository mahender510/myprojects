trigger AccountTriggerEx on Account (before insert) {
    HandleDuplicateRecords hdr=new HandleDuplicateRecords();
    hdr.getRecords(trigger.new);
    //hdr.getRecordsList(trigger.new);
}
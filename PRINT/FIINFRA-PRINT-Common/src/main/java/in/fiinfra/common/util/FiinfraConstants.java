/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package in.fiinfra.common.util;

/**
 *
 * @author Nikhil Thakkar
 */
public class FiinfraConstants {

    /**
     * checks the database operation successfully executed or not.
     */
    public static final String fail = "fail";
    public static final String success = "success";
    public static final String error = "error";
    public static final String EMPTY_RESULT_SET = "EMPTY_RESULT_SET";
    public static final String FAIL = "fail";
    public static final String SUCCESS = "success";
    /**
     * below constant is used for getting data from session.
     */
    public static final String userId = "validUserName";
//    public static final String userType = "usertype";

    /**
     * below constants is used for checking name available or not.
     */
    public static final String yes = "yes";
    public static final String no = "no";
    /**
     * below constants is used to check wither data is updated or not.
     */
    public static final int zero = 0;
    /**
     * below constants is used for redirecting page to login.
     */
    public static final String login = "loginPage";

   
    /**
     * below constant is used to check if the string equals to 1
     */

    public static final String one = "1";
    
    /**
     * below constants are name of code type
     */
    public static final String userType = "PartyType";
    public static final String country = "Countries";
    public static final String state = "State";
    public static final String city = "Cities";
    public static final String salutation = "Salutation";
    public static final String sceurityQuestions = "SceurityQuestions";
    public static final String ffrredomUserName = "FfreedomUserName";
    public static final String ffreedomPassword = "FfreedomPassword";
    public static final String queryType = "Query type";
    public static final String INTERESTED_IN = "Interested_In__c";
    public static final String LEAD_STATUS = "Status";
    public static final String branchLocation = "BranchLocation";
    
    
    /**
     * below constants are the event ids for notification
     */
    
    public static final int NEWPARTNEREVENT=9;
    public static final int NEWADMINEVENT=7;
    public static final int NEWMEMBEREVENT=8;
    public static final int NEWOPSEVENT=106;
    public static final int PATHFINDERACTIVATIONEVENT=10;
    public static final int PATHFINDERREACTIVATIONEVENT=11;
    public static final int FORGOTPASSWORDEVENT=12;
    public static final int QUERYMEMBEREVENT=13;
    public static final int QUERYPARTNEREVENT=14;
    public static final int QUERYLEADEVENT=15;
    public static final int DATACOLLECTIONACCEPTEVENT=16;
    public static final int DATACOLLECTIONRESUBMITEVENT=17;
    public static final int DATACOLLECTIONSUBMITMEMBEREVENT=18;
    public static final int DATACOLLECTIONSUBMITPARTNEREVENT=19;
    public static final int PATHFINDERINPUTACCEPTEVENT=20;
    public static final int PATHFINDERINPUTRESUBMITEVENT=21;
    public static final int PATHFINDERSUBMIT=22;
    public static final int SCHEDULEPARTNERREPORTEVENT=23;
    public static final int QUERYCOMMENTMEMBER=24;
    public static final int QUERYCOMMENTPARTNERONMEMBEREVENT=25;
    public static final int QUERYCOMMENTLEADEVENT=26;
    public static final int PATHFINDERATTACHMENTEVENT=27;
    public static final int QUERYMEMBERBYPARTNEREVENT=30;
    public static final int QUERYLEADBYPARTNEREVENT=31;
    public static final int QUERYCOMMENTPARTNERONLEADEVENT=32;
    public static final int QUERYCOMMENTPSTONMEMBEREVENT=33;
    public static final int QUERYCOMMENTPSTONLEADEVENT=34;
    public static final int QUERYCOMMENTPARTNERONSELFEVENT=35;
    public static final int QUERYCOMMENTPARTNERONMEMBERPRIVATEEVENT=36;
    public static final int QUERYCOMMENTPARTNERONLEADPRIVATEEVENT=37;
    public static final int QUERYCOMMENTPSTONMEMBERPRIVATEEVENT=38;
    public static final int QUERYCOMMENTPSTONLEADPRIVATEEVENT=39;
    public static final int QUERYCOMMENTPSTONPARTNEREVENT=40;
    public static final int PFREMINDERTOLEADEVENT=28;
    public static final int CHATTERPARTNERTOMEMBER=111;
    public static final int CHATTER_COMMENT_PARTNERTOMEMBER=112;
    public static final int CHATTER_POST_PARTNERTO_LEAD=113;
    public static final int CHATTER_COMMENT_PARTNERTO_LEAD=114;
    public static final int CHATTER_POST_TAG_PST_PARTNER_TO_MEMBER=115;
    public static final int CHATTER_COMMENT_TAG_PST_PARTNER_TO_MEMBER=116;
    public static final int CHATTER_POST_TAG_MST_PARTNER_TO_MEMBER=117;
    public static final int CHATTER_COMMENT_TAG_MST_PARTNER_TO_MEMBER=118;
    public static final int CHATTER_POST_TAG_FPA_PARTNER_TO_MEMBER=119;
    public static final int CHATTER_COMMENT_TAG_FPA_PARTNER_TO_MEMBER=120;
    public static final int CHATTER_POST_TAG_MST2_PARTNER_TO_MEMBER=121;
    public static final int CHATTER_COMMENT_TAG_MST2_PARTNER_TO_MEMBER=122;
    public static final int CHATTER_POST_TAG_PST_PARTNER_TO_LEAD=123;
    public static final int CHATTER_COMMENT_TAG_PST_PARTNER_TO_LEAD=124;
    
    public static final int CHATTER_COMMENT_MEMBER_To_PARTNER=133;
    public static final int CHATTER_POST_MEMBER_To_PARTNER=134;
    
    public static final int ADDNEWTASK = 104;

    public static final int EDITTASK = 105;

    public static final int SCEDUALPARTNERREPORT = 23;
    
    public static final int WORKSTATIONCHANGEPARTNEREVENTOPS = 107;
    public static final int WORKSTATIONCHANGEMEMBEREVENTOPS = 108;
    public static final int WORKSTATIONCHANGELEADEVENTOPS = 109;
    
    public static final int WELCOMEKITAGREED = 126;
    public static final int WELCOMEKITDISAGREED = 127;
    public static final int WELCOMEKITUPDATED = 135;
    
    
    public static final int CHATTER_POST_PST_TO_PARTNER=138;
    public static final int CHATTER_COMMENT__OPS=139;
    public static final int CHATTER_POST_PST_TO_FPA=140;
    
    public static final int CHATTER_POST_MST_TO_PARTNER=141;
    public static final int CHATTER_POST_MST_TO_PST=142;
    public static final int CHATTER_POST_MST_TO_FPA=143;
    
    public static final int CHATTER_POST_FPA_TO_PARTNER=144;
    public static final int CHATTER_POST_FPA_TO_PST=145;
    public static final int CHATTER_POST_FPA_TO_MST=146;
    
    /**
     * below constants are owner types for events
     */
    
    public static final int PARTNER=185002;
    public static final int LEAD=185003;
    public static final int MEMBER=185001;
    public static final int USER=185004;
    public static final int TASK = 185005;
    
    
    
    
    /**
     * following constant is Ffreedom business unit id
     * 
     */
    
    public static final int FFREEDOMBUID=154;
    public static final int AXISMFBUID=153;
    public static final int BU_DEFAULT=AXISMFBUID;
    
    
    public static final int MAX_FILE_SIZE=5242880;
    
    
    
    /**
     * following constants are profile section names
     */
    public static final String PROFILE_PERSONAL_INFO_2="PersonalInfo2";
    public static final String PROFILE_EMAIL_DETAILS="EmailDetails";
    public static final String PROFILE_EMAIL_SIGNATURE="EmailSignature";
    public static final String PROFILE_EMAIL_DISCLAIMER="EmailDisclaimer";
    public static final String PROFILE_EMAIL_DND="EmailDND";
    public static final String PROFILE_BANK_DETAILS="BankDetails";
    public static final String PROFILE_USER_ACCOUNT_DETAILS="UserAccountDetails";
    public static final String PROFILE_RECIDENCE_ADDRESS="RecidenceAddress";
    public static final String PROFILE_OFFICE_ADDRESS="OfficeAddress";
    public static final String PROFILE_PERSONAL_INFO_1="PersonalInfo1";
    public static final String PROFILE_EMAIL_OTHER_DETAILS="EmailOtherDetails";
    public static final String PROFILE_FINANCIAL_PRODUCTS="FinancialProduct";
    
    /**
     * following constants are Opportunity Profile section names
     */
    public static final String OPPORTUNITY_PERSONAL_DETAILS="PersonalDetails";
    public static final String OPPORTUNITY_CONTACT_DETAILS="ContactDetails";
    public static final String OPPORTUNITY_FAMILY_DETAILS="FamilyDetails";
    public static final String OPPORTUNITY_ORIGINATION_DETAILS="OriginationDetails";
    public static final String OPPORTUNITY_TRACKER_DETAILS="TrackerDetails";
    public static final String OPPORTUNITY_NOTES_DETAILS="NotesDetails";
    public static final String OPPORTUNITY_DOCUMENT_DETAILS="DocumentDetails";
    public static final String OPPORTUNITY_ASSUMPTION_DETAILS="AssumptionDetails";
    
    /*
     * STORED PROCEDURE NAMES
     * */
     public static final String SP_USP_CP_GET_CODEVALUES_BY_CODETYPEID ="{CALL usp_cp_getCodeValuesByCodeTypeId(?,?)}";
     public static final String SP_USP_CP_TEST_GET_CONTACT_TYPES = "{CALL usp_cp_test_getContactTypes(?)}";
     public static final String SP_USP_CP_GET_USER_LIST_BY_OWNERPARTY_ID = "{CALL usp_cp_getUserListByOwnerPartyId(?,?)}";
     public static final String SP_USP_PP_GET_RECENT_CHATTER_FEEDS_FOR_PARTTNER = "{CALL usp_pp_GetRecentChatterFeedsForParttner(?,?,?)}";
     public static final String SP_USP_CP_GET_DOWNLOADS_LIST = "{CALL usp_cp_getDownloadsList(?)}";
     public static final String SP_USP_CP_GET_FAQS_LIST = "{CALL usp_cp_getFaqsList(?)}";
     public static final String SP_USP_CP_GET_CONTACT_US_DETAILS = "{CALL usp_cp_getContactUsDetails(?)}" ;
     public static final String SP_USP_CP_SAVE_QUERY = "{CALL usp_cp_saveQuery()}";
     public static final String SP_USP_CP_DELETE_QUERIES = "{CALL usp_cp_deleteQueries(?)}";
     public static final String SP_DO_AUDIT = ("{CALL usp_frw_doAudit(?,?,?,?,?,?,?,?,?,?,?,?)}");
     public static final String SP_INSERT_NOTIFICATION = "{CALL usp_frw_insertNotification(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
    
    
    
     /**
      * below constants are the event ids for audit
      */
     
     public static final int PARTNER_PROFILE_UPDATE=97001;
     public static final int OPPORTUNITY_PROFILE_UPDATE=97002;
     
     
     /**
      * below constants are the source system ids for audit
      */
     
     public static final int PARTNER_PORTAL=31001;
    
     
    
}
